#include <array>
#include <iostream>
#include <string_view>

#include "01_hello_world.hpp"
#include "02_variables.hpp"
#include "03_conditionals.hpp"
#include "04_loops.hpp"
#include "05_functions.hpp"
#include "06_arrays_vectors.hpp"
#include "07_pointers.hpp"
#include "08_oop_classes.hpp"
#include "09_inheritance.hpp"
#include "10_interfaces.hpp"

constexpr std::array<std::string_view, 10> topics = {
    {
        "HELLO WORLD",
        "VARIABLES",
        "CONDITIONALS",
        "LOOPS",
        "FUNCTIONS",
        "ARRAYS & VECTORS",
        "POINTERS",
        "OOP CLASSES",
        "INHERITANCE",
        "INTERFACES"
    }
};

void run(void (*demo)()) {
    static std::size_t counter = 1;
    std::cout << "DEMO #" << counter << " - " << topics[counter - 1] << "\n";
    counter++;
    demo();
    std::cin.ignore();
    std::cout << "\033[2J\033[1;1H";
}

int main() {
    run(hello_world::demo);
    run(variables::demo);
    run(conditionals::demo);
    run(loops::demo);
    run(functions::demo);
    run(arrays_vectors::demo);
    run(pointers::demo);
    run(oop_classes::demo);
    run(inheritance::demo);
    run(interfaces::demo);

    return 0;
}
