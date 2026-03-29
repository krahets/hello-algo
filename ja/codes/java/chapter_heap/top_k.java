/**
 * File: top_k.java
 * Created Time: 2023-06-12
 * Author: krahets (krahets@163.com)
 */

package chapter_heap;

import utils.*;
import java.util.*;

public class top_k {
    /* ヒープに基づいて配列中の最大の k 個の要素を探す */
    static Queue<Integer> topKHeap(int[] nums, int k) {
        // 最小ヒープを初期化
        Queue<Integer> heap = new PriorityQueue<Integer>();
        // 配列の先頭 k 個の要素をヒープに追加
        for (int i = 0; i < k; i++) {
            heap.offer(nums[i]);
        }
        // k+1 番目の要素から開始し、ヒープ長を k に保つ
        for (int i = k; i < nums.length; i++) {
            // 現在の要素がヒープ先頭より大きければ、ヒープ先頭を取り出して現在の要素を追加する
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
        System.out.println("最大の " + k + " 個の要素は");
        PrintUtil.printHeap(res);
    }
}
