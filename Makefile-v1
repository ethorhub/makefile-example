IDIR = include
ODIR = obj
SRCDIR = src
BINDIR = bin
LDIR = lib

#CC = gcc
CC = g++
CFLAGS = -Wall -I$(IDIR) -L$(LDIR) -fPIC

_DEPS = *.hpp
DEPS = $(patsubst %,$(IDIR)/%,$(_DEPS))

_OBJ := main.o
_OBJ += hello.o sum.o
OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))

$(ODIR)/%.o: $(SRCDIR)/%.cpp $(DEPS)
	@$(CC) -c -o $@ $< $(CFLAGS)

run_dynamic:
	@LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./lib $(BINDIR)/main
	
run_static:
	@$(BINDIR)/main_static

build: liboperation libhello $(BINDIR)/main $(BINDIR)/main_static buildClean
buildClean:
	@$(RM) $(ODIR)/*.o $(ODIR)/**/*.o $(LDIR)/*.a

#LIBS = -lstdc++
LIBS = -loperation -lhello
$(BINDIR)/main: $(OBJ)
	@$(CC) -o $@ $^ $(CFLAGS) $(LIBS)

LIBS = -loperation -lhello
$(BINDIR)/main_static: $(OBJ)
	@$(CC) -static -o $@ $^ $(CFLAGS) $(LIBS)

liboperation: $(ODIR)/operation/sum.o
	@$(CC) $(CFLAGS) -shared -o lib/$@.so $^
	@ar -rcs $(LDIR)/$@.a $^

libhello: $(ODIR)/hello/hello.o
	@$(CC) $(CFLAGS) -shared -o lib/$@.so $^
	@ar -rcs $(LDIR)/$@.a $^

.PHONY: clean
clean: buildClean
	@$(RM) $(BINDIR)/* $(LDIR)/*.so a
ifeq ($(FORCE),true)
	@$(RM) -rf bin lib obj
endif


#all Makefile-v... files to default
default-make:
	@cp Makefile Makefile-v1
	@mv Makefile.orig Makefile