#!/bin/bash
# Copyright 2020 The TensorFlow Authors. All Rights Reserved.
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
# ==============================================================================
#
# Bash unit tests for the example binary.

set -e

OUTPUT_LOG_FILE=${TEST_TMPDIR}/output_log.txt

# Needed for copybara compatibility.
SCRIPT_BASE_DIR=/org_"tensor"flow
${TEST_SRCDIR}${SCRIPT_BASE_DIR}/tensorflow/lite/micro/examples/hello_world/hello_world   2>&1 | head > ${OUTPUT_LOG_FILE}

if ! grep -q 'x_value:.*y_value:' ${OUTPUT_LOG_FILE}; then
  echo "ERROR: Expected logs not found in output '${OUTPUT_LOG_FILE}'"
  exit 1
fi

echo
echo "SUCCESS: hello_world_binary_test PASSED"
