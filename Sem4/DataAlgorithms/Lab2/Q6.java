import java.util.Scanner;

class GCD {
    int gcd(int a, int b) {
        if (b == 0) return a;
        return gcd(b, a % b);
    }
}

class Q6{
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        GCD g = new GCD();
        
        System.out.println("Enter the first number: ");
        int a = sc.nextInt();
        
        System.out.println("Enter the second number: ");
        int b = sc.nextInt();
        
        System.out.println("GCD of " + a + " and " + b + " is: " + g.gcd(a, b));
    }
}
