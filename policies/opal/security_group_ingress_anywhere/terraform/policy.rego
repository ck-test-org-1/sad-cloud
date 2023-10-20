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
package policies.tf_aws_security_group_ingress_anywhere

import data.aws.security_groups.library as sglib

resource_type := "aws_security_group"

whitelisted_ports = {80, 443}

whitelisted_ingress_rule(rule) {
  rule.from_port == rule.to_port
  whitelisted_ports[rule.from_port]
}

bad_ingress_rule(rule) {
  sglib.rule_zero_cidr(rule)
  not sglib.rule_self_only(rule)
  not whitelisted_ingress_rule(rule)
}

default deny = false

deny {
  rule = input.ingress[_]
  bad_ingress_rule(rule)
}
