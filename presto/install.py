#!/usr/bin/python

def main():
    say('Pentaho Report Test Framework Development Setup Helper')

    say('Trying to run Java... ')
    if run('java -version'):
        say('OK!')
    else:
        fail('java', 'not found. Must be in PATH. Java is needed to run Gradle.')
        say('No java.')

    say('Trying to run Gradle... ')
    gradle = get_for_os('gradle')
    if run('%s -v' % gradle):
        say('OK!')
    else:
        fail(gradle, 'not found. Must be in PATH. Gradle is needed to build.')
        say('No maven.')

    pdiPath = ""
    if promptYesNo('Should I look for PDI at %s? [Y/n]: ' % get_for_os('pdi')) == 'yes':
        pdiPath = get_for_os('pdi')
    else:
        while pdiPath == "":
            pdiPath = prompt('Ok, where? ')

    panPath = os.path.join(pdiPath, get_for_os('pan_script'))
    if os.path.exists(panPath):
        say('OK!')
    else:
        fail('pdi', '%s not found. PDI is needed to run tests.' % panPath)
        say('No pdi.')

    if 'pdi' not in failed:
        say('Trying to run Pan... ')
        if run('%s -version' % panPath, badExitCode=True):
            say('OK!')
        else:
            fail('pdi', 'Couldn''t run Pan, necessary for tests.')
            say('Didn''t work.')

    if 'pdi' in failed:
        say('PDI wasn''t found, skipped check for Pentaho Reporting Output plugin.')
        fail('pdi', 'Pentaho Reporting Output plugin not found, but is needed to run tests.')
    else:
        say('Looking for Pentaho Reporting Output plugin...')
        if os.path.exists(os.path.join(panPath)):
            say('OK!')
        else:
            fail('pdi', '%s not found.' % panPath)

    userHome = os.getenv('USERPROFILE') or os.getenv('HOME')
    prestoSettings = os.path.join(userHome, '.presto')
    if 'pdi' not in failed:
        if os.path.exists(prestoSettings) and promptYesNo('%s exists. Overwrite? [Y/n]: ' % prestoSettings) == 'yes' \
                or not os.path.exists(prestoSettings):
            say('Storing local settings...')
            prestoSettingsFd = open(prestoSettings, 'w')
            print >> prestoSettingsFd, 'pdiPath=%s' % pdiPath
            prestoSettingsFd.close()
            say('Wrote %s' % prestoSettings)

    if 'pdi' not in failed:
        dbSettingsFile = os.path.join(pdiPath, 'simple-jndi', 'jdbc.properties')
        say('')
        say('Be sure to configure your database connections in %s' % dbSettingsFile)
        say('SourceDB must be a Mifos OLTP database, DestinationDB must be a Mifos BI data warehouse.')
        say('Mysql connection URL must include useUnicode=true&characterEncoding=UTF-8.')

    say('')
    say('DONE.')
    say('')
    if failed:
        say('THERE WERE ERRORS. You\'ll have to fix the following before you continue:')
        for msg in failmsgs:
            say(msg)
    else:
        say('Ready to test Pentaho reports! Build using "gradle build".')

import os
import re
import subprocess

default_locations = {
    'pdi': {
        'nt' : os.path.join('Program Files', 'Pentaho Data Integration'),
        'posix': os.path.join('/', 'opt', 'pentaho', 'data-integration'),
    },
    'pan_script': {
        'nt' : 'pan.bat',
        'posix': 'pan.sh',
    },
    'gradle': {
        'nt' : 'gradle.bat',
        'posix': 'gradle',
    },
}
failed = []
failmsgs = []

def format_string_for_user(msg):
    return '*** ' + msg

def get_for_os(program_nickname):
    return default_locations[program_nickname][os.name]

def say(msg):
    'Tell the user something.'
    print format_string_for_user(msg)

def prompt(msg):
    'Ask for user input.'
    answer = raw_input(format_string_for_user(msg))
    return answer

def promptYesNo(msg):
    'Ask for yes/no response'
    answer = raw_input(format_string_for_user(msg))
    if answer == '' or re.match('y', answer, re.IGNORECASE):
        return 'yes'
    else:
        return 'no'

def fail(what, why):
    failmsg = what + ' FAIL: ' + why
    failmsgs.append(failmsg)
    failed.append(what)

def run(cmd, badExitCode=False):
    'Run an external command.'
    exit_status = 1
    try:
        exit_status = subprocess.call(cmd.split())
    except OSError as e:
        say("%s" % e)
        return False
    if exit_status == 0 or badExitCode:
        return True
    else:
        return False

if __name__ == '__main__':
    main()
