/**
 * File: heap.java
 * Created Time: 2023-01-07
 * Author: krahets (krahets@163.com)
 */

package chapter_heap;

import utils.*;
import java.util.*;

public class heap {
    public static void testPush(Queue<Integer> heap, int val) {
        heap.offer(val); // 將元素加入堆積
        System.out.format("\n將元素 %d 加入堆積後\n", val);
        PrintUtil.printHeap(heap);
    }

    public static void testPop(Queue<Integer> heap) {
        int val = heap.poll(); // 取出堆積頂端元素
        System.out.format("\n取出堆積頂端元素 %d 後\n", val);
        PrintUtil.printHeap(heap);
    }

    public static void main(String[] args) {
        /* 初始化堆積 */
        // 初始化最小堆積
        Queue<Integer> minHeap = new PriorityQueue<>();
        // 初始化最大堆積（用 lambda 運算式修改 Comparator 即可）
        Queue<Integer> maxHeap = new PriorityQueue<>((a, b) -> b - a);

        System.out.println("\n以下以最大堆積為測試案例");

        /* 將元素加入堆積 */
        testPush(maxHeap, 1);
        testPush(maxHeap, 3);
        testPush(maxHeap, 2);
        testPush(maxHeap, 5);
        testPush(maxHeap, 4);

        /* 取得堆積頂端元素 */
        int peek = maxHeap.peek();
        System.out.format("\n堆積頂端元素為 %d\n", peek);

        /* 取出堆積頂端元素 */
        testPop(maxHeap);
        testPop(maxHeap);
        testPop(maxHeap);
        testPop(maxHeap);
        testPop(maxHeap);

        /* 取得堆積大小 */
        int size = maxHeap.size();
        System.out.format("\n堆積中的元素個數為 %d\n", size);

        /* 判斷堆積是否為空 */
        boolean isEmpty = maxHeap.isEmpty();
        System.out.format("\n堆積是否為空 %b\n", isEmpty);

        /* 以輸入串列建立堆積 */
        // 時間複雜度為 O(n)，而非 O(nlogn)
        minHeap = new PriorityQueue<>(Arrays.asList(1, 3, 2, 5, 4));
        System.out.println("\n用輸入串列建立最小堆積後");
        PrintUtil.printHeap(minHeap);
    }
}
