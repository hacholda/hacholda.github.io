*** Setting ***
Documentation
#Library  OperatingSystem
#Library  Collections
Library  SSHLibrary
Library  BuiltIn
Library  JSONLibrary
Library  !IS2-1-Python-HashFunction.py
Library  !IS2-1-Python-SendEmail-fromRobot.py
Suite Setup    run keyword  STARTJSON
Suite Teardown   close all connections
*** Variables ***
${TITLE-HOST}=      Hostname
${SYSTEM-OS}=       OS
${TITLE-IP}=        IP Address
${SB_TEMPLATE}=     Security Baseline Template Version
${VER8}=            centos-release-8.2-2.2004.0.1.el8.x86_64
${VER7}=            centos-release-7-5.1804.el7.centos.x86_64

${TEMPLATE_HOST}=       C:/Users/hachol.d/PycharmProjects/Automation/IS2/IS2_SB_HOST_30_v2.0.json
${TEMPLATE1_CENTOS7}=   C:/Users/hachol.d/PycharmProjects/Automation/IS2/!IS2-1-SB-Template-CentOS7-v01.json
${TEMPLATE2_CENTOS8}=   C:/Users/hachol.d/PycharmProjects/Automation/IS2/IS2_JSON_Template_CentOS8_v2.0.json
${HASH_TEMPLATE1_CENTOS7}=  C:/Users/hachol.d/PycharmProjects/Automation/IS2/IS2-Hash_Value_CentOS7.json
${HASH_TEMPLATE2_CENTOS8}=  C:/Users/hachol.d/PycharmProjects/Automation/IS2/IS2-Hash_Value_CentOS8.json

#${TEMPLATE_ID}
*** Test Cases ***
Automate_Select_CentOS_Template
    ${GET_VERSION}=     Execute Command   rpm -q centos-release
    log to console  ${GET_VERSION}
    ${TEMPLATE_FILE}=     Run Keyword If    '${GET_VERSION}'=='${VER7}'    Set Variable  ${TEMPLATE1_CENTOS7}
    ${TEMPLATE_FILE}=     Run Keyword If    '${GET_VERSION}'=='${VER8}'    Set Variable  ${TEMPLATE2_CENTOS8}

    ${HASH_VALUE_FILE}=   Run Keyword If    '${GET_VERSION}'=='${VER7}'    Set Variable  ${HASH_TEMPLATE1_CENTOS7}
    ${HASH_VALUE_FILE}=   Run Keyword If    '${GET_VERSION}'=='${VER8}'    Set Variable  ${HASH_TEMPLATE2_CENTOS8}

    log to console  ${TEMPLATE_FILE}
    log to console  ${HASH_VALUE_FILE}

    ${json_obj}=   load json from file  ${TEMPLATE_FILE}
    set global variable  ${json_obj}
    set global variable  ${TEMPLATE_FILE}     #user location&name of Template-ID for all testcase
    set global variable  ${HASH_VALUE_FILE}
##############   Test Detail of HOST     #############
    ${HOSTNAME}=    get value from json  ${json_obj_HOST}  $.Host_Detail.HOSTNAME
    ${Host_IP_Address}=  get value from json  ${json_obj_HOST}  $.Host_Detail.IP-ADDRESS
##############   Test Template version     #############
    ${JSON_TEMPLATE}=  get value from json  ${json_obj}   $.Host_Detail.JSON-Template-Name
    ${JSON_OS}=     get value from json  ${json_obj}   $.Host_Detail.OS
##############   Documentation   #############
    ${DOCUMENT}=  catenate  ${SB_TEMPLATE}  ${JSON_TEMPLATE[0]}  ${SYSTEM-OS}  ${JSON_OS[0]}   ${TITLE-HOST}  ${HOSTNAME[0]}  ${TITLE-IP}  ${Host_IP_Address[0]}
    set suite documentation    ${DOCUMENT}
Integrity Proof
    [Tags]  Integrity Proof
    log to console   ${HASH_VALUE_FILE}
    ${hashfile}=    load json from file  ${HASH_VALUE_FILE}
    ${hashvalue}=   get value from json  ${hashfile}  $.hash_sha-3
    log to console  ${hashvalue}
    ${result}=      join_two_strings  ${TEMPLATE_FILE}  NONE
    log to console  ${result}
    should be equal  ${result}  ${hashvalue[0]}
BASElINE_1-1-1
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_1-1-1.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_1-1-1.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_1-1-1.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should be equal  ${output}   ${RESULT[0]}
BASElINE_1-1-2
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_1-1-2.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_1-1-2.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_1-1-2.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should be equal  ${output}   ${RESULT[0]}
BASElINE_1-1-3
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_1-1-3.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_1-1-3.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_1-1-3.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should be equal  ${output}   ${RESULT[0]}
BASElINE_1-1-4
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_1-1-4.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_1-1-4.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_1-1-4.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should be equal  ${output}   ${RESULT[0]}
BASElINE_1-1-5
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_1-1-5.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_1-1-5.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_1-1-5.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should be equal  ${output}   ${RESULT[0]}
BASElINE_1-1-6
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_1-1-6.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_1-1-6.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_1-1-6.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should be equal  ${output}   ${RESULT[0]}
BASElINE_1-1-7
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_1-1-7.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_1-1-7.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_1-1-7.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should be equal  ${output}   ${RESULT[0]}
BASElINE_1-1-8
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_1-1-8.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_1-1-8.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_1-1-8.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should be equal  ${output}   ${RESULT[0]}
BASElINE_1-1-9
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_1-1-9.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_1-1-9.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_1-1-9.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should be equal  ${output}   ${RESULT[0]}
BASElINE_1-1-10
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_1-1-10.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_1-1-10.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_1-1-10.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should be equal  ${output}   ${RESULT[0]}
BASElINE_1-1-11
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_1-1-11.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_1-1-11.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_1-1-11.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should be equal  ${output}   ${RESULT[0]}
BASElINE_1-1-12
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_1-1-12.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_1-1-12.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_1-1-12.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should be equal  ${output}   ${RESULT[0]}
BASElINE_1-1-13
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_1-1-13.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_1-1-13.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_1-1-13.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should be equal  ${output}   ${RESULT[0]}
BASElINE_1-1-14
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_1-1-14.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_1-1-14.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_1-1-14.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should be equal  ${output}   ${RESULT[0]}
BASElINE_1-2-1
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_1-2-1.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_1-2-1.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_1-2-1.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}   ${RESULT[0]}
BASElINE_1-2-2
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_1-2-2.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_1-2-2.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_1-2-2.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}   ${RESULT[0]}
BASElINE_1-3-1
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_1-3-1.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_1-3-1.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_1-3-1.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}   ${RESULT[0]}
BASElINE_1-4-1
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_1-4-1.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_1-4-1.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_1-4-1.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}   ${RESULT[0]}
BASElINE_1-4-2
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_1-4-2.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_1-4-2.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_1-4-2.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}   ${RESULT[0]}
BASElINE_1-5-1
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_1-5-1.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_1-5-1.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_1-5-1.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}   ${RESULT[0]}
BASElINE_1-5-2
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_1-5-2.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_1-5-2.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_1-5-2.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}   ${RESULT[0]}
BASElINE_1-5-3
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_1-5-3.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_1-5-3.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_1-5-3.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}   ${RESULT[0]}
BASElINE_1-6-1
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_1-6-1.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_1-6-1.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_1-6-1.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}   ${RESULT[0]}
BASElINE_1-6-2
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_1-6-2.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_1-6-2.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_1-6-2.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}   ${RESULT[0]}
BASElINE_1-7-1
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_1-7-1.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_1-7-1.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_1-7-1.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}   ${RESULT[0]}
BASElINE_1-7-2
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_1-7-2.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_1-7-2.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_1-7-2.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}   ${RESULT[0]}
BASElINE_1-7-3
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_1-7-3.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_1-7-3.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_1-7-3.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}   ${RESULT[0]}
BASElINE_1-7-4
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_1-7-4.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_1-7-4.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_1-7-4.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}   ${RESULT[0]}
BASElINE_1-7-5
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_1-7-5.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_1-7-5.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_1-7-5.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}   ${RESULT[0]}
BASElINE_1-8-1
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_1-8-1.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_1-8-1.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_1-8-1.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain   ${output}  ${RESULT[0]}
BASElINE_1-8-2
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_1-8-2.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_1-8-2.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_1-8-2.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain   ${output}  ${RESULT[0]}
BASElINE_1-8-3
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_1-8-3.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_1-8-3.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_1-8-3.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}   ${RESULT[0]}
BASElINE_1-8-4
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_1-8-4.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_1-8-4.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_1-8-4.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}  ${RESULT[0]}
BASElINE_1-8-5
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_1-8-5.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_1-8-5.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_1-8-5.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}  ${RESULT[0]}
BASElINE_1-8-6
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_1-8-6.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_1-8-6.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_1-8-6.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}   ${RESULT[0]}
BASElINE_2-1-1
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_2-1-1.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_2-1-1.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_2-1-1.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}   ${RESULT[0]}

BASElINE_2-2-1
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_2-2-1.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_2-2-1.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_2-2-1.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}  ${RESULT[0]}
BASElINE_2-2-2
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_2-2-2.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_2-2-2.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_2-2-2.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}  ${RESULT[0]}
BASElINE_2-2-3
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_2-2-3.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_2-2-3.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_2-2-3.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should not contain  ${output}  ${RESULT[0]}
BASElINE_2-2-4
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_2-2-4.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_2-2-4.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_2-2-4.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}  ${RESULT[0]}
BASElINE_2-2-5
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_2-2-5.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_2-2-5.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_2-2-5.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should not contain  ${output}  ${RESULT[0]}
BASElINE_2-2-6
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_2-2-6.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_2-2-6.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_2-2-6.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should not contain  ${output}  ${RESULT[0]}
BASElINE_2-2-7
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_2-2-7.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_2-2-7.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_2-2-7.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should not contain  ${output}  ${RESULT[0]}
BASElINE_2-2-8
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_2-2-8.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_2-2-8.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_2-2-8.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should not contain  ${output}  ${RESULT[0]}
BASElINE_2-2-9
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_2-2-9.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_2-2-9.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_2-2-9.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should not contain  ${output}  ${RESULT[0]}
BASElINE_2-2-10
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_2-2-10.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_2-2-10.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_2-2-10.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should not be equal  ${output}  ${RESULT[0]}
BASElINE_2-2-11
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_2-2-11.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_2-2-11.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_2-2-11.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should not contain  ${output}     ${RESULT[0]}
BASElINE_2-2-12
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_2-2-12.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_2-2-12.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_2-2-12.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should not contain  ${output}   ${RESULT[0]}
BASElINE_2-2-13
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_2-2-13.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_2-2-13.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_2-2-13.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should not contain  ${output}   ${RESULT[0]}
BASElINE_2-2-14
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_2-2-14.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_2-2-14.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_2-2-14.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should not contain  ${output}   ${RESULT[0]}
BASElINE_2-2-15
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_2-2-15.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_2-2-15.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_2-2-15.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}   ${RESULT[0]}
BASElINE_2-2-16
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_2-2-16.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_2-2-16.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_2-2-16.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}   ${RESULT[0]}
BASElINE_2-2-17
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_2-2-17.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_2-2-17.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_2-2-17.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should not contain  ${output}   ${RESULT[0]}
BASElINE_2-2-18
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_2-2-18.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_2-2-18.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_2-2-18.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}   ${RESULT[0]}
BASElINE_2-3-1
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_2-3-1.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_2-3-1.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_2-3-1.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}   ${RESULT[0]}
BASElINE_2-3-2
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_2-3-2.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_2-3-2.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_2-3-2.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}   ${RESULT[0]}
BASElINE_2-3-3
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_2-3-3.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_2-3-3.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_2-3-3.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}   ${RESULT[0]}
BASElINE_3-1-1
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_3-1-1.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_3-1-1.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_3-1-1.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}    ${RESULT[0]}
BASElINE_3-1-2
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_3-1-2.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_3-1-2.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_3-1-2.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}    ${RESULT[0]}
BASElINE_3-2-1
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_3-2-1.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_3-2-1.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_3-2-1.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}    ${RESULT[0]}
BASElINE_3-2-2
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_3-2-2.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_3-2-2.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_3-2-2.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}    ${RESULT[0]}
BASElINE_3-2-3
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_3-2-3.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_3-2-3.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_3-2-3.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}    ${RESULT[0]}
BASElINE_3-2-4
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_3-2-4.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_3-2-4.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_3-2-4.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}    ${RESULT[0]}
BASElINE_3-2-5
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_3-2-5.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_3-2-5.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_3-2-5.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}    ${RESULT[0]}
BASElINE_3-2-6
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_3-2-6.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_3-2-6.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_3-2-6.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}    ${RESULT[0]}
BASElINE_3-2-7
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_3-2-7.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_3-2-7.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_3-2-7.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}    ${RESULT[0]}
BASElINE_3-2-8
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_3-2-8.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_3-2-8.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_3-2-8.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}    ${RESULT[0]}
BASElINE_3-2-9
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_3-2-9.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_3-2-9.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_3-2-9.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}    ${RESULT[0]}
BASElINE_3-3-1
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_3-3-1.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_3-3-1.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_3-3-1.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should be equal  ${output}    ${RESULT[0]}
BASElINE_3-4-1
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_3-4-1.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_3-4-1.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_3-4-1.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}    ${RESULT[0]}
BASElINE_3-4-2
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_3-4-2.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_3-4-2.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_3-4-2.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}    ${RESULT[0]}
BASElINE_3-4-3
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_3-4-3.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_3-4-3.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_3-4-3.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}    ${RESULT[0]}
BASElINE_3-4-4
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_3-4-4.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_3-4-4.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_3-4-4.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}    ${RESULT[0]}
BASElINE_3-4-5
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_3-4-5.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_3-4-5.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_3-4-5.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}    ${RESULT[0]}
BASElINE_3-4-6
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_3-4-6.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_3-4-6.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_3-4-6.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}    ${RESULT[0]}
BASElINE_3-4-7
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_3-4-7.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_3-4-7.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_3-4-7.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}    ${RESULT[0]}
BASElINE_3-4-8
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_3-4-8.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_3-4-8.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_3-4-8.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}    ${RESULT[0]}
BASElINE_3-5
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_3-5.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_3-5.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_3-5.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}    ${RESULT[0]}
BASElINE_3-6
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_3-6.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_3-6.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_3-6.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}    ${RESULT[0]}
BASElINE_4-1-1
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_4-1-1.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_4-1-1.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_4-1-1.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}    ${RESULT[0]}
BASElINE_4-1-2
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_4-1-2.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_4-1-2.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_4-1-2.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}    ${RESULT[0]}
BASElINE_4-1-3
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_4-1-3.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_4-1-3.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_4-1-3.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}    ${RESULT[0]}
BASElINE_4-1-4
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_4-1-4.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_4-1-4.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_4-1-4.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}    ${RESULT[0]}
BASElINE_4-1-5
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_4-1-5.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_4-1-5.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_4-1-5.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}    ${RESULT[0]}
BASElINE_4-1-6
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_4-1-6.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_4-1-6.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_4-1-6.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}    ${RESULT[0]}
BASElINE_4-1-7
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_4-1-7.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_4-1-7.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_4-1-7.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}    ${RESULT[0]}
BASElINE_4-1-8
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_4-1-8.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_4-1-8.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_4-1-8.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}    ${RESULT[0]}
BASElINE_4-1-9
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_4-1-9.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_4-1-9.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_4-1-9.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}    ${RESULT[0]}
BASElINE_4-1-10
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_4-1-10.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_4-1-10.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_4-1-10.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}    ${RESULT[0]}
BASElINE_4-1-11
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_4-1-11.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_4-1-11.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_4-1-11.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}    ${RESULT[0]}
BASElINE_4-1-12
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_4-1-12.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_4-1-12.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_4-1-12.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}    ${RESULT[0]}
BASElINE_4-1-13
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_4-1-13.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_4-1-13.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_4-1-13.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}    ${RESULT[0]}
BASElINE_4-1-14
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_4-1-14.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_4-1-14.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_4-1-14.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}    ${RESULT[0]}
BASElINE_4-1-15
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_4-1-15.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_4-1-15.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_4-1-15.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}    ${RESULT[0]}
BASElINE_4-1-16
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_4-1-16.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_4-1-16.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_4-1-16.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}    ${RESULT[0]}
BASElINE_4-1-17
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_4-1-17.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_4-1-17.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_4-1-17.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}    ${RESULT[0]}
BASElINE_4-2-1
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_4-2-1.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_4-2-1.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_4-2-1.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}    ${RESULT[0]}
BASElINE_4-2-2
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_4-2-2.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_4-2-2.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_4-2-2.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}    ${RESULT[0]}
BASElINE_5-1-1
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_5-1-1.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_5-1-1.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_5-1-1.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}    ${RESULT[0]}
BASElINE_5-1-2
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_5-1-2.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_5-1-2.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_5-1-2.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}    ${RESULT[0]}
BASElINE_5-1-3
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_5-1-3.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_5-1-3.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_5-1-3.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}    ${RESULT[0]}
BASElINE_5-1-4
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_5-1-4.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_5-1-4.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_5-1-4.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}    ${RESULT[0]}
BASElINE_5-1-5
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_5-1-5.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_5-1-5.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_5-1-5.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}    ${RESULT[0]}
BASElINE_5-1-6
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_5-1-6.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_5-1-6.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_5-1-6.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}    ${RESULT[0]}
BASElINE_5-1-7
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_5-1-7.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_5-1-7.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_5-1-7.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}    ${RESULT[0]}
BASElINE_5-1-8
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_5-1-8.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_5-1-8.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_5-1-8.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}    ${RESULT[0]}
BASElINE_5-1-9
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_5-1-9.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_5-1-9.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_5-1-9.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}    ${RESULT[0]}
BASElINE_5-2-1
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_5-2-1.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_5-2-1.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_5-2-1.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}    ${RESULT[0]}
BASElINE_5-2-2
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_5-2-2.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_5-2-2.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_5-2-2.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}    ${RESULT[0]}
BASElINE_5-2-3
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_5-2-3.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_5-2-3.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_5-2-3.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}    ${RESULT[0]}
BASElINE_6-1-1
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_6-1-1.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_6-1-1.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_6-1-1.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}    ${RESULT[0]}
BASElINE_6-1-2
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_6-1-2.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_6-1-2.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_6-1-2.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}    ${RESULT[0]}
BASElINE_6-1-3
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_6-1-3.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_6-1-3.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_6-1-3.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}    ${RESULT[0]}
BASElINE_6-1-4
    ${TAG}=         get value from json     ${json_obj}  $.BASELINE_6-1-4.TAG
    ${AUDIT}=       get value from json     ${json_obj}  $.BASELINE_6-1-4.AUDIT
    ${RESULT}=      get value from json     ${json_obj}  $.BASELINE_6-1-4.RESULT
    set tags  ${TAG[0]}
    ${output}=  execute command   ${AUDIT[0]}
    should contain  ${output}    ${RESULT[0]}
Send Email notification
    ${TAG}=         get value from json     ${json_obj}  $.Email_Receiver.TAG
    ${FROM}=        get value from json     ${json_obj}  $.Email_Receiver.FROM
    ${TO}=          get value from json     ${json_obj}  $.Email_Receiver.TO
    ${SUBJECT}=     get value from json     ${json_obj}  $.Email_Receiver.SUBJECT
    ${result}=      !IS2-1-Python-SendEmail-fromRobot.send message  ${FROM[0]}  ${TO[0]}  ${Subject[0]}
    set tags  ${TAG[0]}
    log to console  ${result}
*** Keywords ***
STARTJSON
    ${json_obj_HOST}=    load json from file   ${TEMPLATE_HOST}
    set global variable  ${json_obj_HOST}
    ${IP_Address}=  get value from json  ${json_obj_HOST}  $.Host_Detail.IP-ADDRESS
    ${user}=        get value from json  ${json_obj_HOST}  $.Host_Detail.USER
    ${password}=    get value from json  ${json_obj_HOST}  $.Host_Detail.PASSWORD
    open connection    ${IP_Address[0]}  delay[2]
    login    ${user[0]}  ${password[0]}
