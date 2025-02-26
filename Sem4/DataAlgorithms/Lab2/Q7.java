import java.util.Scanner;

class ArrayElements {
    void printArray(int[] arr, int index) {
        if (index == arr.length) return;
        System.out.print(arr[index] + " ");
        printArray(arr, index + 1);
    }
}

class Q7 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        ArrayElements ae = new ArrayElements();
        
        System.out.println("Enter number of array elements: ");
        int n = sc.nextInt();
        
        int[] arr = new int[n];
        for (int i = 0; i < n; i++) {
            System.out.printf("Enter element %d: ", i);
            arr[i] = sc.nextInt();
        }
        
        System.out.println("Array elements: ");
        ae.printArray(arr, 0);
    }
}
