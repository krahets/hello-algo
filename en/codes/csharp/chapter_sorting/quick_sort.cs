/**
 * File: quick_sort.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_sorting;

class quickSort {
    /* Swap elements */
    static void Swap(int[] nums, int i, int j) {
        (nums[j], nums[i]) = (nums[i], nums[j]);
    }

    /* Sentinel partition */
    static int Partition(int[] nums, int left, int right) {
        // Use nums[left] as the pivot
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;          // Search from right to left for the first element smaller than the pivot
            while (i < j && nums[i] <= nums[left])
                i++;          // Search from left to right for the first element greater than the pivot
            Swap(nums, i, j); // Swap these two elements
        }
        Swap(nums, i, left);  // Swap the pivot to the boundary between the two subarrays
        return i;             // Return the index of the pivot
    }

    /* Quick sort */
    public static void QuickSort(int[] nums, int left, int right) {
        // Terminate recursion when subarray length is 1
        if (left >= right)
            return;
        // Sentinel partition
        int pivot = Partition(nums, left, right);
        // Recursively process the left subarray and right subarray
        QuickSort(nums, left, pivot - 1);
        QuickSort(nums, pivot + 1, right);
    }
}

/* Quick sort class (median pivot optimization) */
class QuickSortMedian {
    /* Swap elements */
    static void Swap(int[] nums, int i, int j) {
        (nums[j], nums[i]) = (nums[i], nums[j]);
    }

    /* Select the median of three candidate elements */
    static int MedianThree(int[] nums, int left, int mid, int right) {
        int l = nums[left], m = nums[mid], r = nums[right];
        if ((l <= m && m <= r) || (r <= m && m <= l))
            return mid; // m is between l and r
        if ((m <= l && l <= r) || (r <= l && l <= m))
            return left; // l is between m and r
        return right;
    }

    /* Sentinel partition (median of three) */
    static int Partition(int[] nums, int left, int right) {
        // Select the median of three candidate elements
        int med = MedianThree(nums, left, (left + right) / 2, right);
        // Swap the median to the array's leftmost position
        Swap(nums, left, med);
        // Use nums[left] as the pivot
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;          // Search from right to left for the first element smaller than the pivot
            while (i < j && nums[i] <= nums[left])
                i++;          // Search from left to right for the first element greater than the pivot
            Swap(nums, i, j); // Swap these two elements
        }
        Swap(nums, i, left);  // Swap the pivot to the boundary between the two subarrays
        return i;             // Return the index of the pivot
    }

    /* Quick sort */
    public static void QuickSort(int[] nums, int left, int right) {
        // Terminate recursion when subarray length is 1
        if (left >= right)
            return;
        // Sentinel partition
        int pivot = Partition(nums, left, right);
        // Recursively process the left subarray and right subarray
        QuickSort(nums, left, pivot - 1);
        QuickSort(nums, pivot + 1, right);
    }
}

/* Quick sort class (recursion depth optimization) */
class QuickSortTailCall {
    /* Swap elements */
    static void Swap(int[] nums, int i, int j) {
        (nums[j], nums[i]) = (nums[i], nums[j]);
    }

    /* Sentinel partition */
    static int Partition(int[] nums, int left, int right) {
        // Use nums[left] as the pivot
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;          // Search from right to left for the first element smaller than the pivot
            while (i < j && nums[i] <= nums[left])
                i++;          // Search from left to right for the first element greater than the pivot
            Swap(nums, i, j); // Swap these two elements
        }
        Swap(nums, i, left);  // Swap the pivot to the boundary between the two subarrays
        return i; // Return the index of the pivot
    }

    /* Quick sort (recursion depth optimization) */
    public static void QuickSort(int[] nums, int left, int right) {
        // Terminate when subarray length is 1
        while (left < right) {
            // Sentinel partition operation
            int pivot = Partition(nums, left, right);
            // Perform quick sort on the shorter of the two subarrays
            if (pivot - left < right - pivot) {
                QuickSort(nums, left, pivot - 1);  // Recursively sort the left subarray
                left = pivot + 1;  // Remaining unsorted interval is [pivot + 1, right]
            } else {
                QuickSort(nums, pivot + 1, right); // Recursively sort the right subarray
                right = pivot - 1; // Remaining unsorted interval is [left, pivot - 1]
            }
        }
    }
}

public class quick_sort {
    [Test]
    public void Test() {
        /* Quick sort */
        int[] nums = [2, 4, 1, 0, 3, 5];
        quickSort.QuickSort(nums, 0, nums.Length - 1);
        Console.WriteLine("After quick sort completes, nums = " + string.Join(",", nums));

        /* Quick sort (recursion depth optimization) */
        int[] nums1 = [2, 4, 1, 0, 3, 5];
        QuickSortMedian.QuickSort(nums1, 0, nums1.Length - 1);
        Console.WriteLine("After quick sort (median pivot optimization) completes, nums1 = " + string.Join(",", nums1));

        /* Quick sort (recursion depth optimization) */
        int[] nums2 = [2, 4, 1, 0, 3, 5];
        QuickSortTailCall.QuickSort(nums2, 0, nums2.Length - 1);
        Console.WriteLine("After quick sort (recursion depth optimization) completes, nums2 = " + string.Join(",", nums2));
    }
}
