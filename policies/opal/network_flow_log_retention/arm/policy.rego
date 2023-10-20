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

package policies.arm_network_flow_log_retention

import data.lacework

input_type := "arm"

resource_type := "MULTIPLE"

network_security_groups = lacework.resources("Microsoft.Network/networkSecurityGroups")

flow_logs = lacework.resources("Microsoft.Network/networkWatchers/flowLogs")

nsg_id_to_flow_logs := {nsg_id: nsg_flow_logs |
	_ := network_security_groups[nsg_id]
	nsg_flow_logs := [flow_log |
		flow_log := flow_logs[_]
		nsg_id == flow_log.properties.targetResourceId
	]
}

flow_log_has_retention(flow_log) {
	flow_log.properties.retentionPolicy.enabled == true
	flow_log.properties.retentionPolicy.days >= 90
}

bad_nsg(nsg) = msg {
	count(nsg_id_to_flow_logs[nsg.id]) < 1
	msg := "No associated flow logs found"
} else = msg {
	flow_log := nsg_id_to_flow_logs[nsg.id][_]
	not flow_log_has_retention(flow_log)
	msg := "Retention policy needs to be set to 90 days or more"
}

policy[p] {
	nsg := network_security_groups[_]
	msg := bad_nsg(nsg)
	p := lacework.deny({"resource": nsg, "message": msg})
}

policy[p] {
	nsg := network_security_groups[_]
	not bad_nsg(nsg)
	p := lacework.allow({"resource": nsg})
}
