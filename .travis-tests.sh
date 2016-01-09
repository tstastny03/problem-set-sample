#! /bin/bash

test -e ssshtest || wget -q https://raw.githubusercontent.com/ryanlayer/ssshtest/master/ssshtest
source ssshtest

set -o nounset

run check_dir ls projects/
assert_no_stderr

run check_bed file result.bed.gz
assert_in_stdout compressed

source travis-vars.sh

run assert_equal $PROJECT directory
run assert_equal $ANSWER1 6.24

run assert_equal $PROJECT notok
run assert_equal $ANSWER1 8000
