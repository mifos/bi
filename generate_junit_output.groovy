/*
Converts output from ETL tests to JUnit-style XML output.
*/

import groovy.xml.MarkupBuilder

def tests = []
def stats = [failures:0]
def stdin = ""
System.in.eachLine() { line ->
    stdin += line + '\n'
    def m = line =~ / - ([^-]*) - (ETL (?:Pass|Fail)): (.*)/
    if (m.find()) {
        test = ['category':m[0][1]]
        if (m[0][2] =~ 'Pass') {
            test['name'] = m[0][3]
            test['result'] = 'pass'
        } else {
            test['result'] = 'fail'
            test['name'] = (m[0][3] =~ /TEST NAME: ([^A-Z]*)[A-Z]/)[0][1]
            test['message'] = m[0][3]
            stats['failures'] += 1
        }
        tests.add(test)
    }
}

def testcases(builder, tests) {
    tests.each { t ->
        if (t['result'] == 'pass') {
            builder.testcase(time:0,classname:t['category'],name:t['name'])
        } else if (t['result'] == 'fail') {
            builder.testcase(time:0,classname:t['category'],name:t['name']) {
                failure(message:t['message'], t['message'])
            }
        }
    }
}

def xml = new MarkupBuilder()
xml.setDoubleQuotes(true)
xml.mkp.xmlDeclaration(version:'1.0', encoding:'UTF-8')
xml.testsuite(failures:stats['failures'],time:0,errors:0,skipped:0,tests:tests.size(),name:'ETL tests') {
    properties() {
        System.properties.each { key, value -> property(name:"${key}", value:"${value}") }
    }
    testcases(xml, tests)
    'system-out'() { mkp.yield(stdin) }
    'system-err'() {}
}
println ''
