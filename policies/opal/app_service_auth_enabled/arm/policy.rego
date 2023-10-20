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

package policies.arm_app_service_auth_enabled

import data.lacework

input_type := "arm"

resource_type := "MULTIPLE"

sites := lacework.resources("Microsoft.Web/sites")
configs := lacework.resources("Microsoft.Web/sites/config")

is_valid_authsettings(c) {
	c.name == "authsettings"
	c.properties.enabled == true
}

is_valid_authsettings(c) {
	c.name == "authsettingsv2"
	c.properties.platform.enabled == true
}

valid_sites := {id |
	c := configs[_]
	is_valid_authsettings(c)
	id := c._parent_id
	sites[id]
}

policy[p] {
	s := sites[id]
	not valid_sites[id]
	p = lacework.deny_resource(s)
}

policy[p] {
	s := sites[id]
	valid_sites[id]
	p = lacework.allow_resource(s)
}
