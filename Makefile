SRC   = src/cfunctions.f90 src/util.f90 \
		src/timer.f90 src/stopwatch.f90 src/main.f90
OBJ   = $(addsuffix .o,$(subst src/,bin/,$(basename $(SRC))))
OUT   = ./bin/ytime

FC      = gfortran
F_VER   = f2003
F_FLAGS = -Wall -Wextra -Werror -pedantic -std=$(F_VER) -g -fno-range-check \
		-fall-intrinsics

compile: ./bin $(OBJ) $(SRC)
	$(FC) $(F_FLAGS) -o $(OUT) $(OBJ)

bin/%.o: src/%.f90
	$(FC) $(F_LIBS) -c $< $(F_FLAGS) -o $@

./bin:
	mkdir -p bin

clean:
	rm -r $(OUT) $(OBJ) *.mod

all:
	@echo compile, clean
