package org.mifos.pentaho.tally.message;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.mifos.pentaho.tally.AllLedger;
import org.mifos.pentaho.tally.VoucherType;

public class TallyMessageBuilder {

    VoucherType voucherType;

    Date voucherDate;

    Boolean isPartyLedger;

    Boolean isDeemedPositive;

    String partyLedgerName;

    String branchName;

    String partyLedgerAmount;

    List<AllLedger> allLedgers = new ArrayList<AllLedger>();

    public TallyMessageBuilder(VoucherType voucherType, String branchName) throws TallyMessageBuilderException {
        this.voucherType = voucherType;
        this.branchName = branchName;
        if (this.voucherType == null) {
            throw new TallyMessageBuilderException("Voucher type can not be null.");
        }
        if (this.branchName == null) {
            throw new TallyMessageBuilderException("Branch name can not be null.");
        }
        if (voucherType == VoucherType.PAYMENT) {
            isPartyLedger = Boolean.TRUE;
            isDeemedPositive = Boolean.FALSE;
        } else if (voucherType == VoucherType.RECEIPT) {
            isPartyLedger = Boolean.TRUE;
            isDeemedPositive = Boolean.TRUE;
        } else {
            isPartyLedger = null;
            isDeemedPositive = null;
        }
    }

    public TallyMessageBuilder withVoucherDate(Date voucherDate) throws TallyMessageBuilderException {
        if (this.voucherDate != null) {
            throw new TallyMessageBuilderException("Voucher date is already assigned");
        }
        this.voucherDate = voucherDate;
        return this;
    }

    public TallyMessageBuilder withPartyLedgerName(String partyLedgerName) throws TallyMessageBuilderException {
        if (this.partyLedgerName != null) {
            throw new TallyMessageBuilderException("Party ledger name is already assigned");
        }
        this.partyLedgerName = partyLedgerName;
        return this;
    }

    public TallyMessageBuilder withPartyLedgerAmount(String amount) throws TallyMessageBuilderException {
        if (this.partyLedgerAmount != null) {
            throw new TallyMessageBuilderException("Party ledger amount is already assigned");
        }
        this.partyLedgerAmount = amount;
        return this;
    }

    public TallyMessageBuilder addAllLegderEntry(String amount, String ledgerName) throws TallyMessageBuilderException {
        if (voucherType == VoucherType.JOURNAL) {
            throw new TallyMessageBuilderException("Use addJournalAllLegderEntry for voucher type : " + voucherType);
        } else if (voucherType == VoucherType.PAYMENT) {
            allLedgers.add(new AllLedger(ledgerName, true, amount, branchName));
        } else if (voucherType == VoucherType.RECEIPT) {
            allLedgers.add(new AllLedger(ledgerName, false, amount, branchName));
        }
        return this;
    }

    public TallyMessageBuilder addJournalAllLegderEntry(String amount, String ledgerName, Boolean isDeemedPositive)
            throws TallyMessageBuilderException {
        if (voucherType != VoucherType.JOURNAL) {
            throw new TallyMessageBuilderException("Use addAllLegderEntry for voucher type : " + voucherType);
        }
        allLedgers.add(new AllLedger(ledgerName, isDeemedPositive, amount, branchName));
        return this;
    }

    public TallyMessage build() throws TallyMessageBuilderException {
        if (voucherType != VoucherType.JOURNAL) {
            if(partyLedgerName == null || partyLedgerAmount == null) {
                throw new TallyMessageBuilderException("Party legder information is required before building");
            }
        }
        if(voucherDate == null) {
            throw new TallyMessageBuilderException("Voucher date is required before building");
        }
        return new TallyMessage(voucherType, voucherDate, isPartyLedger, isDeemedPositive, partyLedgerName,
                partyLedgerAmount, allLedgers);
    }
}