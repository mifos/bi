package org.mifos.pentaho.tally;

public class AllLedger {

    private final Boolean isDeemedPositive;

    private final String ledgerName;

    private final String amount;

    private final String branchName;

    public Boolean getIsDeemedPositive() {
        return isDeemedPositive;
    }

    public String getAmount() {
        return this.amount;
    }

    public String getBranchName() {
        return this.branchName;
    }

    public String getLedgerName() {
        return ledgerName;
    }

    public AllLedger(String ledgerName, Boolean isDeemedPositive, String amount, String branchName) {
        this.ledgerName = ledgerName;
        this.isDeemedPositive = isDeemedPositive;
        this.amount = amount;
        this.branchName = branchName;
    }

    @Override
    public String toString() {
        return isDeemedPositive + ";" + ledgerName + ";" + amount + ";" + branchName;
    }
}