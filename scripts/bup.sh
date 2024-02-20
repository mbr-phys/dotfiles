#!/bin/bash

v="$(light | cut -d. -f1)"
n=$(( $v + 5 ))
light -S $n

