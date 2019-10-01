#Directory names
BINDIR = bin
INCLUDEDIR = include
LIBDIR = lib
OBJDIR = obj
SRCDIR = src

#C compiler info
#CC = gcc
CC = g++
CFLAGS = -Wall -I$(INCLUDEDIR) -L$(LIBDIR) -fPIC

#Header files
_DEPS = *.hpp
DEPS = $(patsubst %,$(INCLUDEDIR)/%,$(_DEPS))

#Object files
_OBJ := main.o
_OBJ += hello.o sum.o
OBJ = $(patsubst %,$(OBJDIR)/%,$(_OBJ))

#Create object files from source
$(OBJDIR)/%.o: $(SRCDIR)/%.cpp $(DEPS)
	@$(CC) -c -o $@ $< $(CFLAGS)

#Run program with dynamic libraries
run_dynamic:
	@LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./lib $(BINDIR)/main

#Run program with static libraries
run_static:
	@$(BINDIR)/main_static

#Build and clean
build: liboperation libhello $(BINDIR)/main $(BINDIR)/main_static buildClean
buildClean:
	@$(RM) $(OBJDIR)/*.o $(OBJDIR)/**/*.o $(LIBDIR)/*.a

#Main program build with dynamic libs
#LIBS = -lstdc++
LIBS = -loperation -lhello
$(BINDIR)/main: $(OBJ)
	@$(CC) -o $@ $^ $(CFLAGS) $(LIBS)

#Main program build with static libs
LIBS = -loperation -lhello
$(BINDIR)/main_static: $(OBJ)
	@$(CC) -static -o $@ $^ $(CFLAGS) $(LIBS)

#Operation lib compile
liboperation: $(OBJDIR)/operation/sum.o
	@$(CC) $(CFLAGS) -shared -o lib/$@.so $^
	@ar -rcs $(LIBDIR)/$@.a $^

#Hello lib compile
libhello: $(OBJDIR)/hello/hello.o
	@$(CC) $(CFLAGS) -shared -o lib/$@.so $^
	@ar -rcs $(LIBDIR)/$@.a $^

#Clean build files
.PHONY: clean
clean: buildClean
	@$(RM) $(BINDIR)/* $(LIBDIR)/*.so a
#If FORCE flag equal true delete build folders
ifeq ($(FORCE),true)
	@$(RM) -rf bin lib obj
endif





#all Makefile-v... files to default
default-make:
	@cp Makefile Makefile-v1
	@mv Makefile.orig Makefile
