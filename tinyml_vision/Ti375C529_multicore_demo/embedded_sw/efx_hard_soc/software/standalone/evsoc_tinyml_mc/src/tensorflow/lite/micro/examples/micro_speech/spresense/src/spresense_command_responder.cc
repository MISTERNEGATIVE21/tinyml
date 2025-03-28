/* Copyright 2021 The TensorFlow Authors. All Rights Reserved.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
==============================================================================*/

// The SPRESENSE_CONFIG_H is defined on compiler option.
// It contains "nuttx/config.h" from Spresense SDK to see the configurated
// parameters.
#include SPRESENSE_CONFIG_H
#include "spresense_command_responder.h"

#include "tensorflow/lite/micro/examples/micro_speech/command_responder.h"

// The default implementation writes out the name of the recognized command
// to the error console. Real applications will want to take some custom
// action instead, and should implement their own versions of this function.
void RespondToCommand(tflite::ErrorReporter* error_reporter,
                      int32_t current_time, const char* found_command,
                      uint8_t score, bool is_new_command) {
  TF_LITE_REPORT_ERROR(error_reporter, "%s Heard %s (%d) @%dms",
                       is_new_command ? "F" : " ", found_command, score,
                       current_time);
}
