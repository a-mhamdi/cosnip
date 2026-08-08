#include "08_oop_classes.hpp"

#include <iostream>
#include <string>

namespace oop_classes {
    Student::Student(std::string n, int a, double g) : name(std::move(n)), age(a), gpa(g) {
        std::cout << ">> Student '" << name << "' created!" << "\n";
    }

    Student::~Student() {
        std::cout << ">> Student '" << name << "' destroyed!" << "\n";
    }

    std::string Student::getName() const { return name; }
    int Student::getAge() const { return age; }
    double Student::getGPA() const { return gpa; }

    void Student::setGPA(double g) {
        if (g >= 0.0 && g <= 4.0)
            gpa = g;
        else
            std::cout << "\033[0;31mInvalid GPA!\033[0m" << "\n";
    }

    void Student::introduce() const {
        std::cout << "Hi! I'm " << name
                << ", age " << age
                << ", GPA " << gpa << "\n";
    }

    void Student::study(const std::string &subject) const {
        std::cout << name << " is studying " << subject << "\n";
    }

    Classroom::Classroom(std::string r) : room(std::move(r)), students(nullptr), count(0) {
    }

    Classroom::~Classroom() {
        std::cout << ">>>> Classroom '" << room << "' destroyed" << "\n";
    }

    void Classroom::enroll(Student *s) {
        if (count < 3) {
            students[count++] = s;
            std::cout << s->getName() << " enrolled in " << room << "\n";
        }
    }

    void Classroom::listStudents() const {
        std::cout << "\n-- Classroom: " << room << " --" << "\n";
        for (int i = 0; i < count; i++) {
            students[i]->introduce();
        }
    }

    Logger::Logger(const std::string &t) : tag(t) {
        instanceCount++;
        std::cout << ">> Logger [" << tag << "] created. "
                << "Total: " << instanceCount << "\n";
    }

    Logger::~Logger() {
        instanceCount--;
        std::cout << ">> Logger [" << tag << "] destroyed. "
                << "Total: " << instanceCount << "\n";
    }

    void Logger::log(const std::string &msg) const {
        std::cout << "[" << tag << "] " << msg << "\n";
    }

    int Logger::getCount() { return instanceCount; } // static method

    int Logger::instanceCount = 0; // static member init outside class

    void demo() {
        {
            // Creating objects (on the stack)
            std::cout << "=== Creating Students ===" << "\n";
            Student s1("Alice", 20, 3.8);
            Student s2("Bob", 22, 3.2);
            Student s3("Carol", 21, 3.5);

            // Calling methods
            std::cout << "\n=== Introducing ===" << "\n";
            s1.introduce();
            s2.introduce();

            // Getters & Setters
            std::cout << "\n=== Getters & Setters ===" << "\n";
            std::cout << "Alice's GPA: " << s1.getGPA() << "\n";
            s1.setGPA(3.9);
            std::cout << "Updated GPA: " << s1.getGPA() << "\n";
            s1.setGPA(9.9); // invalid — triggers warning

            // Object on the heap
            std::cout << "\n=== Heap Object ===" << "\n";
            const auto *heapStudent = new Student("Dave", 23, 2.9);
            heapStudent->introduce(); // arrow operator -> for pointers
            heapStudent->study("Physics");
            delete heapStudent;

            // Composition
            std::cout << "\n=== Classroom ===" << "\n";
            Classroom room("A101");
            room.enroll(&s1);
            room.enroll(&s2);
            room.enroll(&s3);
            room.listStudents();

            // Destructors called automatically here
            std::cout << "\n=== End of scope ===" << "\n";
        }
        // Static members
        std::cout << "\n=== Static Members ===" << "\n";
        std::cout << "Loggers alive: " << Logger::getCount() << "\n";
        {
            const Logger l1("AUTH");
            const Logger l2("DB");
            Logger l3("HTTP");
            std::cout << "Loggers alive: " << Logger::getCount() << "\n";
            l1.log("User logged in");
            l2.log("Query executed");
        }
        std::cout << "Loggers alive: " << Logger::getCount() << "\n";
    }
}
