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
package tests.policies.tf.aws.security_group.inputs.invalid_ingress_anywhere_rdp_infra_tf

import data.lacework.resource_view.resource_view_input

mock_input := ret {
  ret = resource_view_input with input as mock_config
}
mock_resources := mock_input.resources
mock_config := {
  "hcl_resource_view_version": "0.0.1",
  "resources": {
    "aws_security_group.invalid_sg_1": {
      "_filepath": "tests/policies/tf/aws/security_group/inputs/ingress_anywhere_rdp_infra.tf",
      "_provider": "aws",
      "_type": "aws_security_group",
      "id": "aws_security_group.invalid_sg_1",
      "ingress": [
        {
          "cidr_blocks": [
            "0.0.0.0/0"
          ],
          "from_port": 3389,
          "protocol": "tcp",
          "to_port": 3389
        }
      ],
      "name": "invalid_sg_1"
    },
    "aws_security_group.invalid_sg_2": {
      "_filepath": "tests/policies/tf/aws/security_group/inputs/ingress_anywhere_rdp_infra.tf",
      "_provider": "aws",
      "_type": "aws_security_group",
      "id": "aws_security_group.invalid_sg_2",
      "ingress": [
        {
          "cidr_blocks": [
            "0.0.0.0/0"
          ],
          "from_port": 3380,
          "protocol": "tcp",
          "to_port": 3390
        }
      ],
      "name": "invalid_sg_2"
    }
  }
}

