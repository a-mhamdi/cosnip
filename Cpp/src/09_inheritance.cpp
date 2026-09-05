#include "09_inheritance.hpp"

#include <iostream>
#include <string>

namespace inheritance {
    Animal::Animal(const std::string &n, int a) : name(n), age(a) {
        std::cout << ">> Animal '" << name << "' created!" << "\n";
    }

    Animal::~Animal() {
        // ALWAYS make destructor virtual!
        std::cout << ">> Animal '" << name << "' destroyed!" << "\n";
    }

    void Animal::breathe() const {
        std::cout << name << " is breathing" << "\n";
    }

    void Animal::speak() const {
        std::cout << name << " says ... (generic animal sound)" << "\n";
    }

    void Animal::describe() const {
        std::cout << "Name: " << name << " | Age: " << age << "\n";
    }

    Dog::Dog(const std::string &n, int a, const std::string &b)
        : Animal(n, a), breed(b) {
        // call parent constructor first
        std::cout << ">> Dog '" << name << "' created!" << "\n";
    }

    Dog::~Dog() {
        std::cout << ">> Dog '" << name << "' destroyed!" << "\n";
    }

    void Dog::speak() const {
        // override keyword = safety net
        std::cout << name << " says: Woof! Woof!" << "\n";
    }

    void Dog::move() const {
        std::cout << name << " runs on four legs" << "\n";
    }

    void Dog::fetch() const {
        // Dog-specific method
        std::cout << name << " fetches the ball!" << "\n";
    }

    Bird::Bird(const std::string &n, int a, double ws)
        : Animal(n, a), wingspan(ws) {
        std::cout << ">> Bird '" << name << "' created!" << "\n";
    }

    Bird::~Bird() {
        std::cout << ">> Bird '" << name << "' destroyed!" << "\n";
    }

    void Bird::speak() const {
        std::cout << name << " says: Tweet! Tweet!" << "\n";
    }

    void Bird::move() const {
        std::cout << name << " flies with wingspan " << wingspan << "m" << "\n";
    }

    GuideDog::GuideDog(const std::string &n, int a)
        : Dog(n, a, "Labrador") {
    }

    void GuideDog::guide() const {
        std::cout << name << " is guiding its owner safely" << "\n";
    }

    void demo() {
        // Basic inheritance
        std::cout << "=== Creating Objects ===" << "\n";
        Dog dog("Rex", 3, "German Shepherd");
        Bird bird("Tweety", 1, 0.3);

        // Inherited + overridden methods
        std::cout << "\n=== Methods ===" << "\n";
        dog.breathe(); // inherited from Animal
        dog.speak(); // overridden in Dog
        dog.move(); // overridden in Dog
        dog.fetch(); // Dog-specific
        dog.describe(); // inherited from Animal

        std::cout << "\n";
        bird.breathe(); // inherited
        bird.speak(); // overridden in Bird
        bird.move(); // overridden in Bird

        // Polymorphism
        std::cout << "\n=== Polymorphism ===" << "\n";
        Animal *animals[2]; // array of base class pointers
        animals[0] = &dog;
        animals[1] = &bird;

        for (int i = 0; i < 2; i++) {
            animals[i]->speak(); // calls the RIGHT speak() at runtime
            animals[i]->move();
        }

        // Multi-level inheritance
        std::cout << "\n=== GuideDog ===" << "\n";
        GuideDog guide("Buddy", 4);
        guide.speak(); // from Dog
        guide.fetch(); // from Dog
        guide.guide(); // GuideDog-specific
        guide.breathe(); // from Animal

        // Type checking
        std::cout << "\n=== Type Checking ===" << "\n";
        Animal *ptr = &dog;
        if (auto *dogPtr = dynamic_cast<Dog *>(ptr)) {
            std::cout << "Successfully cast to Dog!" << "\n";
            dogPtr->fetch();
        }

        std::cout << "\n=== Destructors ===" << "\n";
    }
}
