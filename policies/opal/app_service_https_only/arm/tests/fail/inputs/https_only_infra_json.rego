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
package tests.policies.arm.app_service.inputs.invalid_https_only_infra_json

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
      "apiVersion": "2021-02-01",
      "location": "[resourceGroup().location]",
      "name": "appServicePlanPortal",
      "sku": {
        "name": "B1",
        "size": "B1",
        "tier": "Basic"
      },
      "type": "Microsoft.Web/serverfarms"
    },
    {
      "apiVersion": "2021-02-01",
      "dependsOn": [
        "[resourceId('Microsoft.Web/serverfarms', 'appServicePlanPortal')]"
      ],
      "location": "[resourceGroup().location]",
      "name": "enabled",
      "properties": {
        "httpsOnly": true,
        "serverFarmId": "[resourceId('Microsoft.Web/serverfarms', 'appServicePlanPortal')]"
      },
      "type": "Microsoft.Web/sites"
    },
    {
      "apiVersion": "2021-02-01",
      "dependsOn": [
        "[resourceId('Microsoft.Web/serverfarms', 'appServicePlanPortal')]"
      ],
      "location": "[resourceGroup().location]",
      "name": "disabled",
      "properties": {
        "httpsOnly": false,
        "serverFarmId": "[resourceId('Microsoft.Web/serverfarms', 'appServicePlanPortal')]"
      },
      "type": "Microsoft.Web/sites"
    },
    {
      "apiVersion": "2021-02-01",
      "dependsOn": [
        "[resourceId('Microsoft.Web/serverfarms', 'appServicePlanPortal')]"
      ],
      "location": "[resourceGroup().location]",
      "name": "default",
      "properties": {
        "serverFarmId": "[resourceId('Microsoft.Web/serverfarms', 'appServicePlanPortal')]"
      },
      "type": "Microsoft.Web/sites"
    }
  ]
}

