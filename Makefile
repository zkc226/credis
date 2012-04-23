CFLAGS ?= -g -O2 -Wall
LDFLAGS ?=
#CPPFLAGS += -DPRINTDEBUG

VER_MAJOR = 0
VER_MINOR = 3
VER_PATCH = 0
VER=$(VER_MAJOR).$(VER_MINOR).$(VER_PATCH)

INSTALL ?= /usr/bin/install -c
MKDIR ?= /bin/mkdir -p
CP ?= /bin/cp -fd
LN ?= /bin/ln -fs

INSTALLDIR ?= /usr/local
LIBDIR = $(INSTALLDIR)/lib
INCLUDEDIR = $(INSTALLDIR)/include

# build shared lib under OS X or Linux
OS = $(shell uname -s)
ifeq ($(OS),Darwin)
	SHAREDLIB_LINK_OPTIONS=-dynamiclib -Wl,-install_name -Wl,
else
	SHAREDLIB_LINK_OPTIONS=-shared -Wl,-soname,
endif

# targets to build with 'make all'
TARGETS = credis-test libcredis.a libcredis.so

all: $(TARGETS)

credis-test: credis-test.o libcredis.a
	$(CC) $(CFLAGS) $(LDFLAGS) $(CPPFLAGS) -o $@ $^

libcredis.a: credis.o
	$(AR) -cvq $@ $^

libcredis.so: credis.o
	$(CC) $(SHAREDLIB_LINK_OPTIONS)$@.$(VER_MAJOR) -o $@.$(VER) $^
	$(LN) $@.$(VER) $@.$(VER_MAJOR)
	$(LN) $@.$(VER_MAJOR) $@

credis.o: credis.c credis.h Makefile
	$(CC) -c -fPIC $(CFLAGS) $(CPPFLAGS) -o $@ credis.c

install: all installdirs
	$(INSTALL) -m644 *.h $(INCLUDEDIR)
	$(INSTALL) -m755 *.so* *.a $(LIBDIR)

installdirs:
	$(MKDIR) $(LIBDIR) $(INCLUDEDIR)

clean:
	rm -f *.o *~ *.so* $(TARGETS)
