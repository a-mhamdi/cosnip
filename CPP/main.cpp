#include <iostream>
#include <vector>

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

int counter = 1;
std::vector<std::string> topics = {
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
};

void run(void (*demo)()) {
    std::cout << "DEMO #" << counter++ << " - " << topics[counter - 2] << std::endl;
    demo();
    std::cin.get();
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
