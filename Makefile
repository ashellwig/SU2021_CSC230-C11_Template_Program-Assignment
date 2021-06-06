# vim: set noet ts=4 sw=4 ft=Makefile:
## Module 1 Programming Assignment 1 (Chapter 10) Program: Swimming Pool
## Ashton S. Hellwig
## Date: 06 June 2021
## Instructor: Linda Hamons
## Course:
##   [CSC161] Computer Science II (C++)
##


# --- Variables ---
PROGRAM := out/bin/ashellwig_m1c10pa_swimming-pool.bin
CXX := /usr/bin/g++
DOXYGEN := /bin/doxygen
RM := /sbin/rm
mv := /sbin/mv

# === VARIABLES ===
# --- Program Variables ---
SRC := $(wildcard src/*.cxx)
INCLUDES := include
OBJS := $(addprefix out/obj/, $(notdir $(SRC:.cxx=.o)))
CXXFLAGS := \
	-c \
	-std=c++2a \
	-Wall \
	-Wextra \
	-g \
	-ggdb \
	-DDEBUG=1
LFLAGS := \
	-std=c++2a \
	-ggdb \
	-DDEBUG=1

# --- Test Variables ---
TEST_PROGRAM := out/bin/test
TEST_SRC := test/00_CatchMain.cxx src/SwimmingPool.cxx 01_TestSwimmingPool.cxx
TEST_INCLUDES := -Iinclude -Itest/include -isystem include/catch2
TEST_OBJS := $(addprefix out/obj/, $(notdir $(TEST_SRC:.cxx=.o)))
TEST_OBJS += out/obj/SwimmingPool.o
TEST_CXXFLAGS := \
	-std=c++17 \
	-g \
	-ggdb
TEST_LFLAGS := -std=c++17

# -- Documentation Variables
DOC_DOXYGEN_OUT := out/doc/doxygen
DOC_DOXYGEN_SUBDIRS := \
	out/doc/doxygen/html \
	out/doc/doxygen/latex \
	out/doc/doxygen/man \
	out/doc/doxygen/rtf

# === Rules ===
# --- Chains ---
all: user-doc-release debug unit-test clean
clean: user-doc-clean doc-doxygen-clean
	$(RM) -f out/obj/*.o
	$(RM) -f out/obj/*.o
clean-all: clean user-doc-clean-all
	$(RM) -f out/bin/*.bin
	$(RM) -f out/bin/test
	$(RM) -f out/doc/user_docs.pdf

# --- Debug Build ---
debug: $(OBJS)
	$(CXX) \
		$(LFLAGS) \
		-o $(PROGRAM) \
		$(OBJS) \
		-I$(INCLUDES)

out/obj/%.o: src/%.cxx
	$(CXX) $(CXXFLAGS) -c $< -o $@ -I$(INCLUDES)

# --- Tests ---
test: debug
	$(CXX) $(CXXFLAGS) \
		-c src/SwimmingPool.cxx \
		-o out/obj/SwimmingPool.o \
		-I$(INCLUDES)

	$(CXX) $(TEST_CXXFLAGS) \
		-c test/00_CatchMain.cxx \
		-o out/obj/00_CatchMain.o \
		$(TEST_INCLUDES)

	$(CXX) $(TEST_CXXFLAGS) \
		-c test/01_TestSwimmingPool.cxx \
		-o out/obj/01_TestSwimmingPool.o \
		$(TEST_INCLUDES) -I$(INCLUDES)

	$(CXX) $(TEST_LFLAGS) -o out/bin/test.bin \
		out/obj/SwimmingPool.o \
		out/obj/00_CatchMain.o \
		out/obj/01_TestSwimmingPool.o \
		$(TEST_INCLUDES) -I$(INCLUDES)

unit-test: test
	./out/bin/test.bin \
	--success \
	--reporter console \
	--use-colour yes \
	--abort \
	--durations no \
	--filenames-as-tags \
	--verbosity normal


# Doc
doc-doxygen-build:
	$(DOXYGEN) Doxyfile
doc-doxygen-clean:
	$(foreach docsubdir,$(DOC_DOXYGEN_SUBDIRS),$(RM) -rf $(docsubdir);)
user-doc-release: user-doc-build user-doc-clean
	cp -R doc/user_docs/main.pdf out/doc/user_docs.pdf
user-doc-build:
	$(MAKE) -C doc/user_docs user-doc-build
user-doc-clean:
	$(MAKE) -C doc/user_docs user-doc-clean
user-doc-clean-all:
	$(MAKE) -C doc/user_docs user-doc-clean-all
