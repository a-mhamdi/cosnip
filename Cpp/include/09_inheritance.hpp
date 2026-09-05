#ifndef CPP_DEMOS_09_INHERITANCE_HPP
#define CPP_DEMOS_09_INHERITANCE_HPP

#include <string>

namespace inheritance {
    // Base class (Parent)
    class Animal {
    protected: // accessible by child classes
        std::string name;
        int age;

    public:
        Animal(const std::string &, int);

        virtual ~Animal();

        // Regular method (inherited as-is)
        void breathe() const;

        // Virtual method (can be overridden by children)
        virtual void speak() const;

        // Pure virtual method (MUST be overridden)
        virtual void move() const = 0;

        void describe() const;
    };

    // Derived class (Child)
    class Dog : public Animal {
    private:
        std::string breed;

    public:
        Dog(const std::string &, int, const std::string &);

        ~Dog() override;

        void speak() const override;

        void move() const override;

        void fetch() const;
    };

    // Another Derived class
    class Bird : public Animal {
    private:
        double wingspan;

    public:
        Bird(const std::string &, int, double);

        ~Bird() override;

        void speak() const override;

        void move() const override;
    };

    // Multi-level inheritance
    class GuideDog : public Dog {
    public:
        GuideDog(const std::string &, int);

        void guide() const;
    };

    void demo();
}

#endif
