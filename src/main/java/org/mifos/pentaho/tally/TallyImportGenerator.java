package org.mifos.pentaho.tally;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mifos.pentaho.tally.message.TallyMessage;

import freemarker.template.Configuration;
import freemarker.template.DefaultObjectWrapper;
import freemarker.template.Template;
import freemarker.template.TemplateException;

public class TallyImportGenerator {

    private static Configuration cfg;

    private static SimpleDateFormat tallyDateFormat = new SimpleDateFormat("yyyyMMdd");

    public static void process() throws Exception {
        PrintWriter file = new PrintWriter(new File("/tmp/TallyOutput-"+tallyDateFormat.format(new Date())+".xml"));
        file.print(getTallyReportData());
        file.close();
    }

    public static String getTallyReportData() throws Exception {

        Template temp = getFTLConfig().getTemplate("master.ftl");

        List<TallyMessage> tallyMessages = getTallyMessagesFromTmpOutputFile();

        /* Create a data-model */
        Map<String, Object> root = new HashMap<String, Object>();
        Map<String, Object> tallyMessage = new HashMap<String, Object>();
        root.put("tallyMessage", tallyMessage);
        tallyMessage.put("headOfficeName", "HEAD OFFICE");
        tallyMessage.put("data", getMasterData(tallyMessages));
        StringWriter bow = new StringWriter();
        temp.process(root, bow);
        return bow.toString();
    }

    private static List<TallyMessage> getTallyMessagesFromTmpOutputFile() throws Exception {
        return ETLTextOutputReader.getTallyMessages();
    }

    private static String getMasterData(List<TallyMessage> tallyMessages) throws IOException, TemplateException {
        String tallyMessagesOutput = "";
        for (TallyMessage tallyMessage : tallyMessages) {
            tallyMessagesOutput += getTallyMessageData(tallyMessage);
        }
        return tallyMessagesOutput;
    }

    private static String getTallyMessageData(TallyMessage tallyMessage) throws TemplateException, IOException {
        Template temp = getFTLConfig().getTemplate("tally_mesage.ftl");
        /* Create a data-model */
        Map<String, Object> root = new HashMap<String, Object>();
        Map<String, Object> voucher = new HashMap<String, Object>();
        root.put("voucher", voucher);
        voucher.put("type", tallyMessage.getVoucherType().value);
        voucher.put("date", tallyDateFormat.format(tallyMessage.getVoucherDate()));
        voucher.put("data", getVoucherData(tallyMessage));
        StringWriter bow = new StringWriter();
        temp.process(root, bow);
        return bow.toString() + "\n";
    }

    private static String getVoucherData(TallyMessage tallyMessage) throws TemplateException, IOException {
        if (tallyMessage.getVoucherType() == VoucherType.JOURNAL) {
            return getJournalVoucherData(tallyMessage);
        }
        return getPaymentOrReceiptVoucherData(tallyMessage);
    }

    private static String getJournalVoucherData(TallyMessage tallyMessage) throws TemplateException, IOException {
        String allLedgersOutput = "";
        for (AllLedger allLedger : tallyMessage.getAllLedgers()) {
            allLedgersOutput += getAllLedgerData(allLedger);
        }
        return allLedgersOutput.substring(0, allLedgersOutput.length() -1);
    }

    private static String getPaymentOrReceiptVoucherData(TallyMessage tallyMessage) throws TemplateException,
            IOException {
        Template temp = getFTLConfig().getTemplate("payment_receipt.ftl");
        /* Create a data-model */
        Map<String, Object> root = new HashMap<String, Object>();
        Map<String, Object> voucher = new HashMap<String, Object>();
        root.put("voucher", voucher);
        voucher.put("partyLedgerName", tallyMessage.getPartyLedgerName());

        String allLedgersOutput = "";
        for (AllLedger allLedger : tallyMessage.getAllLedgers()) {
            allLedgersOutput += getAllLedgerData(allLedger);
        }
        voucher.put("allLedgers", allLedgersOutput.substring(0, allLedgersOutput.length()-1));

        if (tallyMessage.getIsDeemedPositive()) {
            voucher.put("partyIsDeemedPositive", "Yes");
            voucher.put("partyAmount", "-" + tallyMessage.getPartyLedgerAmount());
        } else {
            voucher.put("partyIsDeemedPositive", "No");
            voucher.put("partyAmount", tallyMessage.getPartyLedgerAmount());
        }
        StringWriter bow = new StringWriter();
        temp.process(root, bow);
        return bow.toString();
    }

    private static String getAllLedgerData(AllLedger allLedger) throws TemplateException, IOException {
        Template temp = getFTLConfig().getTemplate("all_ledgers.ftl");
        /* Create a data-model */
        Map<String, Object> root = new HashMap<String, Object>();
        Map<String, Object> ledger = new HashMap<String, Object>();
        root.put("ledger", ledger);
        ledger.put("name", allLedger.getLedgerName());
        if (allLedger.getIsDeemedPositive()) {
            ledger.put("isDeemedPositive", "Yes");
            ledger.put("amount", "-" + allLedger.getAmount());
        } else {
            ledger.put("isDeemedPositive", "No");
            ledger.put("amount", allLedger.getAmount());
        }
        ledger.put("branchName", allLedger.getBranchName());
        StringWriter bow = new StringWriter();
        temp.process(root, bow);
        return bow.toString() + "\n";
    }

    private static Configuration getFTLConfig() {
        if (cfg == null) {
            cfg = new Configuration();
            cfg.setClassForTemplateLoading(TallyImportGenerator.class, "");
            cfg.setObjectWrapper(new DefaultObjectWrapper());
        }
        return cfg;
    }

}
