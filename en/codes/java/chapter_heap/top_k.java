/**
 * File: top_k.java
 * Created Time: 2023-06-12
 * Author: krahets (krahets@163.com)
 */

package chapter_heap;

import utils.*;
import java.util.*;

public class top_k {
    /* Using heap to find the largest k elements in an array */
    static Queue<Integer> topKHeap(int[] nums, int k) {
        // Initialize min-heap
        Queue<Integer> heap = new PriorityQueue<Integer>();
        // Enter the first k elements of the array into the heap
        for (int i = 0; i < k; i++) {
            heap.offer(nums[i]);
        }
        // From the k+1th element, keep the heap length as k
        for (int i = k; i < nums.length; i++) {
            // If the current element is larger than the heap top element, remove the heap top element and enter the current element into the heap
            if (nums[i] > heap.peek()) {
                heap.poll();
                heap.offer(nums[i]);
            }
        }
        return heap;
    }

    public static void main(String[] args) {
        int[] nums = { 1, 7, 6, 3, 2 };
        int k = 3;

        Queue<Integer> res = topKHeap(nums, k);
        System.out.println("The largest " + k + " elements are");
        PrintUtil.printHeap(res);
    }
}
