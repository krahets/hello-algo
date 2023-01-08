/**
 * File: my_heap.java
 * Created Time: 2023-01-07
 * Author: Krahets (krahets@163.com)
 */

package chapter_heap;

import include.*;
import java.util.*;


public class heap {
    public static void testPush(Queue<Integer> heap, int val) {
        // 元素入堆
        heap.add(val);

        System.out.format("\n添加元素 %d 后\n", val);
        PrintUtil.printHeap(heap);
    }

    public static void testPoll(Queue<Integer> heap) {
        // 元素出堆
        int val = heap.poll();

        System.out.format("\n出堆元素为 %d\n", val);
        PrintUtil.printHeap(heap);
    }

    public static void main(String[] args) {
        /* 初始化堆 */
        // 初始化最小堆
        Queue<Integer> minHeap = new PriorityQueue<>();
        // 初始化最大堆（使用 lambda 表达式修改 Comparator）
        Queue<Integer> maxHeap = new PriorityQueue<>((a, b) -> { return b - a; });

        /* 元素入堆 */
        testPush(maxHeap, 1);
        testPush(maxHeap, 3);
        testPush(maxHeap, 2);
        testPush(maxHeap, 5);
        testPush(maxHeap, 4);

        /* 获取堆顶元素 */
        int peek = maxHeap.peek();
        System.out.format("\n堆顶元素为 %d\n", peek);

        /* 元素出堆 */
        testPoll(maxHeap);
        testPoll(maxHeap);

        /* 获取堆大小 */
        int size = maxHeap.size();
        System.out.format("\n堆元素数量为 %d\n", size);

        /* 判断堆是否为空 */
        boolean isEmpty = maxHeap.isEmpty();
        System.out.format("\n堆是否为空 %b\n", isEmpty);
    }
}
