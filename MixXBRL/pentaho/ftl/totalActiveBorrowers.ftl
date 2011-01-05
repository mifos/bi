<?xml version="1.0" encoding="utf-8"?>
<!--XBRL document created with in Pentaho for Mifos-->
<!--Based on XBRL 2.1-->
<!--Created on: ${xbrlData.date_YYYY_MM_dd}-->
<xbrl xmlns="http://www.xbrl.org/2003/instance" xmlns:link="http://www.xbrl.org/2003/linkbase" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:iso4217="http://www.xbrl.org/2003/iso4217" xmlns:mix="http://www.themix.org/int/fr/ifrs/basi/2009-06-19/mx-cor">
  <link:schemaRef xlink:type="simple" xlink:href="http://www.themix.org/xbrl/taxonomy/mix_2009-06-19/mx-2009-06-19.xsd" />
  <!--Context Section-->
  <context id="As_Of_${xbrlData.date_MM_dd_YYYY}">
    <entity>
      <identifier scheme="http://www.themix.org">${xbrlData.MFI_ID}</identifier>
    </entity>
    <period>
      <instant>${xbrlData.date_YYYY_MM_dd}</instant>
    </period>
  </context>
  <!--Unit Section-->
  <unit id="Unit_1">
    <measure>xbrli:pure</measure>
  </unit>
  <!--Tuple Section-->
  <!--Element Section-->
  <mix:NumberOfActiveBorrowers contextRef="As_Of_${xbrlData.date_MM_dd_YYYY}" unitRef="Unit_1" decimals="0">${xbrlData.numberOfActiveBorrowers}</mix:NumberOfActiveBorrowers>
  <!--Footnote Section-->
</xbrl>