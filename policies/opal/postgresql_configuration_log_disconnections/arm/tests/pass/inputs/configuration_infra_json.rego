# Copyright 2022 Lacework, Inc.
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
package tests.policies.arm.postgresql.inputs.configuration_infra_json

import data.lacework.resource_view.resource_view_input

mock_input := ret {
  ret = resource_view_input with input as mock_config
}
mock_resources := mock_input.resources
mock_config := {
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {},
  "resources": [
    {
      "apiVersion": "2017-12-01",
      "location": "switzerlandnorth",
      "name": "OpalServerConfigValid",
      "properties": {
        "administratorLogin": "foo",
        "administratorLoginPassword": "abcd1234!"
      },
      "resources": [
        {
          "apiVersion": "2017-12-01",
          "dependsOn": [
            "Microsoft.DBforPostgreSQL/servers/OpalServerConfigValid"
          ],
          "name": "log_checkpoints",
          "properties": {
            "value": "on"
          },
          "type": "configurations"
        },
        {
          "apiVersion": "2017-12-01",
          "dependsOn": [
            "Microsoft.DBforPostgreSQL/servers/OpalServerConfigValid"
          ],
          "name": "log_connections",
          "properties": {
            "value": "on"
          },
          "type": "configurations"
        },
        {
          "apiVersion": "2017-12-01",
          "dependsOn": [
            "Microsoft.DBforPostgreSQL/servers/OpalServerConfigValid"
          ],
          "name": "log_disconnections",
          "properties": {
            "value": "on"
          },
          "type": "configurations"
        },
        {
          "apiVersion": "2017-12-01",
          "dependsOn": [
            "Microsoft.DBforPostgreSQL/servers/OpalServerConfigValid"
          ],
          "name": "log_duration",
          "properties": {
            "value": "on"
          },
          "type": "configurations"
        },
        {
          "apiVersion": "2017-12-01",
          "dependsOn": [
            "Microsoft.DBforPostgreSQL/servers/OpalServerConfigValid"
          ],
          "name": "connection_throttling",
          "properties": {
            "value": "on"
          },
          "type": "configurations"
        },
        {
          "apiVersion": "2017-12-01",
          "dependsOn": [
            "Microsoft.DBforPostgreSQL/servers/OpalServerConfigValid"
          ],
          "name": "log_retention_days",
          "properties": {
            "value": "7"
          },
          "type": "configurations"
        }
      ],
      "type": "Microsoft.DBforPostgreSQL/servers"
    }
  ]
}

