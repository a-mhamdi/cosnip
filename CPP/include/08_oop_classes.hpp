#ifndef CPP_DEMOS_08_OOP_CLASSES_HPP
#define CPP_DEMOS_08_OOP_CLASSES_HPP

#include <string>

namespace oop_classes {
    class Student {
    private: // only accessible inside the class
        std::string name;
        int age;
        double gpa;

    public: // accessible from anywhere
        Student(std::string, int, double); // Constructor
        ~Student(); // Destructor

        // Getters (accessors)
        [[nodiscard]] std::string getName() const;

        [[nodiscard]] int getAge() const;

        [[nodiscard]] double getGPA() const;

        // Setters (mutators)
        void setGPA(double);

        // Methods
        void introduce() const;

        void study(const std::string &) const;
    };

    class Classroom {
    private:
        std::string room;
        Student *students[3]; // array of pointers to Students
        int count;

    public:
        explicit Classroom(std::string);

        ~Classroom();

        void enroll(Student *);

        void listStudents() const;
    };

    class Logger {
    private:
        static int instanceCount;
        std::string tag;

    public:
        explicit Logger(const std::string &);

        ~Logger();

        void log(const std::string &) const;

        static int getCount();
    };

    void demo();
}

#endif
