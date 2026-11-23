/**
 * File: top_k.java
 * Created Time: 2023-06-12
 * Author: krahets (krahets@163.com)
 */

package chapter_heap;

import utils.*;
import java.util.*;

public class top_k {
    /* Найти k наибольших элементов массива с помощью кучи */
    static Queue<Integer> topKHeap(int[] nums, int k) {
        // Инициализация минимальной кучи
        Queue<Integer> heap = new PriorityQueue<Integer>();
        // Поместить первые k элементов массива в кучу
        for (int i = 0; i < k; i++) {
            heap.offer(nums[i]);
        }
        // Начиная с элемента k+1, поддерживать длину кучи равной k
        for (int i = k; i < nums.length; i++) {
            // Если текущий элемент больше элемента на вершине кучи, извлечь вершину кучи и добавить текущий элемент в кучу
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
        System.out.println("Наибольшие " + k + " элементов");
        PrintUtil.printHeap(res);
    }
}
