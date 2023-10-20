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

package policies.arm_app_service_client_certs

import data.tests.policies.arm.app_service.inputs.client_certs_infra_json as infra
import data.tests.policies.arm.app_service.inputs.invalid_client_certs_infra_json as invalid_infra

test_client_certs {
	allow with input as infra.mock_resources["Microsoft.Web/sites/enabled"]
}

test_invalid_client_certs {
	not allow with input as invalid_infra.mock_resources["Microsoft.Web/sites/disabled"]
	not allow with input as invalid_infra.mock_resources["Microsoft.Web/sites/default"]
}