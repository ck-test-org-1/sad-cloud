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
package tests.policies.arm.network.inputs.flow_log_retention_infra_json

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
      "apiVersion": "2021-03-01",
      "location": "switzerlandnorth",
      "name": "OpalNSG1",
      "type": "Microsoft.Network/networkSecurityGroups"
    },
    {
      "apiVersion": "2021-04-01",
      "kind": "StorageV2",
      "location": "switzerlandnorth",
      "name": "opalsa01",
      "sku": {
        "name": "Standard_LRS"
      },
      "type": "Microsoft.Storage/storageAccounts"
    },
    {
      "apiVersion": "2021-04-01",
      "location": "switzerlandnorth",
      "name": "OpalWatcher1",
      "resources": [
        {
          "apiVersion": "2021-04-01",
          "dependsOn": [
            "Microsoft.Network/networkWatchers/OpalWatcher1",
            "Microsoft.Storage/storageAccounts/opalsa01"
          ],
          "location": "switzerlandnorth",
          "name": "FL1",
          "properties": {
            "retentionPolicy": {
              "days": 90,
              "enabled": true
            },
            "storageId": "[resourceId('Microsoft.Storage/storageAccounts', 'opalsa01')]",
            "targetResourceId": "[resourceId('Microsoft.Network/networkSecurityGroups', 'OpalNSG1')]"
          },
          "type": "flowLogs"
        }
      ],
      "type": "Microsoft.Network/networkWatchers"
    }
  ]
}

