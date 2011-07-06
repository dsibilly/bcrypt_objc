# Makefile for GNU make

# Set the app name here
APP_NAME = bcrypter

# Compiler/Linker/Assembler macros
CC = clang
AS = $(CC)
LD = $(CC)
RM = rm -f

# Compiler/Linker/Assembler macros
ASFLAGS = -c
LDFLAGS = -s
CFLAGS = -W -Wall -O2 -fomit-frame-pointer -funroll-loops
OBJCFLAGS = -ObjC -framework Foundation

# Relative asset paths
BCRYPT = bcrypt
CRYPT = $(BCRYPT)/crypt_blowfish
DDCLI = DDCli

# Objects
BLOWFISH_OBJS = crypt_blowfish.o x86.o
CRYPT_OBJS = $(BLOWFISH_OBJS) crypt_gensalt.o wrapper.o
BCRYPT_OBJS = $(CRYPT_OBJS) bcrypt.o
DDCLI_OBJS = DDCliApplication.o DDCliParseException.o DDCliUtil.o DDGetoptLongParser.o
COCOA_OBJS = MABcrypt.o BCryptApp.o main.o
OBJECTS = $(BCRYPT_OBJS) $(DDCLI_OBJS) $(COCOA_OBJS)

# Make rules
all: build clean_objects

build: $(OBJECTS)
	@echo "Building $(APP_NAME)"
	$(CC) -o $(APP_NAME) $(OBJECTS) $(OBJCFLAGS)

bcrypt.o: $(BCRYPT)/bcrypt.c
	$(CC) -c $(CFLAGS) $(BCRYPT)/$*.c

crypt_blowfish.o: $(CRYPT)/crypt_blowfish.c
	$(CC) -c $(CFLAGS) $(CRYPT)/$*.c
	
x86.o: $(CRYPT)/x86.S
	$(AS) $(ASFLAGS) $(CRYPT)/$*.S
	
crypt_gensalt.o: $(CRYPT)/crypt_gensalt.c
	$(CC) -c $(CFLAGS) $(CRYPT)/$*.c

wrapper.o: $(CRYPT)/wrapper.c
	$(CC) -c $(CFLAGS) $(CRYPT)/$*.c

DDCliApplication.o: $(DDCLI)/DDCliApplication.m
	$(CC) -c $(DDCLI)/$*.m

DDCliParseException.o: $(DDCLI)/DDCliParseException.m
	$(CC) -c $(DDCLI)/$*.m
	
DDCliUtil.o: $(DDCLI)/DDCliUtil.m
	$(CC) -c $(DDCLI)/$*.m

DDGetoptLongParser.o: $(DDCLI)/DDGetoptLongParser.m
	$(CC) -c $(DDCLI)/$*.m

.m.o:
	$(CC) -c $*.m

.c.o:
	$(CC) -c $(CFLAGS) $*.c

.S.o:
	$(AS) $(ASFLAGS) $*.S
	
clean_objects:
	@echo "Cleaning up intermediate object files."
	$(RM) $(OBJECTS)
	
clean: clean_objects
	@echo "Removing $(APP_NAME)"
	$(RM) $(APP_NAME)