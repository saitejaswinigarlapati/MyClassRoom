import java.util.Scanner;

class ReverseArray {
    void printReverse(int[] arr, int index) {
        if (index < 0) return;
        System.out.print(arr[index] + " ");
        printReverse(arr, index - 1);
    }
}

class Q8 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        ReverseArray ra = new ReverseArray();
        
        System.out.println("Enter number of array elements: ");
        int n = sc.nextInt();
        
        int[] arr = new int[n];
        for (int i = 0; i < n; i++) {
            System.out.printf("Enter element %d: ", i);
            arr[i] = sc.nextInt();
        }
        
        System.out.println("Array elements in reverse order: ");
        ra.printReverse(arr, n - 1);
    }
}
