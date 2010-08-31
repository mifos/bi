package org.mifos.pentaho.tally.message;

import java.util.Date;
import java.util.List;

import org.mifos.pentaho.tally.AllLedger;
import org.mifos.pentaho.tally.VoucherType;

public class TallyMessage {

    private final VoucherType voucherType;

    private final Date voucherDate;

    private final Boolean isPartyLedger;

    private final Boolean isDeemedPositive;

    private final String partyLedgerName;

    private final String partyLedgerAmount;

    private final List<AllLedger> allLedgers;

    public VoucherType getVoucherType() {
        return this.voucherType;
    }

    public Boolean getIsPartyLedger() {
        return this.isPartyLedger;
    }

    public String getPartyLedgerName() {
        return this.partyLedgerName;
    }

    public String getPartyLedgerAmount() {
        return this.partyLedgerAmount;
    }

    public List<AllLedger> getAllLedgers() {
        return this.allLedgers;
    }

    public Date getVoucherDate() {
        return voucherDate;
    }

    public Boolean getIsDeemedPositive() {
        return isDeemedPositive;
    }

    protected TallyMessage(final VoucherType voucherType, final Date voucherDate, final Boolean isPartyLedger,
            final Boolean isDeemedPositive, final String partyLedgerName, final String partyLedgerAmount,
            final List<AllLedger> allLedgers) {
        super();
        this.voucherType = voucherType;
        this.isPartyLedger = isPartyLedger;
        this.partyLedgerName = partyLedgerName;
        this.partyLedgerAmount = partyLedgerAmount;
        this.allLedgers = allLedgers;
        this.voucherDate = voucherDate;
        this.isDeemedPositive = isDeemedPositive;
    }

    @SuppressWarnings("unused")
    private TallyMessage() {
        this(null, null, null, null, null, null, null);
    }

    @Override
    public String toString() {
        String string = "";
        for (AllLedger allLedger : allLedgers) {
            string += allLedger + "\n";
        }
        string = voucherType + ";" + isPartyLedger + ";" + partyLedgerName + ";" + partyLedgerAmount + ";"
                + voucherDate + ";" + isDeemedPositive + ";" + "\n" + string;
        return string;
    }
}
