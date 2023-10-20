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

import data.lacework

input_type := "arm"

resource_type := "Microsoft.Network/applicationGateways"

default allow = false

allow {
	waf_sku_tiers[input.properties.sku.tier]
	input.properties.webApplicationFirewallConfiguration.enabled == true
}

waf_sku_tiers = {"WAF", "WAF_v2"}
