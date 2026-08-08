#ifndef CPP_DEMOS_10_INTERFACES_HPP
#define CPP_DEMOS_10_INTERFACES_HPP

#include <string>

namespace interfaces {
    // Abstract class
    class IDrawable {
    public:
        virtual void draw() const = 0;

        virtual void resize(double) = 0;

        virtual ~IDrawable() = default;
    };

    // Another abstract class
    class IPrintable {
    public:
        virtual void print() const = 0;

        virtual ~IPrintable() = default;
    };

    class Circle : public IDrawable, public IPrintable {
    private:
        double radius;
        std::string color;

    public:
        Circle(double, const std::string &);

        void draw() const override;

        void resize(const double) override;

        void print() const override;

        double getRadius() const;
    };

    class Rectangle : public IDrawable, public IPrintable {
    private:
        double width, height;
        std::string color;

    public:
        Rectangle(const double, const double, const std::string &);

        void draw() const override;

        void resize(const double) override;

        void print() const override;

        double area() const;
    };

    void demo();
}

#endif
