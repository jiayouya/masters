#include "periodicity.hpp"
#include "test_common.hpp"

int main(int argc, char** argv) {
  return hbm::benchmark_pyasukp(&hbm::y_star_wrapper);
}

