public class CoreJavaExercises {

    static int fib(int n) {
        if (n <= 1)
            return n;
        return fib(n - 1) + fib(n - 2);
    }

    static int add(int a, int b) {
        return a + b;
    }

    static double add(double a, double b) {
        return a + b;
    }

    static int add(int a, int b, int c) {
        return a + b + c;
    }

    public static void main(String[] args) {

        // 1. Hello World
        System.out.println("Hello World");

        // 2. Calculator
        int a = 10, b = 5;
        System.out.println("Addition = " + (a + b));

        // 3. Even or Odd
        int n = 8;
        System.out.println(n % 2 == 0 ? "Even" : "Odd");

        // 4. Leap Year
        int year = 2024;
        if ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0)
            System.out.println("Leap Year");

        // 5. Multiplication Table
        for (int i = 1; i <= 10; i++)
            System.out.println("5 x " + i + " = " + (5 * i));

        // 6. Data Types
        int x = 10;
        float f = 5.5f;
        double d = 9.99;
        char c = 'A';
        boolean flag = true;
        System.out.println(x + " " + f + " " + d + " " + c + " " + flag);

        // 7. Type Casting
        double num = 12.5;
        int num2 = (int) num;
        System.out.println(num2);

        // 8. Operator Precedence
        int result = 10 + 5 * 2;
        System.out.println(result);

        // 9. Grade Calculator
        int marks = 85;
        if (marks >= 90)
            System.out.println("A");
        else if (marks >= 80)
            System.out.println("B");
        else
            System.out.println("C");

        // 10. Number Guessing
        int guess = 50;
        int secret = 50;
        if (guess == secret)
            System.out.println("Correct Guess");

        // 11. Factorial
        int fact = 1;
        for (int i = 1; i <= 5; i++)
            fact *= i;
        System.out.println("Factorial = " + fact);

        // 12. Method Overloading
        System.out.println(add(2, 3));
        System.out.println(add(2.5, 3.5));
        System.out.println(add(1, 2, 3));

        // 13. Fibonacci
        System.out.println("Fibonacci = " + fib(6));

        // 14. Array Sum and Average
        int arr[] = {10, 20, 30};
        int sum = 0;
        for (int value : arr)
            sum += value;
        System.out.println("Sum = " + sum);
        System.out.println("Average = " + (sum / arr.length));

        // 15. String Reversal
        String str = "Java";
        String rev = new StringBuilder(str).reverse().toString();
        System.out.println(rev);

        // 16. Palindrome
        String p = "madam";
        if (p.equals(new StringBuilder(p).reverse().toString()))
            System.out.println("Palindrome");

        // 17. Class and Object
        Car car = new Car();
        car.display();

        // 18. Inheritance
        Dog dog = new Dog();
        dog.makeSound();

        // 19. Interface
        Game game = new Game();
        game.play();
    }
}

class Car {
    void display() {
        System.out.println("Toyota Camry");
    }
}

class Animal {
    void makeSound() {
        System.out.println("Animal Sound");
    }
}

class Dog extends Animal {
    void makeSound() {
        System.out.println("Bark");
    }
}

interface Playable {
    void play();
}

class Game implements Playable {
    public void play() {
        System.out.println("Playing Game");
    }
}