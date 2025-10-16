/**
 * File: top_k.java
 * Created Time: 2023-06-12
 * Author: krahets (krahets@163.com)
 */

package chapter_heap;

import utils.*;
import java.util.*;

public class top_k {
    /* ヒープを使用して配列内の最大 k 個の要素を検索 */
    static Queue<Integer> topKHeap(int[] nums, int k) {
        // 最小ヒープを初期化
        Queue<Integer> heap = new PriorityQueue<Integer>();
        // 配列の最初の k 個の要素をヒープに入力
        for (int i = 0; i < k; i++) {
            heap.offer(nums[i]);
        }
        // k+1 番目の要素から、ヒープの長さを k に保つ
        for (int i = k; i < nums.length; i++) {
            // 現在の要素がヒープの先頭要素より大きい場合、ヒープの先頭要素を削除し、現在の要素をヒープに入力
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
        System.out.println("最大 " + k + " 個の要素は");
        PrintUtil.printHeap(res);
    }
}