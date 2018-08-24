#!/bin/bash
# Copyright 2014-2018 Spotify AB
# Copyright 2016-2018 The Last Pickle Ltd
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

set -e

NODETOOL_OPTS=""

if [ "true" = "${NODETOOL_ENABLE_SSL}" ]; then
    NODETOOL_OPTS="--ssl"

    sed -ie "s/CASSANDRA_KEYSTORE_PASSWORD/${CASSANDRA_KEYSTORE_PASSWORD}/g" ${WORKDIR}/.cassandra/nodetool-ssl.properties
    sed -ie "s/CASSANDRA_TRUSTSTORE_PASSWORD/${CASSANDRA_TRUSTSTORE_PASSWORD}/g" ${WORKDIR}/.cassandra/nodetool-ssl.properties
fi

nodetool --host ${CASSANDRA_HOSTNAME} --username cassandraUser --password cassandraPass ${NODETOOL_OPTS} $1
