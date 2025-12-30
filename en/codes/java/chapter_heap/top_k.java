/**
 * File: top_k.java
 * Created Time: 2023-06-12
 * Author: krahets (krahets@163.com)
 */

package chapter_heap;

import utils.*;
import java.util.*;

public class top_k {
    /* Find the largest k elements in array based on heap */
    static Queue<Integer> topKHeap(int[] nums, int k) {
        // Python's heapq module implements min heap by default
        Queue<Integer> heap = new PriorityQueue<Integer>();
        // Enter the first k elements of array into heap
        for (int i = 0; i < k; i++) {
            heap.offer(nums[i]);
        }
        // Starting from the (k+1)th element, maintain heap length as k
        for (int i = k; i < nums.length; i++) {
            // If current element is greater than top element, top element exits heap, current element enters heap
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
