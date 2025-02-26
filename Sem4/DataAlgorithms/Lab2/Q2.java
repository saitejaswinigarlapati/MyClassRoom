import java.util.Scanner;

class ReverseNaturalNumbers {
    void printReverse(int n) {
        if (n == 0) return;
        System.out.print(n + " ");
        printReverse(n - 1);
    }
}

class Q2 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        ReverseNaturalNumbers rnn = new ReverseNaturalNumbers();
        
        System.out.println("Enter the value of N: ");
        int n = sc.nextInt();
        
        rnn.printReverse(n);
    }
}
