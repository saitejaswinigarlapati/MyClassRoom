import java.util.Scanner;
class MedianFinder {
    int partition(int[] arr, int low, int high) {
        int pivot = arr[high];
        int i = low;
        
        for (int j = low; j < high; j++) {
            if (arr[j] <= pivot) {
                int temp = arr[i];
                arr[i] = arr[j];
                arr[j] = temp;
                i++;
            }
        }
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
    int findMedian(int[] arr) {
        int n = arr.length;
        if (n % 2 == 1) {
            return quickSelect(arr, 0, n - 1, n / 2);
        } else {
            int mid1 = quickSelect(arr, 0, n - 1, n / 2 - 1);
            int mid2 = quickSelect(arr, 0, n - 1, n / 2);
            return (mid1 + mid2) / 2;
        }
    }
}
class Q11 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        MedianFinder mf = new MedianFinder();
        
        System.out.println("Enter number of array elements: ");
        int n = sc.nextInt();
        
        int[] arr = new int[n];
        for (int i = 0; i < n; i++) {
            System.out.printf("Enter element %d: ", i);
            arr[i] = sc.nextInt();
        }
        
        int median = mf.findMedian(arr);
        System.out.println("Median of the array: " + median);
    }
}
