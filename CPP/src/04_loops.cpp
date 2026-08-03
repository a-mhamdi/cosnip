#include <iostream>

namespace loops {
    void demo() {
        // for loop (known number of iterations)
        std::cout << "=== for loop ===" << "\n";
        for (int i = 0; i < 5; i++) {
            std::cout << "i = " << i << "\n";
        }

        // while loop (condition checked BEFORE each iteration)
        std::cout << "\n=== while loop ===" << "\n";
        int count = 0;
        while (count < 5) {
            std::cout << "count = " << count << "\n";
            count++;
        }

        // do-while (condition checked AFTER each iteration)
        std::cout << "\n=== do-while loop ===" << "\n";
        int n = 0;
        do {
            std::cout << "n = " << n << "\n";
            n++;
        } while (n < 5);

        // break & continue
        std::cout << "\n=== break & continue ===" << "\n";
        for (int i = 0; i < 10; i++) {
            if (i == 3) continue; // skip 3
            if (i == 7) break; // stop at 7
            std::cout << "i = " << i << "\n";
        }

        // Nested loops (multiplication table)
        std::cout << "\n=== multiplication table (9x9) ===" << "\n";
        for (int row = 1; row <= 9; row++) {
            for (int col = 1; col <= 9; col++) {
                std::cout << row * col << "\t";
            }
            std::cout << "\n";
        }

        // Range-based for loop (modern C++11)
        std::cout << "\n=== range-based for loop ===" << "\n";
        int numbers[] = {10, 20, 30, 40, 50};
        for (int num: numbers) {
            std::cout << num << " ";
        }
        std::cout << "\n";
    }
}
