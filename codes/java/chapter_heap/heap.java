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
        heap.add(val); // 元素入堆
        System.out.format("\n添加元素 %d 后\n", val);
        PrintUtil.printHeap(heap);
    }

    public static void testPoll(Queue<Integer> heap) {
        int val = heap.poll(); // 堆顶元素出堆
        System.out.format("\n出堆元素为 %d\n", val);
        PrintUtil.printHeap(heap);
    }

    public static void main(String[] args) {
        /* 初始化堆 */
        // 初始化小顶堆
        Queue<Integer> minHeap = new PriorityQueue<>();
        // 初始化大顶堆（使用 lambda 表达式修改 Comparator 即可）
        Queue<Integer> maxHeap = new PriorityQueue<>((a, b) -> { return b - a; });

        System.out.println("\n以下测试样例为大顶堆");

        /* 元素入堆 */
        testPush(maxHeap, 1);
        testPush(maxHeap, 3);
        testPush(maxHeap, 2);
        testPush(maxHeap, 5);
        testPush(maxHeap, 4);

        /* 获取堆顶元素 */
        int peek = maxHeap.peek();
        System.out.format("\n堆顶元素为 %d\n", peek);

        /* 堆顶元素出堆 */
        testPoll(maxHeap);
        testPoll(maxHeap);

        /* 获取堆大小 */
        int size = maxHeap.size();
        System.out.format("\n堆元素数量为 %d\n", size);

        /* 判断堆是否为空 */
        boolean isEmpty = maxHeap.isEmpty();
        System.out.format("\n堆是否为空 %b\n", isEmpty);

        /* 输入列表并建堆 */
        // 时间复杂度为 O(n) ，而非 O(nlogn)
        minHeap = new PriorityQueue<>(Arrays.asList(1, 3, 2, 5, 4));
        System.out.println("\n输入 [1, 3, 2, 5, 4] ，建立小顶堆");
        PrintUtil.printHeap(minHeap);
    }
}
