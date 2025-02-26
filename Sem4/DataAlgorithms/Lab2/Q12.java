import java.util.Scanner;

class KthLargestElement {
    int partition(int[] arr, int low, int high) {
        int pivot = arr[high];
        int i = low;
        
        for (int j = low; j < high; j++) {
            if (arr[j] >= pivot) {
                // Swap arr[i] and arr[j]
                int temp = arr[i];
                arr[i] = arr[j];
                arr[j] = temp;
                i++;
            }
        }
        // Swap arr[i] and arr[high] (pivot)
        int temp = arr[i];
        arr[i] = arr[high];
        arr[high] = temp;
        
        return i;
    }
    
    int quickSelect(int[] arr, int low, int high, int k) {
        if (low <= high) {
            int pivotIndex = partition(arr, low, high);
            
            if (pivotIndex == k) {
                return arr[pivotIndex];
            } else if (pivotIndex > k) {
                return quickSelect(arr, low, pivotIndex - 1, k);
            } else {
                return quickSelect(arr, pivotIndex + 1, high, k);
            }
        }
        return Integer.MAX_VALUE;
    }
    
    int findKthLargest(int[] arr, int k) {
        return quickSelect(arr, 0, arr.length - 1, k - 1);
    }
}

class Q12 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        KthLargestElement kle = new KthLargestElement();
        
        System.out.println("Enter number of array elements: ");
        int n = sc.nextInt();
        
        int[] arr = new int[n];
        for (int i = 0; i < n; i++) {
            System.out.printf("Enter element %d: ", i);
            arr[i] = sc.nextInt();
        }
        
        System.out.println("Enter the value of k: ");
        int k = sc.nextInt();
        
        int kthLargest = kle.findKthLargest(arr, k);
        System.out.println(k + "th largest element in the array: " + kthLargest);
    }
}
