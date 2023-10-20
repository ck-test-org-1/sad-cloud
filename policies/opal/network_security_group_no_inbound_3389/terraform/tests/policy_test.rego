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
package policies.tf_network_security_group_no_inbound_3389

import data.tests.policies.tf.azurerm.network.inputs

import data.lacework

report = lacework.report_v0("", policy)

test_invalid_inbound_port_3389 {
  r := report with input as inputs.invalid_inbound_port_3389_tf.mock_input
  not r.valid

  # Test that we have both cases.
  rule = r.resources[_]
  rule.type == "azurerm_network_security_rule"
  not rule.valid

  # Test that we have both cases.
  group = r.resources[_]
  group.type == "azurerm_network_security_group"
  not group.valid
}

test_valid_inbound_port_3389 {
  r := report with input as inputs.valid_inbound_port_3389_tf.mock_input
  r.valid

  # Test that we have both cases.
  rule = r.resources[_]
  rule.type == "azurerm_network_security_rule"
  rule.valid

  # Test that we have both cases.
  group = r.resources[_]
  group.type == "azurerm_network_security_group"
  group.valid
}
