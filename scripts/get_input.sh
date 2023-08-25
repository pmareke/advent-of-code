#!/bin/bash

get_input () {
  header="Cookie:$ADVENT_OF_CODE_COOKIE"

  curl --header $header https://adventofcode.com/2022/day/$1/input > "inputs/$1.in"
}

get_input $1
