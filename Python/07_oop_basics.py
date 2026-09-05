# Classes, Encapsulation, Inheritance, and Polymorphism

# 1. Base Class (Encapsulation)
class Student:
    """Represents a general student."""
    def __init__(self, name: str, student_id: int):
        self.name = name                       # Public attribute (available for all)
        self._student_id = student_id          # Protected attribute (available only for the class and its subclasses)
        self.__grades = []                     # Private attribute (available only for the class)

    def add_grade(self, grade: float):
        """Public method to safely modify private state."""
        if 0 <= grade <= 20:
            self.__grades.append(grade)
        else:
            raise ValueError("Grade must be between 0 and 20")

    def get_score(self) -> float:
        """Calculates score based on current grades."""
        return sum(self.__grades) / len(self.__grades) if self.__grades else 0.0

    def get_details(self) -> str:
        """Polymorphic method intended to be overridden."""
        return f"Student: {self.name} (ID: {self._student_id})"


# 2. Derived Class (Inheritance & Polymorphism)
class GraduateStudent(Student):
    """Represents a graduate student with a research thesis topic."""
    def __init__(self, name: str, student_id: int, thesis_topic: str):
        super().__init__(name, student_id)    # Call parent constructor
        self.thesis_topic = thesis_topic

    def get_details(self) -> str:
        """Override parent method to add thesis information."""
        base_info = super().get_details()
        return f"{base_info} | Thesis: '{self.thesis_topic}'"


# Instantiate base class
s1 = Student("Ahmed", 101)
s1.add_grade(18.0)
s1.add_grade(16.5)

# Instantiate derived class
s2 = GraduateStudent("Yasmine", 202, "Autonomous Mobile Robots in ROS 2")
s2.add_grade(17.0)

# Demonstrating Polymorphism
roster: list[Student] = [s1, s2]

for student in roster:
    print(student.get_details())
    print(f"  Current Average: {student.get_score():.2f}")
    print("-" * 40)
