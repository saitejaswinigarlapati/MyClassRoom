import java.util.Scanner;

class NaturalNumbers {
    void printNatural(int n) {
        if (n == 0) return;
        printNatural(n - 1);
        System.out.print(n + " ");
    }
}

class Q1 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        NaturalNumbers nn = new NaturalNumbers();
        
        System.out.println("Enter the value of N: ");
        int n = sc.nextInt();
        
        nn.printNatural(n);
    }
}
