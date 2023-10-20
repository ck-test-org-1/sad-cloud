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

package policies.arm_postgresql_configuration_log_duration

import data.tests.policies.arm.postgresql.inputs.configuration_infra_json as infra
import data.tests.policies.arm.postgresql.inputs.invalid_configuration_infra_json as invalid_infra

test_rule {
	pol = policy with input as infra.mock_input
	by_resource_id = {p.id: p.valid | pol[p]}
	count(by_resource_id) == 1
	by_resource_id["Microsoft.DBforPostgreSQL/servers/OpalServerConfigValid"] == true
}

test_invalid_rule {
	pol = policy with input as invalid_infra.mock_input
	by_resource_id = {p.id: p.valid | pol[p]}
	count(by_resource_id) == 2
	by_resource_id["Microsoft.DBforPostgreSQL/servers/OpalServerConfigInvalid"] == false
	by_resource_id["Microsoft.DBforPostgreSQL/servers/OpalServerConfigDefault"] == false
}
