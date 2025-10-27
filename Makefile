CXX = clang++
CXXFLAGS = -std=c++17 -S -emit-llvm
SRC = test.cpp
BIN_DIR = bin

all: $(BIN_DIR) $(BIN_DIR)/test.O0.ll $(BIN_DIR)/test.O1.ll $(BIN_DIR)/test.O2.ll $(BIN_DIR)/test.O3.ll

$(BIN_DIR):
	mkdir -p $(BIN_DIR)

run: $(BIN_DIR)/test_run
	./$(BIN_DIR)/test_run

$(BIN_DIR)/test_run: $(BIN_DIR)/test_run.o
	$(CXX) $< -o $@

$(BIN_DIR)/test_run.o: $(SRC) | $(BIN_DIR)
	$(CXX) -c $< -o $@

$(BIN_DIR)/test.O0.ll: $(SRC) | $(BIN_DIR)
	$(CXX) $(CXXFLAGS) -O0 $< -o $@

$(BIN_DIR)/test.O1.ll: $(SRC) | $(BIN_DIR)
	$(CXX) $(CXXFLAGS) -O1 $< -o $@

$(BIN_DIR)/test.O2.ll: $(SRC) | $(BIN_DIR)
	$(CXX) $(CXXFLAGS) -O2 $< -o $@

$(BIN_DIR)/test.O3.ll: $(SRC) | $(BIN_DIR)
	$(CXX) $(CXXFLAGS) -O3 $< -o $@

clean:
	rm -rf $(BIN_DIR)
