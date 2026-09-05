#include "07_pointers.hpp"

#include <iostream>

namespace pointers {
    void demo() {
        // What is a pointer?
        std::cout << "=== Basics ===" << "\n";
        int age = 25;
        int *ptr = &age; // ptr holds the ADDRESS of age

        std::cout << "Value of age       : " << age << "\n";
        std::cout << "Address of age (&) : " << &age << "\n";
        std::cout << "Pointer holds      : " << ptr << "\n";
        std::cout << "Dereferenced (*ptr): " << *ptr << "\n";

        // Modify original through pointer
        *ptr = 30;
        std::cout << "age after *ptr=30  : " << age << "\n";

        // Pointer arithmetic
        std::cout << "\n=== Pointer Arithmetic ===" << "\n";
        int numbers[] = {10, 20, 30, 40, 50};
        int *p = numbers; // points to first element

        for (int i = 0; i < 5; i++) {
            std::cout << "*(p+" << i << ") = " << *(p + i) << "\n";
        }

        // Null pointer (always initialize!)
        std::cout << "\n=== Null Pointer ===" << "\n";
        int *safe = nullptr; // modern C++ null pointer

        if (safe == nullptr) {
            std::cout << "Pointer is null, safe to check!" << "\n";
        }

        // Pointer vs Reference
        std::cout << "\n=== Pointer vs Reference ===" << "\n";
        int x = 100;

        int *myPtr = &x; // pointer: can be reassigned, can be null
        int &myRef = x; // reference: always bound to x, never null

        *myPtr = 200;
        std::cout << "After *myPtr = 200, x = " << x << "\n";

        myRef = 300;
        std::cout << "After myRef  = 300, x = " << x << "\n";

        // Dynamic memory (heap)
        std::cout << "\n=== Dynamic Memory ===" << "\n";

        int *heapVal = new int(42); // allocate single int on heap
        std::cout << "Heap value: " << *heapVal << "\n";
        delete heapVal; // MUST free memory!
        heapVal = nullptr; // good habit after delete

        int *heapArr = new int[3]{1, 2, 3}; // allocate array on heap
        for (int i = 0; i < 3; i++) {
            std::cout << "heapArr[" << i << "] = " << heapArr[i] << " ";
            std::cout << "heapArr[" << i << "] = " << *(heapArr + i) << "\n";
        }
        delete[] heapArr; // MUST use delete[] for arrays!
        heapArr = nullptr;

        // Pointer to pointer
        std::cout << "\n=== Pointer to Pointer ===" << "\n";
        int val = 99;
        int *ptr1 = &val;
        int **ptr2 = &ptr1; // pointer to a pointer

        std::cout << "val    = " << val << "\n";
        std::cout << "*ptr1  = " << *ptr1 << "\n";
        std::cout << "**ptr2 = " << **ptr2 << "\n";
    }
}
