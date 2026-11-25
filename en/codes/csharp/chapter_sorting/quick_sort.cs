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

    /* Partition with two pointers */
    static int Partition(int[] nums, int left, int right) {
        // Use nums[left] as the pivot
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;          // Scan from right to left for the first element smaller than the pivot
            while (i < j && nums[i] <= nums[left])
                i++;          // Scan from left to right for the first element larger than the pivot
            Swap(nums, i, j); // Swap these two elements
        }
        Swap(nums, i, left);  // Swap the pivot into place between the two subarrays
        return i;             // Return the pivot index
    }

    /* Quicksort */
    public static void QuickSort(int[] nums, int left, int right) {
        // Stop recursing when the subarray has length 1
        if (left >= right)
            return;
        // Partition with two pointers
        int pivot = Partition(nums, left, right);
        // Recurse on the left and right subarrays
        QuickSort(nums, left, pivot - 1);
        QuickSort(nums, pivot + 1, right);
    }
}

/* Quicksort class with median-of-three pivot selection */
class QuickSortMedian {
    /* Swap elements */
    static void Swap(int[] nums, int i, int j) {
        (nums[j], nums[i]) = (nums[i], nums[j]);
    }

    /* Select the median of three candidates */
    static int MedianThree(int[] nums, int left, int mid, int right) {
        int l = nums[left], m = nums[mid], r = nums[right];
        if ((l <= m && m <= r) || (r <= m && m <= l))
            return mid; // m lies between l and r
        if ((m <= l && l <= r) || (r <= l && l <= m))
            return left; // l lies between m and r
        return right;
    }

    /* Partition with two pointers (median of three) */
    static int Partition(int[] nums, int left, int right) {
        // Select the median of three candidates
        int med = MedianThree(nums, left, (left + right) / 2, right);
        // Swap the median into the leftmost position
        Swap(nums, left, med);
        // Use nums[left] as the pivot
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;          // Scan from right to left for the first element smaller than the pivot
            while (i < j && nums[i] <= nums[left])
                i++;          // Scan from left to right for the first element larger than the pivot
            Swap(nums, i, j); // Swap these two elements
        }
        Swap(nums, i, left);  // Swap the pivot into place between the two subarrays
        return i;             // Return the pivot index
    }

    /* Quicksort */
    public static void QuickSort(int[] nums, int left, int right) {
        // Stop recursing when the subarray has length 1
        if (left >= right)
            return;
        // Partition with two pointers
        int pivot = Partition(nums, left, right);
        // Recurse on the left and right subarrays
        QuickSort(nums, left, pivot - 1);
        QuickSort(nums, pivot + 1, right);
    }
}

/* Quicksort class with reduced recursion depth */
class QuickSortTailCall {
    /* Swap elements */
    static void Swap(int[] nums, int i, int j) {
        (nums[j], nums[i]) = (nums[i], nums[j]);
    }

    /* Partition with two pointers */
    static int Partition(int[] nums, int left, int right) {
        // Use nums[left] as the pivot
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;          // Scan from right to left for the first element smaller than the pivot
            while (i < j && nums[i] <= nums[left])
                i++;          // Scan from left to right for the first element larger than the pivot
            Swap(nums, i, j); // Swap these two elements
        }
        Swap(nums, i, left);  // Swap the pivot into place between the two subarrays
        return i; // Return the pivot index
    }

    /* Quicksort with reduced recursion depth */
    public static void QuickSort(int[] nums, int left, int right) {
        // Stop when the subarray has length 1
        while (left < right) {
            // Partition with two pointers
            int pivot = Partition(nums, left, right);
            // Apply quicksort to the shorter of the two subarrays
            if (pivot - left < right - pivot) {
                QuickSort(nums, left, pivot - 1);  // Recursively sort the left subarray
                left = pivot + 1;  // The remaining unsorted range is [pivot + 1, right]
            } else {
                QuickSort(nums, pivot + 1, right); // Recursively sort the right subarray
                right = pivot - 1; // The remaining unsorted range is [left, pivot - 1]
            }
        }
    }
}

public class quick_sort {
    [Test]
    public void Test() {
        /* Quicksort */
        int[] nums = [2, 4, 1, 0, 3, 5];
        quickSort.QuickSort(nums, 0, nums.Length - 1);
        Console.WriteLine("After quicksort, nums = " + string.Join(",", nums));

        /* Quicksort with median-of-three pivot selection */
        int[] nums1 = [2, 4, 1, 0, 3, 5];
        QuickSortMedian.QuickSort(nums1, 0, nums1.Length - 1);
        Console.WriteLine("After median-of-three quicksort, nums1 = " + string.Join(",", nums1));

        /* Quicksort with reduced recursion depth */
        int[] nums2 = [2, 4, 1, 0, 3, 5];
        QuickSortTailCall.QuickSort(nums2, 0, nums2.Length - 1);
        Console.WriteLine("After quicksort with reduced recursion depth, nums2 = " + string.Join(",", nums2));
    }
}
