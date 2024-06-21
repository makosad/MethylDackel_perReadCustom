prefix ?= /usr/local/bin #This can be changed
CC ?= gcc
LIBS ?=  # e.g., -L$PREFIX/lib, or where ever htslib is
LIBBIGWIG ?=
CFLAGS ?= -Wall -g -O3 -pthread

.PHONY: all clean install

.SUFFIXES:.c .o

all: MethylDackel

OBJS = common.o bed.o svg.o overlaps.o MBias.o mergeContext.o perRead.o
# OBJS = common.o bed.o svg.o overlaps.o extract.o MBias.o mergeContext.o perRead.o
VERSION = 0.6.1

version.h:
	echo '#define VERSION "$(VERSION)"' > $@

.c.o:
	$(CC) -c $(CFLAGS) $(LIBS) -IlibBigWig $< -o $@

libMethylDackel.a: version.h $(OBJS)
	-@rm -f $@
	$(AR) -rcs $@ $(OBJS)

lib: libMethylDackel.a

MethylDackel: libMethylDackel.a version.h $(OBJS)
	$(CC) $(CFLAGS) $(LIBS) -o MethylDackel $(OBJS) main.c libMethylDackel.a $(LIBBIGWIG) -lm -lz -lpthread -lhts -lcurl

test: MethylDackel
	python tests/test.py

clean:
	rm -f *.o MethylDackel libMethylDackel.a

install: MethylDackel
	install MethylDackel $(prefix)
