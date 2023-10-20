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

package policies.arm_authorization_custom_owner_role

import data.lacework
import data.lacework.utils

input_type := "arm"

resource_type := "Microsoft.Authorization/roleDefinitions"

is_subscription_scope(scope) {
	scope == "/"
}

# Examples:
# * "/subscriptions/479a226b-4153-48f7-8943-3e8e388a93cb"
# * "/subscriptions/479a226b-4153-48f7-8943-3e8e388a93cb/"
is_subscription_scope(scope) {
	re_match(`^/subscriptions/[^/]+/?$`, lower(scope))
}

# Examples:
# * "[concat('/subscriptions/', subscription().subscriptionId)]"
# * "[concat('/subscriptions/', '479a226b-4153-48f7-8943-3e8e388a93cb')]"
# * "[concat('/subscriptions/', parameters('subscriptionId'))]"
is_subscription_scope(scope) {
	re_match(`^\[concat\('/subscriptions/',[^,]+\]$`, replace(lower(scope), " ", ""))
}

is_subscription_scope(scope) {
	replace(lower(scope), " ", "") == "[subscription().id]"
}

default deny = false

deny {
	actions := utils.as_array(input.properties.permissions[_].actions)
	actions[_] == "*"
	is_subscription_scope(input.properties.assignableScopes[_])
}
