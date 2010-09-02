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

import junit.framework.Assert;

import org.apache.commons.io.FileUtils;
import org.junit.Test;

public class TallyImportGeneratorTest {

    @Test
    public void smallTallyImportReport() throws Exception {
        File file = new File(TallyImportGeneratorTest.class.getResource("SmallMifosTallyETLOutput.txt").toURI());
        File outputFile = new File("/tmp/MifosTallyETLOutput.txt");
        FileUtils.copyFile(file, outputFile);
        String actual = TallyImportGenerator.getTallyReportData();
        String expected = getExpectedDateForSmallImport();
        Assert.assertEquals(expected, actual);
        outputFile.delete();
    }

    @Test
    public void bigTallyImportReport() throws Exception {
        File file = new File(TallyImportGeneratorTest.class.getResource("BigMifosTallyETLOutput.txt").toURI());
        File outputFile = new File("/tmp/MifosTallyETLOutput.txt");
        FileUtils.copyFile(file, outputFile);
        String actual = TallyImportGenerator.getTallyReportData();
        String expected = getExpectedDateForBigImport();
        Assert.assertEquals(expected, actual);
        outputFile.delete();
    }

    private String getExpectedDateForBigImport() throws Exception {
        File file = new File(TallyImportGeneratorTest.class.getResource("BigTallyImportExpected.xml").toURI());
        return FileUtils.readFileToString(file);
    }

    private String getExpectedDateForSmallImport() throws Exception {
        File file = new File(TallyImportGeneratorTest.class.getResource("SmallTallyImportExpected.xml").toURI());
        return FileUtils.readFileToString(file);
    }
}
