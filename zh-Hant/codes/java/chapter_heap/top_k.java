/**
 * File: top_k.java
 * Created Time: 2023-06-12
 * Author: krahets (krahets@163.com)
 */

package chapter_heap;

import utils.*;
import java.util.*;

public class top_k {
    /* 基於堆積查詢陣列中最大的 k 個元素 */
    static Queue<Integer> topKHeap(int[] nums, int k) {
        // 初始化小頂堆積
        Queue<Integer> heap = new PriorityQueue<Integer>();
        // 將陣列的前 k 個元素入堆積
        for (int i = 0; i < k; i++) {
            heap.offer(nums[i]);
        }
        // 從第 k+1 個元素開始，保持堆積的長度為 k
        for (int i = k; i < nums.length; i++) {
            // 若當前元素大於堆積頂元素，則將堆積頂元素出堆積、當前元素入堆積
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
        System.out.println("最大的 " + k + " 個元素為");
        PrintUtil.printHeap(res);
    }
}
