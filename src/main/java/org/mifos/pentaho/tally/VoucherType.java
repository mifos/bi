package org.mifos.pentaho.tally;

public enum VoucherType {
    PAYMENT("Payment"), JOURNAL("Journal"), RECEIPT("Receipt");

    String value;

    VoucherType(final String value) {
        this.value = value;
    }
}
