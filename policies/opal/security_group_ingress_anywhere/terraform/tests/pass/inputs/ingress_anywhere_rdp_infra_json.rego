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
package tests.policies.tf.aws.security_group.inputs.ingress_anywhere_rdp_infra_json

import data.lacework.resource_view.resource_view_input

mock_input := ret {
  ret = resource_view_input with input as mock_config
}
mock_resources := mock_input.resources
mock_config := {
  "configuration": {
    "provider_config": {
      "aws": {
        "expressions": {
          "region": {
            "constant_value": "us-east-1"
          }
        },
        "name": "aws"
      }
    },
    "root_module": {
      "resources": [
        {
          "address": "aws_security_group.valid_sg_1",
          "expressions": {
            "name": {
              "constant_value": "valid_sg_1"
            }
          },
          "mode": "managed",
          "name": "valid_sg_1",
          "provider_config_key": "aws",
          "schema_version": 1,
          "type": "aws_security_group"
        },
        {
          "address": "aws_security_group.valid_sg_2",
          "expressions": {
            "name": {
              "constant_value": "valid_sg_2"
            }
          },
          "mode": "managed",
          "name": "valid_sg_2",
          "provider_config_key": "aws",
          "schema_version": 1,
          "type": "aws_security_group"
        }
      ]
    }
  },
  "format_version": "0.1",
  "planned_values": {
    "root_module": {
      "resources": [
        {
          "address": "aws_security_group.valid_sg_1",
          "mode": "managed",
          "name": "valid_sg_1",
          "provider_name": "registry.terraform.io/hashicorp/aws",
          "schema_version": 1,
          "type": "aws_security_group",
          "values": {
            "description": "Managed by Terraform",
            "ingress": [
              {
                "cidr_blocks": [
                  "0.0.0.0/0"
                ],
                "description": "",
                "from_port": 22,
                "ipv6_cidr_blocks": [],
                "prefix_list_ids": [],
                "protocol": "tcp",
                "security_groups": [],
                "self": false,
                "to_port": 22
              }
            ],
            "name": "valid_sg_1",
            "revoke_rules_on_delete": false,
            "tags": null,
            "timeouts": null
          }
        },
        {
          "address": "aws_security_group.valid_sg_2",
          "mode": "managed",
          "name": "valid_sg_2",
          "provider_name": "registry.terraform.io/hashicorp/aws",
          "schema_version": 1,
          "type": "aws_security_group",
          "values": {
            "description": "Managed by Terraform",
            "ingress": [
              {
                "cidr_blocks": [
                  "10.10.0.0/16"
                ],
                "description": "",
                "from_port": 3389,
                "ipv6_cidr_blocks": [],
                "prefix_list_ids": [],
                "protocol": "tcp",
                "security_groups": [],
                "self": false,
                "to_port": 3389
              }
            ],
            "name": "valid_sg_2",
            "revoke_rules_on_delete": false,
            "tags": null,
            "timeouts": null
          }
        }
      ]
    }
  },
  "resource_changes": [
    {
      "address": "aws_security_group.valid_sg_1",
      "change": {
        "actions": [
          "create"
        ],
        "after": {
          "description": "Managed by Terraform",
          "ingress": [
            {
              "cidr_blocks": [
                "0.0.0.0/0"
              ],
              "description": "",
              "from_port": 22,
              "ipv6_cidr_blocks": [],
              "prefix_list_ids": [],
              "protocol": "tcp",
              "security_groups": [],
              "self": false,
              "to_port": 22
            }
          ],
          "name": "valid_sg_1",
          "revoke_rules_on_delete": false,
          "tags": null,
          "timeouts": null
        },
        "after_unknown": {
          "arn": true,
          "egress": true,
          "id": true,
          "ingress": [
            {
              "cidr_blocks": [
                false
              ],
              "ipv6_cidr_blocks": [],
              "prefix_list_ids": [],
              "security_groups": []
            }
          ],
          "name_prefix": true,
          "owner_id": true,
          "tags_all": true,
          "vpc_id": true
        },
        "before": null
      },
      "mode": "managed",
      "name": "valid_sg_1",
      "provider_name": "registry.terraform.io/hashicorp/aws",
      "type": "aws_security_group"
    },
    {
      "address": "aws_security_group.valid_sg_2",
      "change": {
        "actions": [
          "create"
        ],
        "after": {
          "description": "Managed by Terraform",
          "ingress": [
            {
              "cidr_blocks": [
                "10.10.0.0/16"
              ],
              "description": "",
              "from_port": 3389,
              "ipv6_cidr_blocks": [],
              "prefix_list_ids": [],
              "protocol": "tcp",
              "security_groups": [],
              "self": false,
              "to_port": 3389
            }
          ],
          "name": "valid_sg_2",
          "revoke_rules_on_delete": false,
          "tags": null,
          "timeouts": null
        },
        "after_unknown": {
          "arn": true,
          "egress": true,
          "id": true,
          "ingress": [
            {
              "cidr_blocks": [
                false
              ],
              "ipv6_cidr_blocks": [],
              "prefix_list_ids": [],
              "security_groups": []
            }
          ],
          "name_prefix": true,
          "owner_id": true,
          "tags_all": true,
          "vpc_id": true
        },
        "before": null
      },
      "mode": "managed",
      "name": "valid_sg_2",
      "provider_name": "registry.terraform.io/hashicorp/aws",
      "type": "aws_security_group"
    }
  ],
  "terraform_version": "0.13.5"
}

