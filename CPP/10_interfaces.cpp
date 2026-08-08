#include "10_interfaces.hpp"

#include <iostream>
#include <memory> // smart pointers
#include <string>
#include <vector>

namespace interfaces {
    // Concrete classes implementing interfaces
    Circle::Circle(const double r, const std::string &c) : radius(r), color(c) {
    }

    void Circle::draw() const {
        std::cout << "Drawing Circle  [radius=" << radius
                << ", color=" << color << "]" << "\n";
    }

    void Circle::resize(const double factor) {
        radius *= factor;
        std::cout << "Circle resized  -> radius=" << radius << "\n";
    }

    void Circle::print() const {
        std::cout << "Circle: r=" << radius << " c=" << color << "\n";
    }

    double Circle::getRadius() const { return radius; }

    Rectangle::Rectangle(const double w, const double h, const std::string &c)
        : width(w), height(h), color(c) {
    }

    void Rectangle::draw() const {
        std::cout << "Drawing Rect    [" << width << "x" << height
                << ", color=" << color << "]" << "\n";
    }

    void Rectangle::resize(const double factor) {
        width *= factor;
        height *= factor;
        std::cout << "Rect resized    -> " << width << "x" << height << std::endl;
    }

    void Rectangle::print() const {
        std::cout << "Rect: " << width << "x" << height
                << " c=" << color << "\n";
    }

    double Rectangle::area() const { return width * height; }

    void demo() {
        // Interfaces & multiple inheritance
        std::cout << "=== Interfaces ===" << "\n";
        Circle circle(5.0, "red");
        Rectangle rect(4.0, 6.0, "blue");

        circle.draw();
        circle.print();
        rect.draw();
        rect.print();

        // Polymorphism through interface pointers ─────────────
        std::cout << "\n=== Interface Polymorphism ===" << "\n";
        std::vector<IDrawable *> shapes;
        shapes.push_back(&circle);
        shapes.push_back(&rect);

        for (auto *s: shapes) {
            s->draw();
            s->resize(2.0);
        }

        // unique_ptr (single owner, auto-deleted)
        std::cout << "\n=== unique_ptr ===" << "\n";
        {
            std::unique_ptr<Circle> uCircle = std::make_unique<Circle>(3.0, "green");
            uCircle->draw();
            uCircle->resize(1.5);
            // automatically deleted when it goes out of scope!
        }
        std::cout << "unique_ptr auto-deleted here" << "\n";

        // shared_ptr (multiple owners, ref-counted)
        std::cout << "\n=== shared_ptr ===" << "\n";
        {
            std::shared_ptr<Rectangle> sRect1 = std::make_shared<Rectangle>(2.0, 3.0, "yellow");
            {
                std::shared_ptr<Rectangle> sRect2 = sRect1; // both point to same object
                std::cout << "Owners: " << sRect1.use_count() << "\n"; // 2
                sRect2->draw();
            } // sRect2 gone, but object survives
            std::cout << "Owners: " << sRect1.use_count() << "\n"; // 1
            sRect1->draw();
        } // deleted automatically when sRect1 goes out of scope
    }
}
