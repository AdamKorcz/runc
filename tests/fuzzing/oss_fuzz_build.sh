#!/usr/bin/env bash

# This file is only meant to be run by OSS-fuzz and will not work
# if run outside of it.
# The api, compile_go_fuzzer() is provided by the OSS-fuzz
# environment and is a high level helper function for a series
# of compilation and linking steps to build the fuzzers in the 
# OSS-fuzz environment.
# More info about compile_go_fuzzer() can be found here:
#     https://google.github.io/oss-fuzz/getting-started/new-project-guide/go-lang/#buildsh
compile_go_fuzzer ./libcontainer/system FuzzUIDMap id_map_fuzzer linux
compile_go_fuzzer ./libcontainer/user FuzzUser user_fuzzer
compile_go_fuzzer ./libcontainer/configs FuzzUnmarshalJSON configs_fuzzer

# Build fuzzers from an independent repository
git clone --depth 1 https://github.com/AdaLogics/runc-fuzzers $SRC/runc-fuzzers
$SRC/runc-fuzzers/build.sh
