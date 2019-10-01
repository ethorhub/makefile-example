#Directory names
BINDIR = bin#for binary
INCLUDEDIR = src#for header files
LIBDIR = lib#for library
OBJDIR = obj#for objects
SRCDIR = src#for source code

#CC = gcc
#C++ compiler info
CXX = g++
CXXFLAGS = -Wall -I$(INCLUDEDIR) -L$(LIBDIR) -fPIC

#Header files
_DEPS = *.hpp
DEPS = $(patsubst %,$(INCLUDEDIR)/%,$(_DEPS))

#Object files
_OBJ := main.o #main file
_OBJ += hello.o sum.o
OBJ = $(patsubst %,$(OBJDIR)/%,$(_OBJ))

#Create object files from source
$(OBJDIR)/%.o: $(SRCDIR)/%.cpp $(DEPS)
	@$(CXX) -c -o $@ $< $(CXXFLAGS)

#Run program with dynamic libraries
run:
	@LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./lib $(BINDIR)/main

#Build and clean
build: liboperation libhello $(BINDIR)/main buildClean
buildClean:
	@$(RM) $(OBJDIR)/*.o $(OBJDIR)/**/*.o $(LIBDIR)/*.a

#Main program build with dynamic libs
#LIBS = -lstdc++
LIBS = -lhello -loperation
$(BINDIR)/main: $(OBJ)
	@$(CXX) -o $@ $^ $(CXXFLAGS) $(LIBS)

#Operation lib compile
liboperation: $(OBJDIR)/operation/sum.o #Static library
	@ar -rcs $(LIBDIR)/$@.a $^

#Hello lib compile
libhello: $(OBJDIR)/hello/hello.o #Dynamic library
	@$(CXX) $(CXXFLAGS) -shared -o lib/$@.so $^

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
	@cp Makefile Makefile-v2
	@mv Makefile.orig Makefile
