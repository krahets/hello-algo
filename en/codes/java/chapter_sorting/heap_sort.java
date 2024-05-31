/**
 * File: heap_sort.java
 * Created Time: 2023-05-26
 * Author: krahets (krahets@163.com)
 */

package chapter_sorting;

import java.util.Arrays;

public class heap_sort {
    /* Heap length is n, start heapifying node i, from top to bottom */
    public static void siftDown(int[] nums, int n, int i) {
        while (true) {
            // Determine the largest node among i, l, r, noted as ma
            int l = 2 * i + 1;
            int r = 2 * i + 2;
            int ma = i;
            if (l < n && nums[l] > nums[ma])
                ma = l;
            if (r < n && nums[r] > nums[ma])
                ma = r;
            // If node i is the largest or indices l, r are out of bounds, no further heapification needed, break
            if (ma == i)
                break;
            // Swap two nodes
            int temp = nums[i];
            nums[i] = nums[ma];
            nums[ma] = temp;
            // Loop downwards heapification
            i = ma;
        }
    }

    /* Heap sort */
    public static void heapSort(int[] nums) {
        // Build heap operation: heapify all nodes except leaves
        for (int i = nums.length / 2 - 1; i >= 0; i--) {
            siftDown(nums, nums.length, i);
        }
        // Extract the largest element from the heap and repeat for n-1 rounds
        for (int i = nums.length - 1; i > 0; i--) {
            // Swap the root node with the rightmost leaf node (swap the first element with the last element)
            int tmp = nums[0];
            nums[0] = nums[i];
            nums[i] = tmp;
            // Start heapifying the root node, from top to bottom
            siftDown(nums, i, 0);
        }
    }

    public static void main(String[] args) {
        int[] nums = { 4, 1, 3, 1, 5, 2 };
        heapSort(nums);
        System.out.println("After heap sort, nums = " + Arrays.toString(nums));
    }
}
