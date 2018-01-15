#!/usr/bin/python

import sys
import re

code = sys.stdin.readlines()
labels = {}
num = 0
instr = 0

for line in code:
	num += 1
	# label
	label = re.match(r"^(\w+):$", line)
	if label:
		num -= 1
		labels[label.group(1)] = num

for line in code:
	digits = re.findall(r"\d+", line)
	res = -1

	# R Type
	if re.search(r"^add ", line):
		op = 0
		func = "100000"
		rs = int(digits[1])
		rt = int(digits[2])
		rd = int(digits[0])
		res = '{0:06b}'.format(op)+ '{0:05b}'.format(rs) + '{0:05b}'.format(rt) + '{0:05b}'.format(rd) + '{0:05b}'.format(0) + func
	if re.search(r"^sub ", line):
		op = 0
		func = "100010"
		rs = int(digits[1])
		rt = int(digits[2])
		rd = int(digits[0])
		res = '{0:06b}'.format(op)+ '{0:05b}'.format(rs) + '{0:05b}'.format(rt) + '{0:05b}'.format(rd) + '{0:05b}'.format(0) + func
	if re.search(r"^and ", line):
		op = 0
		func = "100100"
		rs = int(digits[1])
		rt = int(digits[2])
		rd = int(digits[0])
		res = '{0:06b}'.format(op)+ '{0:05b}'.format(rs) + '{0:05b}'.format(rt) + '{0:05b}'.format(rd) + '{0:05b}'.format(0) + func
	if re.search(r"^or ", line):
		op = 0
		func = "100101"
		rs = int(digits[1])
		rt = int(digits[2])
		rd = int(digits[0])
		res = '{0:06b}'.format(op)+ '{0:05b}'.format(rs) + '{0:05b}'.format(rt) + '{0:05b}'.format(rd) + '{0:05b}'.format(0) + func
	if re.search(r"^slt ", line):
		op = 0
		func = "101010"
		rs = int(digits[1])
		rt = int(digits[2])
		rd = int(digits[0])
		res = '{0:06b}'.format(op)+ '{0:05b}'.format(rs) + '{0:05b}'.format(rt) + '{0:05b}'.format(rd) + '{0:05b}'.format(0) + func
		
	# I Type
	if re.search(r"^beq ", line):
		op = "000100"
		rs = int(digits[0])
		rt = int(digits[1])
		label = re.findall(r"\w+$", line)
		dest = labels[label[0]] - instr
		if dest < 0:
			res = op + '{0:05b}'.format(rs) + '{0:05b}'.format(rt) + '{0:016b}'.format(dest & 0b1111111111111111)
		else:
			res = op + '{0:05b}'.format(rs) + '{0:05b}'.format(rt) + '{0:016b}'.format(dest)

	if re.search(r"^lb ", line):
		op = "100000"
		rs = int(digits[2])
		rt = int(digits[0])
		imm = int(digits[1])
		res = op + '{0:05b}'.format(rs) + '{0:05b}'.format(rt) + '{0:016b}'.format(imm)
	if re.search(r"^sb ", line):
		op = "101000"
		rs = int(digits[2])
		rt = int(digits[0])
		imm = int(digits[1])
		res = op + '{0:05b}'.format(rs) + '{0:05b}'.format(rt) + '{0:016b}'.format(imm)
	if re.search(r"^addi ", line):
		op = "001000"
		rs = int(digits[1])
		rt = int(digits[0])
		imm = int(digits[2])
		if imm < 0:
			res = op + '{0:05b}'.format(rs) + '{0:05b}'.format(rt) + '{0:016b}'.format(imm & 0b1111111111111111)
		else:
			res = op + '{0:05b}'.format(rs) + '{0:05b}'.format(rt) + '{0:016b}'.format(imm)
	# J Type
	if re.search(r"^j ", line):
		label = re.findall(r"\w+$", line)
		res = "000010" + '{0:026b}'.format(labels[label[0]])
	
	# NOP
	if re.search(r"^nop ", line):
		res = '{0:032b}'.format(0)

	if res != -1:
		instr += 1
		for i in range(0, 32, 8):
			print "\"" + res[i:i+8] + "\","
res = '{0:032b}'.format(0)
for j in range(0, (64-instr)):
	for i in range(0, 32, 8):
		print "\"" + res[i:i+8] + "\","
