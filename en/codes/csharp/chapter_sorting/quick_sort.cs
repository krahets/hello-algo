/**
 * File: quick_sort.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_sorting;

class quickSort {
    /* Swap the elements */
    static void Swap(int[] nums, int i, int j) {
        (nums[j], nums[i]) = (nums[i], nums[j]);
    }

    /* Two-pointer partitioning */
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
        Swap(nums, i, left);  // Swap the pivot into the boundary position between the two subarrays
        return i;             // Return the pivot index
    }

    /* Quick sort */
    public static void QuickSort(int[] nums, int left, int right) {
        // Stop recursing when the subarray has at most one element
        if (left >= right)
            return;
        // Two-pointer partitioning
        int pivot = Partition(nums, left, right);
        // Recurse on the left and right subarrays
        QuickSort(nums, left, pivot - 1);
        QuickSort(nums, pivot + 1, right);
    }
}

/* Quick sort class (median pivot optimization) */
class QuickSortMedian {
    /* Swap the elements */
    static void Swap(int[] nums, int i, int j) {
        (nums[j], nums[i]) = (nums[i], nums[j]);
    }

    /* Select the median of three candidate elements */
    static int MedianThree(int[] nums, int left, int mid, int right) {
        int l = nums[left], m = nums[mid], r = nums[right];
        if ((l <= m && m <= r) || (r <= m && m <= l))
            return mid; // m lies between l and r
        if ((m <= l && l <= r) || (r <= l && l <= m))
            return left; // l lies between m and r
        return right;
    }

    /* Two-pointer partitioning (median of three) */
    static int Partition(int[] nums, int left, int right) {
        // Select the median of three candidate elements
        int med = MedianThree(nums, left, (left + right) / 2, right);
        // Swap the median into the leftmost position of the current subarray
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
        Swap(nums, i, left);  // Swap the pivot into the boundary position between the two subarrays
        return i;             // Return the pivot index
    }

    /* Quick sort */
    public static void QuickSort(int[] nums, int left, int right) {
        // Stop recursing when the subarray has at most one element
        if (left >= right)
            return;
        // Two-pointer partitioning
        int pivot = Partition(nums, left, right);
        // Recurse on the left and right subarrays
        QuickSort(nums, left, pivot - 1);
        QuickSort(nums, pivot + 1, right);
    }
}

/* Quick sort class (recursion depth optimization) */
class QuickSortTailCall {
    /* Swap the elements */
    static void Swap(int[] nums, int i, int j) {
        (nums[j], nums[i]) = (nums[i], nums[j]);
    }

    /* Two-pointer partitioning */
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
        Swap(nums, i, left);  // Swap the pivot into the boundary position between the two subarrays
        return i; // Return the pivot index
    }

    /* Quick sort (recursion depth optimization) */
    public static void QuickSort(int[] nums, int left, int right) {
        // Stop when the subarray has at most one element
        while (left < right) {
            // Perform two-pointer partitioning
            int pivot = Partition(nums, left, right);
            // Apply quick sort to the shorter of the two subarrays
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
        /* Quick sort */
        int[] nums = [2, 4, 1, 0, 3, 5];
        quickSort.QuickSort(nums, 0, nums.Length - 1);
        Console.WriteLine("After quick sort, nums = " + string.Join(",", nums));

        /* Quick sort (median pivot optimization) */
        int[] nums1 = [2, 4, 1, 0, 3, 5];
        QuickSortMedian.QuickSort(nums1, 0, nums1.Length - 1);
        Console.WriteLine("After quick sort (median pivot optimization), nums1 = " + string.Join(",", nums1));

        /* Quick sort (recursion depth optimization) */
        int[] nums2 = [2, 4, 1, 0, 3, 5];
        QuickSortTailCall.QuickSort(nums2, 0, nums2.Length - 1);
        Console.WriteLine("After quick sort (recursion depth optimization), nums2 = " + string.Join(",", nums2));
    }
}
