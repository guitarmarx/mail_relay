#!/bin/bash
set -e

# check postfix is running
ps -C master ||  exit 1

# return 0 if when all checks passed
exit 0