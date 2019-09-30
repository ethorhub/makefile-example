IDIR = include
ODIR = obj
SRCDIR = src
LDIR = lib

#CC = gcc
CC = g++
CFLAGS = -Wall -I$(IDIR) -L$(LDIR) -fPIC

#LIBS = -lstdc++
LIBS = -lhello

_DEPS = hello.hpp
DEPS = $(patsubst %,$(IDIR)/%,$(_DEPS))

_OBJ = main.o
OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))

$(ODIR)/%.o: $(SRCDIR)/%.cpp $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

start:
	LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./lib bin/main
	bin/main_static

build: libhello bin/main bin/main_static

bin/main: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS) $(LIBS)

bin/main_static: $(OBJ)
	$(CC) -static -o $@ $^ $(CFLAGS) $(LIBS)
	rm -f $(ODIR)/main.o

libhello: $(ODIR)/hello.o
	$(CC) $(CFLAGS) -shared -o lib/$@.so $^
	ar -rcs lib/$@.a $^
	rm -f $(ODIR)/hello.o

.PHONY: clean
clean:
	rm -f bin/* $(ODIR)/*.o $(LDIR)/*.a $(LDIR)/*.so