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
        heap.offer(val); // 元素入堆積
        System.out.format("\n元素 %d 入堆積後\n", val);
        PrintUtil.printHeap(heap);
    }

    public static void testPop(Queue<Integer> heap) {
        int val = heap.poll(); // 堆積頂元素出堆積
        System.out.format("\n堆積頂元素 %d 出堆積後\n", val);
        PrintUtil.printHeap(heap);
    }

    public static void main(String[] args) {
        /* 初始化堆積 */
        // 初始化小頂堆積
        Queue<Integer> minHeap = new PriorityQueue<>();
        // 初始化大頂堆積（使用 lambda 表示式修改 Comparator 即可）
        Queue<Integer> maxHeap = new PriorityQueue<>((a, b) -> b - a);

        System.out.println("\n以下測試樣例為大頂堆積");

        /* 元素入堆積 */
        testPush(maxHeap, 1);
        testPush(maxHeap, 3);
        testPush(maxHeap, 2);
        testPush(maxHeap, 5);
        testPush(maxHeap, 4);

        /* 獲取堆積頂元素 */
        int peek = maxHeap.peek();
        System.out.format("\n堆積頂元素為 %d\n", peek);

        /* 堆積頂元素出堆積 */
        testPop(maxHeap);
        testPop(maxHeap);
        testPop(maxHeap);
        testPop(maxHeap);
        testPop(maxHeap);

        /* 獲取堆積大小 */
        int size = maxHeap.size();
        System.out.format("\n堆積元素數量為 %d\n", size);

        /* 判斷堆積是否為空 */
        boolean isEmpty = maxHeap.isEmpty();
        System.out.format("\n堆積是否為空 %b\n", isEmpty);

        /* 輸入串列並建堆積 */
        // 時間複雜度為 O(n) ，而非 O(nlogn)
        minHeap = new PriorityQueue<>(Arrays.asList(1, 3, 2, 5, 4));
        System.out.println("\n輸入串列並建立小頂堆積後");
        PrintUtil.printHeap(minHeap);
    }
}
