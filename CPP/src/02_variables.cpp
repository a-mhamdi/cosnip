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
        std::cout << "Name    : " << name << "\e[4C --> Mem. Usage: " << sizeof name << "\n";
        std::cout << "Age     : " << age << "\e[6C --> Mem. Usage: " << sizeof age << "\n";
        std::cout << "Price   : " << price << "\e[4C --> Mem. Usage: " << sizeof price << "\n";
        std::cout << "Precise : " << precise << "\e[1C --> Mem. Usage: " << sizeof precise << "\n";
        std::cout << "Letter  : " << letter << "\e[7C --> Mem. Usage: " << sizeof letter << "\n";
        std::cout << "Fun?    : " << is_cpp_fun << "\e[7C --> Mem. Usage: " << sizeof is_cpp_fun << "\n";
        std::cout << "PI      : " << PI << "\e[1C --> Mem. Usage: " << sizeof PI << "\n";
        std::cout << "Score   : " << score << "\e[6C --> Mem. Usage: " << sizeof score << "\n";
    }
}
