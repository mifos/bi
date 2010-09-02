package org.mifos.pentaho.tally.message;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.mifos.pentaho.tally.AllLedger;
import org.mifos.pentaho.tally.VoucherType;

public class TallyMessageBuilder {

    VoucherType voucherType;

    Date voucherDate;

    String branchName;

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
    }

    public TallyMessageBuilder withVoucherDate(Date voucherDate) throws TallyMessageBuilderException {
        if (this.voucherDate != null) {
            throw new TallyMessageBuilderException("Voucher date is already assigned");
        }
        this.voucherDate = voucherDate;
        return this;
    }

    public TallyMessageBuilder addAllLegderEntry(String amount, String ledgerName, Boolean isDeemedPositive) {
        allLedgers.add(new AllLedger(ledgerName, isDeemedPositive, amount, branchName));
        return this;
    }

    public TallyMessage build() throws TallyMessageBuilderException {
        if (voucherDate == null) {
            throw new TallyMessageBuilderException("Voucher date is required before building");
        }
        return new TallyMessage(voucherType, voucherDate, allLedgers);
    }
}