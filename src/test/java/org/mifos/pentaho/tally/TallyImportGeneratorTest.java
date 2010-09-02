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
