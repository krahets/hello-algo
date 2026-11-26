/**
 * File: top_k.java
 * Created Time: 2023-06-12
 * Author: krahets (krahets@163.com)
 */

package chapter_heap;

import utils.*;
import java.util.*;

public class top_k {
    /* 힙을 이용해 배열에서 가장 큰 원소 k개 찾기 */
    static Queue<Integer> topKHeap(int[] nums, int k) {
        // 최소 힙 초기화
        Queue<Integer> heap = new PriorityQueue<Integer>();
        // 배열의 처음 k개 원소를 힙에 삽입
        for (int i = 0; i < k; i++) {
            heap.offer(nums[i]);
        }
        // k+1번째 원소부터 힙의 크기를 k로 유지
        for (int i = k; i < nums.length; i++) {
            // 현재 원소가 루트보다 크면 루트를 꺼내고 현재 원소를 삽입
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
        System.out.println("가장 큰 원소 " + k + " 개:");
        PrintUtil.printHeap(res);
    }
}
