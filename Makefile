CXX = clang++
CXXFLAGS = -std=c++17 -S -emit-llvm
SRC = test.cpp

all: test.O0.ll test.O1.ll test.O2.ll test.O3.ll

run: test_run
	./test_run

test_run: test_run.o
	$(CXX) $< -o $@

test_run.o: $(SRC)
	$(CXX) -c $< -o $@

test.O0.ll: $(SRC)
	$(CXX) $(CXXFLAGS) -O0 $< -o $@

test.O1.ll: $(SRC)
	$(CXX) $(CXXFLAGS) -O1 $< -o $@

test.O2.ll: $(SRC)
	$(CXX) $(CXXFLAGS) -O2 $< -o $@

test.O3.ll: $(SRC)
	$(CXX) $(CXXFLAGS) -O3 $< -o $@

clean:
	rm -f *.ll