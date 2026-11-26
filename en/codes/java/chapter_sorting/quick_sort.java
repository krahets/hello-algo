/**
 * File: quick_sort.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_sorting;

import java.util.*;

/* Quicksort class */
class QuickSort {
    /* Swap elements */
    static void swap(int[] nums, int i, int j) {
        int tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    /* Partition with two pointers */
    static int partition(int[] nums, int left, int right) {
        // Use nums[left] as the pivot
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;          // Scan from right to left for the first element smaller than the pivot
            while (i < j && nums[i] <= nums[left])
                i++;          // Scan from left to right for the first element larger than the pivot
            swap(nums, i, j); // Swap these two elements
        }
        swap(nums, i, left);  // Swap the pivot into place between the two subarrays
        return i;             // Return the pivot index
    }

    /* Quicksort */
    public static void quickSort(int[] nums, int left, int right) {
        // Stop recursing when the subarray has length 1
        if (left >= right)
            return;
        // Partition with two pointers
        int pivot = partition(nums, left, right);
        // Recurse on the left and right subarrays
        quickSort(nums, left, pivot - 1);
        quickSort(nums, pivot + 1, right);
    }
}

/* Quicksort class with median-of-three pivot selection */
class QuickSortMedian {
    /* Swap elements */
    static void swap(int[] nums, int i, int j) {
        int tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    /* Select the median of three candidates */
    static int medianThree(int[] nums, int left, int mid, int right) {
        int l = nums[left], m = nums[mid], r = nums[right];
        if ((l <= m && m <= r) || (r <= m && m <= l))
            return mid; // m lies between l and r
        if ((m <= l && l <= r) || (r <= l && l <= m))
            return left; // l lies between m and r
        return right;
    }

    /* Partition with two pointers (median of three) */
    static int partition(int[] nums, int left, int right) {
        // Select the median of three candidates
        int med = medianThree(nums, left, (left + right) / 2, right);
        // Swap the median into the leftmost position
        swap(nums, left, med);
        // Use nums[left] as the pivot
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;          // Scan from right to left for the first element smaller than the pivot
            while (i < j && nums[i] <= nums[left])
                i++;          // Scan from left to right for the first element larger than the pivot
            swap(nums, i, j); // Swap these two elements
        }
        swap(nums, i, left);  // Swap the pivot into place between the two subarrays
        return i;             // Return the pivot index
    }

    /* Quicksort */
    public static void quickSort(int[] nums, int left, int right) {
        // Stop recursing when the subarray has length 1
        if (left >= right)
            return;
        // Partition with two pointers
        int pivot = partition(nums, left, right);
        // Recurse on the left and right subarrays
        quickSort(nums, left, pivot - 1);
        quickSort(nums, pivot + 1, right);
    }
}

/* Quicksort class with reduced recursion depth */
class QuickSortTailCall {
    /* Swap elements */
    static void swap(int[] nums, int i, int j) {
        int tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    /* Partition with two pointers */
    static int partition(int[] nums, int left, int right) {
        // Use nums[left] as the pivot
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;          // Scan from right to left for the first element smaller than the pivot
            while (i < j && nums[i] <= nums[left])
                i++;          // Scan from left to right for the first element larger than the pivot
            swap(nums, i, j); // Swap these two elements
        }
        swap(nums, i, left);  // Swap the pivot into place between the two subarrays
        return i;             // Return the pivot index
    }

    /* Quicksort with reduced recursion depth */
    public static void quickSort(int[] nums, int left, int right) {
        // Stop when the subarray has length 1
        while (left < right) {
            // Partition with two pointers
            int pivot = partition(nums, left, right);
            // Apply quicksort to the shorter of the two subarrays
            if (pivot - left < right - pivot) {
                quickSort(nums, left, pivot - 1); // Recursively sort the left subarray
                left = pivot + 1; // The remaining unsorted range is [pivot + 1, right]
            } else {
                quickSort(nums, pivot + 1, right); // Recursively sort the right subarray
                right = pivot - 1; // The remaining unsorted range is [left, pivot - 1]
            }
        }
    }
}

public class quick_sort {
    public static void main(String[] args) {
        /* Quicksort */
        int[] nums = { 2, 4, 1, 0, 3, 5 };
        QuickSort.quickSort(nums, 0, nums.length - 1);
        System.out.println("After quicksort, nums = " + Arrays.toString(nums));

        /* Quicksort with median-of-three pivot selection */
        int[] nums1 = { 2, 4, 1, 0, 3, 5 };
        QuickSortMedian.quickSort(nums1, 0, nums1.length - 1);
        System.out.println("After median-of-three quicksort, nums1 = " + Arrays.toString(nums1));

        /* Quicksort with reduced recursion depth */
        int[] nums2 = { 2, 4, 1, 0, 3, 5 };
        QuickSortTailCall.quickSort(nums2, 0, nums2.length - 1);
        System.out.println("After quicksort with reduced recursion depth, nums2 = " + Arrays.toString(nums2));
    }
}
