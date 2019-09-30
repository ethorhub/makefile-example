IDIR = include
ODIR = obj
SRCDIR = src
LDIR = lib

#CC = gcc
CC = g++
CFLAGS = -Wall -I$(IDIR) -L$(LDIR) -fPIC

_DEPS = operation/sum.hpp hello/hello.hpp
DEPS = $(patsubst %,$(IDIR)/%,$(_DEPS))

_OBJ = main.o hello.o
OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))

$(ODIR)/%.o: $(SRCDIR)/%.cpp $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

start:
	LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./lib bin/main
	bin/main_static

build: liboperation libhello bin/main bin/main_static buildClean
buildClean:
	rm -f $(ODIR)/*.o $(ODIR)/**/*.o $(LDIR)/*.a

#LIBS = -lstdc++
LIBS = -loperation -lhello
bin/main: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS) $(LIBS)

LIBS = -loperation -lhello
bin/main_static: $(OBJ)
	$(CC) -static -o $@ $^ $(CFLAGS) $(LIBS)

liboperation: $(ODIR)/operation/sum.o
	$(CC) $(CFLAGS) -shared -o lib/$@.so $^
	ar -rcs $(LDIR)/$@.a $^

libhello: $(ODIR)/hello/hello.o
	$(CC) $(CFLAGS) -shared -o lib/$@.so $^
	ar -rcs $(LDIR)/$@.a $^

.PHONY: clean
clean: buildClean
	rm -f bin/* $(LDIR)/*.so