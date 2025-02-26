import java.util.Scanner;

class ReverseNumber {
    int reverse(int num, int rev) {
        if (num == 0) return rev;
        rev = rev * 10 + (num % 10);
        return reverse(num / 10, rev);
    }
}

class Q9 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        ReverseNumber rn = new ReverseNumber();
        
        System.out.println("Enter a number to reverse: ");
        int num = sc.nextInt();
        
        System.out.println("Reversed number: " + rn.reverse(num, 0));
    }
}
