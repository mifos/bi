package org.mifos.pentaho.tally.message;

import java.util.Date;
import java.util.List;

import org.mifos.pentaho.tally.AllLedger;
import org.mifos.pentaho.tally.VoucherType;

public class TallyMessage {

    private final VoucherType voucherType;

    private final Date voucherDate;

    private final List<AllLedger> allLedgers;

    public VoucherType getVoucherType() {
        return this.voucherType;
    }

    public List<AllLedger> getAllLedgers() {
        return this.allLedgers;
    }

    public Date getVoucherDate() {
        return voucherDate;
    }

    protected TallyMessage(final VoucherType voucherType, final Date voucherDate, final List<AllLedger> allLedgers) {
        super();
        this.voucherType = voucherType;
        this.allLedgers = allLedgers;
        this.voucherDate = voucherDate;
    }

    @SuppressWarnings("unused")
    private TallyMessage() {
        this(null, null, null);
    }

    @Override
    public String toString() {
        String string = "";
        for (AllLedger allLedger : allLedgers) {
            string += allLedger + "\n";
        }
        string = voucherType + ";" + voucherDate + ";" + "\n" + string;
        return string;
    }
}
