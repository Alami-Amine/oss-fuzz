#!/bin/bash -eu
# Copyright 2024 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
################################################################################

# Update local crate.io vendors
cargo vendor -- /src/fuchsia/third_party/rust_crates/vendor/

# Build the fuzzers and project source code
cargo fuzz build

# Copy built fuzzer binaries to $OUT
cp /src/fuchsia/out/cargo_target/x86_64-unknown-linux-gnu/release/core_fuzzer $OUT/
cp /src/fuchsia/out/cargo_target/x86_64-unknown-linux-gnu/release/utils_fuzzer $OUT/
