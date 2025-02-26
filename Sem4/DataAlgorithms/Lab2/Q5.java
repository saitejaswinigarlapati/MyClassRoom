import java.util.Scanner;

class Power {
    int power(int x, int y) {
        if (y == 0) return 1;
        return x * power(x, y - 1);
    }
}

class Q5 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        Power p = new Power();
        
        System.out.println("Enter the base (x): ");
        int x = sc.nextInt();
        
        System.out.println("Enter the exponent (y): ");
        int y = sc.nextInt();
        
        System.out.println(x + "^" + y + " = " + p.power(x, y));
    }
}
