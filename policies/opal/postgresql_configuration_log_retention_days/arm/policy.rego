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

package policies.arm_postgresql_configuration_log_retention_days

import data.lacework
import data.arm.postgresql_configuration_library as lib

input_type := "arm"

resource_type := "MULTIPLE"

is_valid(server) {
    days = lib.configuration_value(server, "log_retention_days")
    to_number(days) > 3
}

policy[p] {
	server = lib.servers[_]
	is_valid(server)
	p = lacework.allow_resource(server)
}

policy[p] {
	server = lib.servers[_]
	not is_valid(server)
	p = lacework.deny_resource(server)
}
