#!/bin/bash

./mips_parser.py < $1 | sed '$s/,//' | pbcopy