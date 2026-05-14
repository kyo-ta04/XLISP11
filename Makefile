CC = gcc
CFLAGS = -Wall -Wextra -std=gnu89 -I include
SRCDIR = src
OBJDIR = build
BINDIR = build

# MinGW 対応
MAKE = mingw32-make

SOURCES = $(wildcard $(SRCDIR)/*.C) $(wildcard $(SRCDIR)/*.c)
OBJECTS = $(patsubst $(SRCDIR)/%.C, $(OBJDIR)/%.o, $(patsubst $(SRCDIR)/%.c, $(OBJDIR)/%.o, $(SOURCES)))
TARGET = $(BINDIR)/program

.PHONY: all clean run

all: $(TARGET)

$(TARGET): $(OBJECTS)
	$(CC) $(CFLAGS) -o $@ $^

$(OBJDIR)/%.o: $(SRCDIR)/%.c
	$(CC) -x c $(CFLAGS) -c $< -o $@

$(OBJDIR)/%.o: $(SRCDIR)/%.C
	$(CC) -x c $(CFLAGS) -c $< -o $@

clean:
	-del /Q $(OBJDIR)\*.o
	-del /Q $(BINDIR)\program.exe

run: $(TARGET)
	$(BINDIR)\program.exe
