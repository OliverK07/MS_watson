#0. cpputest solve by manually install ;(
#1. git clone watson-iot-cpp
#2. ./setup.sh and build watson-iot-cpp
#3. make example from dcps/Listener

# -*-Makefile-*-
#----------------------------------------------------------------------------
#       Macros
#----------------------------------------------------------------------------
OSPL          = $(OSPL_HOME)
CC            = gcc
CXX           = g++
LD            = $(CXX) $(CCFLAGS) $(PICFLAGS) $(GENFLAGS)
AR            = ar
PICFLAGS      = -fPIC
CCFLAGS        =  
CPPFLAGS      = $(PICFLAGS) $(GENFLAGS) -D_REENTRANT -D_POSIX_C_SOURCE=200112L -D_XOPEN_SOURCE=500 -Wall -Wno-unused-function -I"." -I"$(OSPL)/examples/include" -I"$(OSPL)/examples" -I"$(OSPL)/include" -I"$(OSPL)/include/sys" -I"$(OSPL)/include/dcps/C++/SACPP"
OBJEXT        = .o
OUTPUT_OPTION = -o "$@"
COMPILE.c     = $(CC) $(CFLAGS) $(CPPFLAGS) -c
COMPILE.cc    = $(CXX) $(CCFLAGS) $(CPPFLAGS) -c
LDFLAGS       = -L"." -L"$(OSPL)/lib" -Wl,-rpath,\$$ORIGIN -Wl,-rpath,\$$ORIGIN/$(OSPL)/lib
CCC           = $(CXX)
MAKEFILE      = Makefile.sacpp_listener_sub
DEPENDENCIES  = $(MAKEFILE)
BTARGETDIR    = ./
BIN           = $(BTARGETDIR)sacpp_listener_sub$(EXESUFFIX)$(EXEEXT)
CAT           = cat
MV            = mv -f
RM            = rm -rf
CP            = cp -p
NUL           = /dev/null
MKDIR         = mkdir -p
TESTDIRSTART  = test -d
TESTDIREND    = ||
TOUCH         = touch
EXEEXT        = 
LIBPREFIX     = lib
LIBSUFFIX     = 
GENFLAGS      = -O3 -DNDEBUG
LDLIBS        = -l"sacpp_listener_types$(LIBSUFFIX)" -l"dcpssacpp" -l"ddskernel" -ldl $(subst lib,-l,$(sort $(basename $(notdir $(wildcard /usr/lib/librt.so /lib/librt.so))))) -lpthread
OBJS          = .obj$(CFG)/CheckStatus$(OBJEXT) .obj$(CFG)/DDSEntityManager$(OBJEXT) .obj$(CFG)/ListenerDataSubscriber$(OBJEXT) .obj$(CFG)/ListenerDataListener$(OBJEXT)
SRC           = ../src/CheckStatus.cpp ../src/DDSEntityManager.cpp ../src/ListenerDataSubscriber.cpp ../src/ListenerDataListener.cpp
LINK.cc       = $(LD) $(LDFLAGS)
EXPORTFLAGS   = 

#----------------------------------------------------------------------------
#       Local targets
#----------------------------------------------------------------------------

all: $(BIN)

$(BIN): $(OBJS)
	@$(TESTDIRSTART) "$(BTARGETDIR)" $(TESTDIREND) $(MKDIR) "$(BTARGETDIR)"
	$(LINK.cc) $(OBJS) $(LDLIBS) $(OUTPUT_OPTION)

generated: $(GENERATED_DIRTY)
	@-:

.obj$(CFG)/CheckStatus$(OBJEXT): ../src/CheckStatus.cpp
	@$(TESTDIRSTART) ".obj$(CFG)/" $(TESTDIREND) $(MKDIR) ".obj$(CFG)/"
	$(COMPILE.cc) $(EXPORTFLAGS) $(OUTPUT_OPTION) ../src/CheckStatus.cpp

.obj$(CFG)/DDSEntityManager$(OBJEXT): ../src/DDSEntityManager.cpp
	@$(TESTDIRSTART) ".obj$(CFG)/" $(TESTDIREND) $(MKDIR) ".obj$(CFG)/"
	$(COMPILE.cc) $(EXPORTFLAGS) $(OUTPUT_OPTION) ../src/DDSEntityManager.cpp

.obj$(CFG)/ListenerDataSubscriber$(OBJEXT): ../src/ListenerDataSubscriber.cpp
	@$(TESTDIRSTART) ".obj$(CFG)/" $(TESTDIREND) $(MKDIR) ".obj$(CFG)/"
	$(COMPILE.cc) $(EXPORTFLAGS) $(OUTPUT_OPTION) ../src/ListenerDataSubscriber.cpp

.obj$(CFG)/ListenerDataListener$(OBJEXT): ../src/ListenerDataListener.cpp
	@$(TESTDIRSTART) ".obj$(CFG)/" $(TESTDIREND) $(MKDIR) ".obj$(CFG)/"
	$(COMPILE.cc) $(EXPORTFLAGS) $(OUTPUT_OPTION) ../src/ListenerDataListener.cpp

clean:
	-$(RM) $(OBJS)

realclean: clean
	-$(RM) $(BIN)
	-$(RM) .obj$(CFG)/

check-syntax:
	$(COMPILE.cc) $(EXPORTFLAGS) $(CHK_SOURCES)

