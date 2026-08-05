#include "06_arrays_vectors.hpp"

#include <algorithm>  // sort, reverse, find
#include <iostream>
#include <vector>

namespace arrays_vectors {
    void demo() {
        // Classic array (fixed size)
        std::cout << "=== Classic Array ===" << "\n";
        int grades[5] = {85, 92, 78, 95, 60};

        for (int i = 0; i < 5; i++) {
            std::cout << "grades[" << i << "] = " << grades[i] << "\n";
        }

        // 2D array (grid / matrix)
        std::cout << "\n=== 2D Array (matrix) ===" << "\n";
        int matrix[2][3] = {
            {1, 2, 3},
            {4, 5, 6}
        };

        for (int row = 0; row < 2; row++) {
            for (int col = 0; col < 3; col++) {
                std::cout << matrix[row][col] << "\t";
            }
            std::cout << "\n";
        }

        // std::vector (dynamic size, preferred in modern C++)
        std::cout << "\n=== Vector ===" << "\n";
        std::vector<int> scores = {10, 40, 20, 50, 30};

        // Add elements
        scores.push_back(60); // add to end
        scores.push_back(5); // add to end

        std::cout << "Size      : " << scores.size() << "\n";
        std::cout << "First     : " << scores.front() << "\n";
        std::cout << "Last      : " << scores.back() << "\n";
        std::cout << "At index 2: " << scores.at(2) << "\n";

        // Remove last element
        scores.pop_back();

        // Iterating a vector
        std::cout << "\n=== Iterating ===" << "\n";

        // Classic for
        for (int i = 0; i < scores.size(); i++) {
            std::cout << scores[i] << " ";
        }
        std::cout << "\n";

        // Range-based for (preferred)
        for (int s: scores) {
            std::cout << s << " ";
        }
        std::cout << "\n";

        // Useful algorithms
        std::cout << "\n=== Algorithms ===" << "\n";

        std::sort(scores.begin(), scores.end());
        std::cout << "Sorted   : ";
        for (int s: scores) std::cout << s << " ";
        std::cout << "\n";

        std::reverse(scores.begin(), scores.end());
        std::cout << "Reversed : ";
        for (int s: scores) std::cout << s << " ";
        std::cout << "\n";

        // Search
        auto it = std::find(scores.begin(), scores.end(), 20);
        if (it != scores.end()) {
            std::cout << "Found 20 at index: " << (it - scores.begin()) << "\n";
        } else {
            std::cout << "20 not found" << "\n";
        }

        // Vector of strings
        std::cout << "\n=== Vector of strings ===" << "\n";
        std::vector<std::string> names = {"Alice", "Bob", "Charlie"};
        names.push_back("Diana");

        for (const std::string &name: names) {
            std::cout << "- " << name << "\n";
        }
    }
}
