package org.mifos.pentaho.tally;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.mifos.pentaho.tally.message.TallyMessage;
import org.mifos.pentaho.tally.message.TallyMessageBuilder;
import org.mifos.pentaho.tally.message.TallyMessageBuilderException;

public class StubTallyData {

    public static List<TallyMessage> getStubData() throws TallyMessageBuilderException {
        List<TallyMessage> data = new ArrayList<TallyMessage>();
        TallyMessageBuilder tallyMessageBuilder = new TallyMessageBuilder(VoucherType.PAYMENT, "Branch 0");
        tallyMessageBuilder.withPartyLedgerAmount("400");
        tallyMessageBuilder.withPartyLedgerName("Cash 1");
        tallyMessageBuilder.withVoucherDate(new Date());
        tallyMessageBuilder.addAllLegderEntry("500", "Loan Repayments");
        tallyMessageBuilder.addAllLegderEntry("700", "Fees");
        data.add(tallyMessageBuilder.build());
        return data;
    }
}
