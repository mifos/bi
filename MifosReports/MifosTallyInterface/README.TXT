Requires
 - Pentaho BI 3.6.0
 - Mifos 1.6.0

Installation
 - Unzip under <PENTAHO_BI_DIR>/biserver-ce/pentaho-solutions
 - Setup "tallyho" Database connection to Mifos database using Pentaho Adminstration Console (PAC)
 - Download freemarker from http://repo2.maven.org/maven2/org/freemarker/freemarker/2.3.16/freemarker-2.3.16.jar
 - Move freemarker-2.3.16.jar and mifos-bi-0.1-SNAPSHOT.jar to <PENTAHO_BI_DIR>/biserver-ce/tomcat/webapps/pentaho/WEB-INF/pentaho
 - Restart the pentaho server
 - Run the reports using Pentaho User Console (PUC)
 - Run "Mifos Tally Interface" report first to generate data and PDF report
 - Download Tally XML using "Tally Output - Lastet" and rename it to MifosTallyOutput_<FROMDATE>_to_<TODATE>.xml
 - Import the XML to Tally and verify the result and look into the tally import logs.
