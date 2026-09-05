#include "05_functions.hpp"

#include <iostream>

namespace functions {
    // Basic function (no return, no params)
    void greet() {
        std::cout << "Hello from a function!" << "\n";
    }

    // Function with parameters
    void greetUser(std::string name) {
        std::cout << "Hello, " << name << "!" << "\n";
    }

    // Function with return value
    int add(int a, int b) {
        return a + b;
    }

    double multiply(double a, double b) {
        return a * b;
    }

    // Default parameters
    void printBox(int width, int height, char symbol = '*') {
        for (int i = 0; i < height; i++) {
            for (int j = 0; j < width; j++) {
                std::cout << symbol;
            }
            std::cout << "\n";
        }
    }

    // Function overloading (same name, different params)
    std::string add(std::string a, std::string b) {
        return a + b;
    }

    // Pass by value vs pass by reference
    void doubleByValue(int x) {
        x *= 2; // original is NOT modified
    }

    void doubleByRef(int &x) {
        x *= 2; // original IS modified
    }

    // Recursive function
    int factorial(int n) {
        if (n <= 1) return 1; // base case
        return n * factorial(n - 1); // recursive call
    }

    // main
    void demo() {
        // Basic call
        greet();

        // With parameter
        greetUser("Sami");

        // Return values
        std::cout << "3 + 4 = " << add(3, 4) << "\n";
        std::cout << "2.5 * 3.0 = " << multiply(2.5, 3.0) << "\n";

        // Default parameter
        std::cout << "\nDefault symbol:" << "\n";
        printBox(5, 3);
        std::cout << "\nCustom symbol:" << "\n";
        printBox(5, 3, '#');

        // Overloading
        std::cout << "\n1 + 2 = " << add(1, 2) << "\n";
        std::cout << "\"1\" + \"2\" = " << add("1", "2") << "\n";

        // Pass by value vs reference
        int val = 10;
        doubleByValue(val);
        std::cout << "\nAfter doubleByValue: " << val << "\n"; // still 10

        doubleByRef(val);
        std::cout << "After doubleByRef  : " << val << "\n"; // now 20

        // Recursion
        std::cout << "\n5! = " << factorial(5) << "\n";
    }
}
