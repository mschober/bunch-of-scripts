#!/bin/bash

function _PY {
  CMD_ARGS=${@:2}
  python -c "from expect_one_parameter_max import *; $1('$CMD_ARGS')"
}

_PY "expect_one_parameter_max" $@
