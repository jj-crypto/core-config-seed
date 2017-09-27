#!/bin/bash

# Copyright 2017 Cavium Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Author: chencho

set -e

rm -rf /consul/data/* && consul agent -data-dir=/consul/data -config-dir=/consul/config -server -client=0.0.0.0 -bootstrap -ui | tee /edgex/logs/core-consul.log &

echo "Waiting for $WAIT_FOR_A_WHILE seconds until consul is configured"
sleep $WAIT_FOR_A_WHILE


java -jar -Djava.security.egd=file:/dev/urandom -Xmx100M $APP

wait

