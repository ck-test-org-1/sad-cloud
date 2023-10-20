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

package policies.arm_monitor_log_profile_retention

import data.lacework

input_type := "arm"

resource_type := "Microsoft.Insights/logprofiles"

default allow = false

allow {
	input.properties.retentionPolicy.enabled == true
	input.properties.retentionPolicy.days >= 365
}

allow {
	input.properties.retentionPolicy.enabled == true
	# A value of 0 will retain the events indefinitely.
	input.properties.retentionPolicy.days == 0
}
