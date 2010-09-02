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

package org.mifos.pentaho;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import freemarker.template.Configuration;
import freemarker.template.DefaultObjectWrapper;
import freemarker.template.Template;
import freemarker.template.TemplateException;

public class ProcessXBRL {

    // public static void main(String[] args) throws Exception {
    // runProcessor("100");
    // }

    public static void runProcessor(String amountOfOutstandingLoans) throws IOException, TemplateException {
        String userDir = System.getenv("HOME");
        String propsFilePath = userDir + "/.mifos/pentaho/xbrl-etl.properties";
        FileInputStream fin = new FileInputStream(new File(propsFilePath));
        Properties props = new Properties();
        props.load(fin);

        Configuration cfg = new Configuration();
        String ftlDirPath = userDir + "/.mifos/pentaho/ftl";
        cfg.setDirectoryForTemplateLoading(new File(ftlDirPath));

        cfg.setObjectWrapper(new DefaultObjectWrapper());

        Template temp = cfg.getTemplate(props.getProperty("xbrl.totalNoOfActiveBorrowers.ftlView"));

        /* Create a data-model */
        Map<String, Object> root = new HashMap<String, Object>();
        Map<String, Object> xbrlData = new HashMap<String, Object>();
        root.put("xbrlData", xbrlData);

        xbrlData.put("MFI_ID", props.getProperty("xbrl.totalNoOfActiveBorrowers.mfiID"));
        Date date = new Date();
        xbrlData.put("date_YYYY_MM_dd", getDateYYYYMMDD(date));
        xbrlData.put("date_MM_dd_YYYY", getDateMMDDYYYY(date));
        xbrlData.put("numberOfActiveBorrowers", amountOfOutstandingLoans);

        /* Merge data-model with template */
        FileWriter out = new FileWriter(props.getProperty("xbrl.totalNoOfActiveBorrowers.outputFolder")
                + "/xbrl-TotalNumberOfActiveBorrowers-" + getDateYYYYMMDD(date) + ".xml");
        temp.process(root, out);
        out.flush();
    }

    private static String getDateYYYYMMDD(Date date) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        return sdf.format(date);
    }

    private static String getDateMMDDYYYY(Date date) {
        SimpleDateFormat sdf = new SimpleDateFormat("MM_dd_yyyy");
        return sdf.format(date);
    }

}
