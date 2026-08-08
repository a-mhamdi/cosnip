#include "02_variables.hpp"

#include <iomanip>
#include <iostream>

namespace variables {
    void demo() {
        // Integer types
        int age = 25; // 32 bits
        short small_num = 100; // 16 bits
        long big_num = 1000000L; // 32 or 64 bits depending on the system

        // Floating point types
        float price = 3.14f; // 32 bits
        double precise = 3.141592653589793; // 64 bits

        // Character and boolean
        char letter = 'A'; // 8 bits
        bool is_cpp_fun = true; // 1 byte (true or false)

        // String (needs <string>)
        std::string name = "Tuto";

        // Constants (cannot be changed)
        const double PI = 3.14159;

        // Auto (compiler deduces the type)
        auto score = 17; // deduced as int
        auto gpa = 3.9; // deduced as double

        // Display everything
        std::cout << "Name    : " << std::setw(15) << std::left << name << "--> Mem. Usage: " << sizeof name <<
                " Bytes\n";
        std::cout << "Age     : " << std::setw(15) << std::left << age << "--> Mem. Usage: " << sizeof age <<
                " Bytes\n";
        std::cout << "Price   : " << std::setw(15) << std::left << price << "--> Mem. Usage: " << sizeof price <<
                " Bytes\n";
        std::cout << "Precise : " << std::setw(15) << std::left << precise << "--> Mem. Usage: " << sizeof precise <<
                " Bytes\n";
        std::cout << "Letter  : " << std::setw(15) << std::left << letter << "--> Mem. Usage: " << sizeof letter <<
                " Bytes\n";
        std::cout << "Fun?    : " << std::setw(15) << std::left << is_cpp_fun << "--> Mem. Usage: " << sizeof is_cpp_fun
                << " Bytes\n";
        std::cout << "PI      : " << std::setw(15) << std::left << PI << "--> Mem. Usage: " << sizeof PI << " Bytes\n";
        std::cout << "Score   : " << std::setw(15) << std::left << score << "--> Mem. Usage: " << sizeof score <<
                " Bytes\n";
    }
}
