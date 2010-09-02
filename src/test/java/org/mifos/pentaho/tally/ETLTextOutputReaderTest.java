package org.mifos.pentaho.tally;

import java.io.File;
import java.util.List;

import org.junit.Assert;
import org.junit.Test;
import org.mifos.pentaho.tally.message.TallyMessage;

public class ETLTextOutputReaderTest {

    @Test
    public void testParseETLOutput() throws Exception {
        File file = new File(TallyImportGeneratorTest.class.getResource("SmallMifosTallyETLOutput.txt").toURI());
        List<TallyMessage> tallyMessage = ETLOutputReader.parseETLOutputFile(file);
        Assert.assertEquals(5, tallyMessage.size());
        Assert.assertEquals(VoucherType.JOURNAL, tallyMessage.get(0).getVoucherType());
        Assert.assertEquals(2, tallyMessage.get(0).getAllLedgers().size());
        Assert.assertEquals(VoucherType.PAYMENT, tallyMessage.get(1).getVoucherType());
        Assert.assertEquals(3, tallyMessage.get(1).getAllLedgers().size());
        Assert.assertEquals(VoucherType.RECEIPT, tallyMessage.get(2).getVoucherType());
        Assert.assertEquals(5, tallyMessage.get(2).getAllLedgers().size());
        Assert.assertEquals(VoucherType.JOURNAL, tallyMessage.get(3).getVoucherType());
        Assert.assertEquals(2, tallyMessage.get(3).getAllLedgers().size());
        Assert.assertEquals(VoucherType.PAYMENT, tallyMessage.get(4).getVoucherType());
        Assert.assertEquals(2, tallyMessage.get(4).getAllLedgers().size());
    }
}
