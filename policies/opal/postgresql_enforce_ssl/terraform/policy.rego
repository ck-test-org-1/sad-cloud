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
package policies.tf_postgresql_enforce_ssl

__rego__metadoc__ := {
  "custom": {
    "controls": {
      "CIS-Azure_v1.1.0": [
        "CIS-Azure_v1.1.0_4.13"
      ],
      "CIS-Azure_v1.3.0": [
        "CIS-Azure_v1.3.0_4.3.1"
      ]
    },
    "severity": "Medium"
  },
  "description": "PostgreSQL Database server 'enforce SSL connection' should be enabled. Enforcing SSL connections between your database server and your client applications helps protect against \"man in the middle\" attacks by encrypting the data stream between the server and your application.",
  "id": "FG_R00226",
  "title": "PostgreSQL Database server 'enforce SSL connection' should be enabled"
}

resource_type := "azurerm_postgresql_server"

default allow = false

allow {
  input.ssl_enforcement == "Enabled"
} {
  # New version of the provider.
  input.ssl_enforcement_enabled == true
}
