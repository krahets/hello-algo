/**
 * File: top_k.java
 * Created Time: 2023-06-12
 * Author: krahets (krahets@163.com)
 */

package chapter_heap;

import utils.*;
import java.util.*;

public class top_k {
    /* 힙을 이용하여 배열에서 가장 큰 k개 원소 탐색 */
    static Queue<Integer> topKHeap(int[] nums, int k) {
        // 최소 힙 초기화
        Queue<Integer> heap = new PriorityQueue<Integer>();
        // 배열의 앞쪽 k개 원소를 힙에 삽입한다
        for (int i = 0; i < k; i++) {
            heap.offer(nums[i]);
        }
        // k+1번째 원소부터 힙의 길이를 k로 유지한다
        for (int i = k; i < nums.length; i++) {
            // 현재 원소가 힙의 루트 원소보다 크면 루트 원소를 꺼내고 현재 원소를 힙에 삽입한다
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
        System.out.println("가장 큰 " + k + " 개 원소:");
        PrintUtil.printHeap(res);
    }
}
