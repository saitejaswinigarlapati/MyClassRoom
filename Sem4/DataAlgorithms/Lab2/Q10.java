import java.util.Scanner;

class SortedArray {
    boolean isSorted(int[] arr, int index) {
        if (index == arr.length - 1) return true;
        if (arr[index] > arr[index + 1]) return false;
        return isSorted(arr, index + 1);
    }
}

class Q10 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        SortedArray sa = new SortedArray();
        
        System.out.println("Enter number of array elements: ");
        int n = sc.nextInt();
        
        int[] arr = new int[n];
        for (int i = 0; i < n; i++) {
            System.out.printf("Enter element %d: ", i);
            arr[i] = sc.nextInt();
        }
        
        if (sa.isSorted(arr, 0))
            System.out.println("Array is sorted.");
        else
            System.out.println("Array is not sorted.");
    }
}
