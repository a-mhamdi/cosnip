#include "03_conditionals.hpp"

#include <iostream>
#include <string>

namespace conditionals {
    void demo() {
        // Basic if / else if / else
        int score = 75;

        if (score >= 90) {
            std::cout << "Grade: A" << "\n";
        } else if (score >= 75) {
            std::cout << "Grade: B" << "\n";
        } else if (score >= 60) {
            std::cout << "Grade: C" << "\n";
        } else {
            std::cout << "Grade: F" << "\n";
        }

        // Comparison & logical operators
        int age = 20;
        bool has_id = true;

        if (age >= 18 && has_id) {
            std::cout << "Access granted" << "\n";
        }

        if (age < 13 || age > 65) {
            std::cout << "Special discount applies" << "\n";
        }

        if (!has_id) {
            std::cout << "No ID, no entry" << "\n";
        }

        // Ternary operator (compact if/else)
        std::string status = (age >= 18) ? "Adult" : "Minor";
        std::cout << "Status: " << status << "\n";

        // Switch statement
        int day = 3;

        switch (day) {
            case 1:
                std::cout << "Monday" << "\n";
                break;
            case 2:
                std::cout << "Tuesday" << "\n";
                break;
            case 3:
                std::cout << "Wednesday" << "\n";
                break;
            case 4:
                std::cout << "Thursday" << "\n";
                break;
            case 5:
                std::cout << "Friday" << "\n";
                break;
            default:
                std::cout << "Weekend!" << "\n";
                break;
        }
    }
}
