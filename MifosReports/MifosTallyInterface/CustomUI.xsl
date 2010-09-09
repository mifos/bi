<form name="parameter-form" id="parameter-form" method="POST">
    <table>
    
    <br/><br/>
    <br/><h3>Latest Tally Output</h3><br/>
    <ul>
    <li>Run Mifos- Tally GL Interface report first for valid date range.</li>
     <li>Save file that is opened and ready to import to the name displayed on the top of the GL interface report - e.g. MifosAccountingExport-2010-04-01.xml (not .html)</li>
    </ul>
       <tr>
          <td align="center"><br/><input type="submit" name="go" value="Run..."/></td>
       </tr>
    </table>
    <input type="hidden" name="forceAttachment" value="true"/>
    {solution}
    {action}
    {path}
</form>
