/**
 * File: heap_sort.java
 * Created Time: 2023-05-26
 * Author: krahets (krahets@163.com)
 */

package chapter_sorting;

import java.util.Arrays;

public class heap_sort {
    /* Sift down from node i in a heap of size n */
    public static void siftDown(int[] nums, int n, int i) {
        while (true) {
            // Let ma be the index of the largest of nodes i, l, and r
            int l = 2 * i + 1;
            int r = 2 * i + 2;
            int ma = i;
            if (l < n && nums[l] > nums[ma])
                ma = l;
            if (r < n && nums[r] > nums[ma])
                ma = r;
            // Stop if i is the largest or both child indices l and r are out of bounds
            if (ma == i)
                break;
            // Swap the two nodes
            int temp = nums[i];
            nums[i] = nums[ma];
            nums[ma] = temp;
            // Continue sifting down
            i = ma;
        }
    }

    /* Heap sort */
    public static void heapSort(int[] nums) {
        // Build the heap by sifting down from each non-leaf node
        for (int i = nums.length / 2 - 1; i >= 0; i--) {
            siftDown(nums, nums.length, i);
        }
        // Extract the maximum from the heap in each of n-1 rounds
        for (int i = nums.length - 1; i > 0; i--) {
            // Swap the root and rightmost leaf (the first and last elements)
            int tmp = nums[0];
            nums[0] = nums[i];
            nums[i] = tmp;
            // Sift down from the root
            siftDown(nums, i, 0);
        }
    }

    public static void main(String[] args) {
        int[] nums = { 4, 1, 3, 1, 5, 2 };
        heapSort(nums);
        System.out.println("After heap sort, nums = " + Arrays.toString(nums));
    }
}
