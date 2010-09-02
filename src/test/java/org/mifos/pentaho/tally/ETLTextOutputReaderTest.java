/*
 * Copyright (c) 2005-2010 Grameen Foundation USA
 * All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
 * implied. See the License for the specific language governing
 * permissions and limitations under the License.
 *
 * See also http://www.apache.org/licenses/LICENSE-2.0.html for an
 * explanation of the license and how it is applied.
 */

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
