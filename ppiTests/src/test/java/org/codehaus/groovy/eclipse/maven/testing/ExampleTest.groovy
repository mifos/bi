/*******************************************************************************
 * Copyright (c) 2010 Codehaus.org, SpringSource, and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *     Andrew Eisenberg     - Initial API and implementation
 *******************************************************************************/
package org.codehaus.groovy.eclipse.maven.testing

import groovy.sql.Sql
/**
 * Tests for the {@link Example} class.
 */
class ExampleTest
    extends GroovyTestCase
{
	void testShow() {
		def sql = Sql.newInstance("jdbc:mysql://localhost:3306/mifos_ppi_test_dw", "root",
				"", "com.mysql.jdbc.Driver")
		sql.eachRow("select * from fact_ppi_survey_results"){ row ->
			println row.ppi_results_id + " " + row.date_survey_taken + " " + row.ppi_score
		}
		
    }
}
