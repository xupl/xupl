# Copyright 2013 Nice Robot Corporation
# 
# This file is part of Xupl.
# 
# Xupl is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# Xupl is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with Xupl.  If not, see <http://www.gnu.org/licenses/>.

.PHONY : clean test check run all enter finish leave dot

test: all
	@cd test; make

all: build .log xupl

xupl: build/xupl.o build/main.o
	@date +v0.1+%y%j.%H%M | tee VERSION.txt
	@cc -o $@ $^ `xml2-config --libs` 2>&1 | tee .log/ld-xupl.out

build:
	@mkdir build

build/%.o: src/%.c ; @cc -c -std=gnu99 -Iinclude `xml2-config --cflags` -o $@ $^ 2>&1 | tee -a .log/cc-xupl.out

check: test

clean: .log
	@rm -vfr build .log *.c *.dot *.png xupl | tee .log/clean.out
	@cd test; make clean

.log:
	@mkdir .log
