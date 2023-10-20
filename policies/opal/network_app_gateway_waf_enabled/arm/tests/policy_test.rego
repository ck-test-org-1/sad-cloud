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

package policies.arm_network_app_gateway_waf_enabled

import data.tests.policies.arm.network.inputs.app_gateway_waf_enabled_infra_json as infra
import data.tests.policies.arm.network.inputs.invalid_app_gateway_waf_enabled_infra_json as invalid_infra

test_rule {
	not allow with input as invalid_infra.mock_resources["Microsoft.Network/applicationGateways/OpalAG1"]
	allow with input as infra.mock_resources["Microsoft.Network/applicationGateways/OpalAG2"]
}
