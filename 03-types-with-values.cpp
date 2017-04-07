#include <iostream>

template <size_t n, typename T> struct Array {
  Array() {
    for (size_t i = 0; i < n; i++) {
      storage[i] = T();
    }
  }

  T storage[n];

  template <size_t i> T &get() {
    static_assert(i >= 0 && i < n, "invalid index, YOU FOOL!");
    return storage[i];
  }
};

constexpr size_t addFive(size_t x) { return x + 5; }

int main() {
  Array<10, int> arr;
  std::cout << arr.get<addFive(3)>() << std::endl;
  // arr.get<addFive(5)>();
  return 0;
}

