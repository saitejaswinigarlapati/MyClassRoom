import java.util.Scanner;

class ProductNaturalNumbers {
    int product(int n) {
        if (n <= 1) return 1;
        return n * product(n - 1);
    }
}

class Q3 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        ProductNaturalNumbers pnn = new ProductNaturalNumbers();
        
        System.out.println("Enter the value of N: ");
        int n = sc.nextInt();
        
        System.out.println("Product of first " + n + " natural numbers: " + pnn.product(n));
    }
}
