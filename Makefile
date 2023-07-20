.SUFFIXES :
.SUFFIXES : .cpp .o

.cpp.o	:
	$(CC) -c $(CFLAGS) $<

INC     = ./
BINS    = ./

all: s2m_watchdog 

PARANOIA_FLAGS = -Weffc++ -pedantic -pedantic-errors -Wextra -Wall \
-Wcast-align -Wcast-qual  -Wchar-subscripts -Wcomment -Wconversion \
-Wdisabled-optimization \
-Werror -Wfloat-equal  -Wformat  -Wformat=2 \
-Wformat-nonliteral -Wformat-security \
-Wformat-y2k \
-Wimport  -Winit-self \
-Winvalid-pch   \
-Wunsafe-loop-optimizations  -Wlong-long -Wmissing-braces \
-Wmissing-field-initializers -Wmissing-format-attribute \
-Wmissing-include-dirs \
-Wpacked  -Wparentheses  -Wpointer-arith \
-Wredundant-decls -Wreturn-type \
-Wsequence-point  -Wshadow -Wsign-compare  -Wstack-protector \
-Wstrict-aliasing -Wstrict-aliasing=2 -Wswitch  -Wswitch-default \
-Wswitch-enum -Wtrigraphs  -Wuninitialized \
-Wunknown-pragmas  -Wunreachable-code -Wunused \
-Wunused-function  -Wunused-label  -Wunused-parameter \
-Wunused-value  -Wunused-variable  -Wvariadic-macros \
-Wvolatile-register-var  -Wwrite-strings

# -Waggregate-return
# -Wimplicit
# -Wmissing-noreturn
# -Wpadded

CC = g++
LIBS = -lpthread
CFLAGS = -O3 -Wall --std=gnu++0x -I$(INC) $(PARANOIA_FLAGS)
LDFLAGS = -static

OBJECTS = main.o
SOURCES = main.cpp


$(OBJECTS): $(SOURCES)
	$(CC) -c $(CFLAGS) $(SOURCES)


s2m_watchdog: $(OBJECTS)
	$(CC) $(LDFLAGS) -o my_man $(OBJECTS) $(LIBS)

clean:
	rm *.o *~ my_man
