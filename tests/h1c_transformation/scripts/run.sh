#!/bin/bash -e
# Copyright 2021 WSO2 Inc. (http://wso2.org)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# ----------------------------------------------------------------------------
# Execution script for ballerina performance tests
# ----------------------------------------------------------------------------
set -e
generate-payloads.sh -p array -s ${2}
jmeter -n -t ~/ballerina-performance-cloud/tests/"${1}"/scripts/http-post-request.jmx -l ~/ballerina-performance-cloud/tests/"${1}"/results/original.jtl -Jusers="${3}" -Jduration=1200 -Jhost=bal.perf.test -Jport=80 -Jprotocol=http -Jpath=transform -Jresponse_size="${2}" -Jpayload="$(pwd)"'/'${2}'B.json'
