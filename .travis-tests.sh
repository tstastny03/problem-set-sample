#! /bin/bash

test -e ssshtest || wget -q https://raw.githubusercontent.com/jayhesselberth/ssshtest/master/ssshtest
source ssshtest

set -o nounset

run test_dir ls projects/
assert_no_stderr

run test_bed file result.bed.gz
assert_in_stdout compressed

source travis-vars.sh

run test_equal_dir
assert_equal_str "$PROJECT" "project"

run test_equal_project 
assert_equal_str "$ANSWER1" 6.24
