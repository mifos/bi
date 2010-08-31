package org.mifos.pentaho.tally;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.net.URISyntaxException;

import junit.framework.Assert;

import org.apache.commons.io.FileUtils;
import org.junit.Test;



public class TallyImportGeneratorTest {


	@Test
	public void testGetTallyImportReport() throws Exception {
	    File file = new File(TallyImportGeneratorTest.class.getResource("MifosETLOutput.txt").toURI());
	    File outputFile = new File("/tmp/MifosTallyETLOutput.txt");
	    FileUtils.copyFile(file, outputFile);
	    String actual = TallyImportGenerator.getTallyReportData();
	    String expected = getExpectedDate();
	    Assert.assertEquals(expected, actual);
	    outputFile.delete();
	}

	private String getExpectedDate() throws Exception {
	    File file = new File(TallyImportGeneratorTest.class.getResource("TallyImport.xml").toURI());
	    return FileUtils.readFileToString(file);

	}
}
