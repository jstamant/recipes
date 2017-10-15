# ==================================================
# Configuration
# ==================================================

# LaTeX compiler options and flags
TXX = pdflatex
TXXFLAGS =

# Path to source files
SRC_DIR = src
# Path to build files
OBJ_DIR = obj
# Path to exported files
OUT_DIR = export

# ==================================================
# Project structure and files
# ==================================================

# List all .cpp files, and derive their equivalent .o and .d files
#SOURCES = $(shell find $(SRC_DIR) -type f -name *.cpp)
#OBJECTS = $(patsubst $(SRC_DIR)/%, $(OBJ_DIR)/%, $(SOURCES:.cpp=.o))
#DEPS    = $(patsubst $(SRC_DIR)/%, $(OBJ_DIR)/%, $(SOURCES:.cpp=.d))

# Set default search directories
#vpath %.cpp $(SRC_DIR)
#vpath %.h   $(INCLUDE_DIR)
#vpath %.o   $(OBJ_DIR)
vpath %.tex %(SRC_DIR)

# ==================================================
# Rules
# ==================================================

# Compile the project
.PHONY: all
all: %.tex
%.tex:
	$(TXX) $(TXXFLAGS) src/test.tex
	mv *.log $(OBJ_DIR)
	mv *.aux $(OBJ_DIR)
	mv *.pdf $(OUT_DIR)

# ==================================================
# Cleaning routines
# ==================================================

# Clean build files only
#.PHONY: clean
#clean:
#	-rm $(OBJECTS) $(DEPS)

