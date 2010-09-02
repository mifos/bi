package org.mifos.pentaho.tally;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.StringTokenizer;

import org.mifos.pentaho.tally.message.TallyMessage;
import org.mifos.pentaho.tally.message.TallyMessageBuilder;
import org.mifos.pentaho.tally.message.TallyMessageBuilderException;

public class ETLOutputReader {

    private static SimpleDateFormat parseDateFormat = new SimpleDateFormat("yyyy-MM-dd");

    public static List<TallyMessage> getTallyMessages() throws Exception {
        File file = new File("/tmp/MifosTallyETLOutput.txt");
        return parseETLOutputFile(file);
    }

    protected static List<TallyMessage> parseETLOutputFile(File file) throws Exception {
        BufferedReader br = new BufferedReader(new FileReader(file));
        String line;

        // skip first line
        br.readLine();

        List<DataPerLine> wholeData = new ArrayList<DataPerLine>();

        while ((line = br.readLine()) != null) {
            wholeData.add(parseLine(line));
        }
        br.close();

        return generateTallyMessages(wholeData);
    }

    private static List<TallyMessage> generateTallyMessages(List<DataPerLine> wholeData)
            throws TallyMessageBuilderException, ParseException {
        List<TallyMessage> tallyMessages = new ArrayList<TallyMessage>();

        for (int i = 1; i < wholeData.size(); i++) {
            List<DataPerLine> voucher = new ArrayList<DataPerLine>();
            voucher.add(wholeData.get(i - 1));
            DataPerLine prevLine = wholeData.get(i - 1);
            DataPerLine currentLine = wholeData.get(i);

            while (i < wholeData.size() && prevLine.branchname.equals(currentLine.branchname)
                    && prevLine.voucherdate.equals(currentLine.voucherdate)
                    && prevLine.vouchertype.equals(currentLine.vouchertype)) {
                voucher.add(currentLine);
                i++;
                prevLine = wholeData.get(i - 1);

                if (i < wholeData.size()) {
                    currentLine = wholeData.get(i);
                }
            }

            VoucherType voucherType = getVoucherType(voucher.get(0).vouchertype);
            TallyMessageBuilder builder = new TallyMessageBuilder(voucherType, voucher.get(0).branchname);
            builder.withVoucherDate(getVoucherDate(voucher.get(0).voucherdate));

            for (DataPerLine voucherEntry : voucher) {
                addCreditEntry(voucherEntry, builder);
                addDebitEntry(voucherEntry, builder);
            }

            tallyMessages.add(builder.build());

        }
        return tallyMessages;
    }

    private static void addCreditEntry(DataPerLine voucherEntry, TallyMessageBuilder builder)
            throws TallyMessageBuilderException {
        BigDecimal amount = new BigDecimal(voucherEntry.credit);
        if (amount.compareTo(BigDecimal.ZERO) < 0) {
            throw new TallyMessageBuilderException("Negative credit amount found:");
        }
        if (amount.compareTo(BigDecimal.ZERO) > 0) {
            builder.addAllLegderEntry(voucherEntry.credit, voucherEntry.glcode, false);
        }
    }

    private static void addDebitEntry(DataPerLine voucherEntry, TallyMessageBuilder builder)
            throws TallyMessageBuilderException {
        BigDecimal amount = new BigDecimal(voucherEntry.debit);
        if (amount.compareTo(BigDecimal.ZERO) < 0) {
            throw new TallyMessageBuilderException("Negative debit amount found:");
        }
        if (amount.compareTo(BigDecimal.ZERO) > 0) {
            builder.addAllLegderEntry(voucherEntry.debit, voucherEntry.glcode, true);
        }
    }

    private static Date getVoucherDate(String voucherdate) throws ParseException {
        return parseDateFormat.parse(voucherdate);
    }

    private static VoucherType getVoucherType(String vouchertype) throws TallyMessageBuilderException {
        if (vouchertype.equalsIgnoreCase("JOURNAL")) {
            return VoucherType.JOURNAL;
        } else if (vouchertype.equalsIgnoreCase("PAYMENT")) {
            return VoucherType.PAYMENT;
        } else if (vouchertype.equalsIgnoreCase("RECEIPT")) {
            return VoucherType.RECEIPT;
        }
        throw new TallyMessageBuilderException("No such voucher type supported:" + vouchertype);
    }

    public static DataPerLine parseLine(String line) {
        StringTokenizer st = new StringTokenizer(line, ";");
        DataPerLine lineData = new DataPerLine();
        lineData.branchname = st.nextToken().trim();
        lineData.voucherdate = st.nextToken().trim();
        lineData.vouchertype = st.nextToken().trim();
        lineData.glcode = st.nextToken().trim();
        lineData.glname = st.nextToken().trim();
        lineData.debit = st.nextToken().trim();
        lineData.credit = st.nextToken().trim();
        return lineData;
    }
}

class DataPerLine {
    String branchname;
    String voucherdate;
    String vouchertype;
    String glcode;
    String glname;
    String debit;
    String credit;

    @Override
    public String toString() {
        return branchname + ";" + voucherdate + ";" + vouchertype + ";" + glcode + ";" + glname + ";" + debit + ";"
                + credit;
    }
}