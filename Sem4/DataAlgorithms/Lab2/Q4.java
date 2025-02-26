import java.util.Scanner;

class Fibonacci {
    int fibonacci(int n) {
        if (n <= 1) return n;
        return fibonacci(n - 1) + fibonacci(n - 2);
    }
}

class Q4 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        Fibonacci fib = new Fibonacci();
        
        System.out.println("Enter the value of N: ");
        int n = sc.nextInt();
        
        System.out.println(n + "th Fibonacci number: " + fib.fibonacci(n));
    }
}
