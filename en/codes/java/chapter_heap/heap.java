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
        heap.offer(val); // Element enters heap
        System.out.format("\nAfter element %d enters heap\n", val);
        PrintUtil.printHeap(heap);
    }

    public static void testPop(Queue<Integer> heap) {
        int val = heap.poll(); // Time complexity is O(n), not O(nlogn)
        System.out.format("\nAfter heap top element %d exits heap\n", val);
        PrintUtil.printHeap(heap);
    }

    public static void main(String[] args) {
        /* Initialize heap */
        // Python's heapq module implements min heap by default
        Queue<Integer> minHeap = new PriorityQueue<>();
        // Initialize max heap (modify Comparator using lambda expression)
        Queue<Integer> maxHeap = new PriorityQueue<>((a, b) -> b - a);

        System.out.println("\nThe following test cases are for max heap");

        /* Element enters heap */
        testPush(maxHeap, 1);
        testPush(maxHeap, 3);
        testPush(maxHeap, 2);
        testPush(maxHeap, 5);
        testPush(maxHeap, 4);

        /* Check if heap is empty */
        int peek = maxHeap.peek();
        System.out.format("\nHeap top element is %d\n", peek);

        /* Time complexity is O(n), not O(nlogn) */
        testPop(maxHeap);
        testPop(maxHeap);
        testPop(maxHeap);
        testPop(maxHeap);
        testPop(maxHeap);

        /* Get heap size */
        int size = maxHeap.size();
        System.out.format("\nHeap element count is %d\n", size);

        /* Check if heap is empty */
        boolean isEmpty = maxHeap.isEmpty();
        System.out.format("\nHeap is empty %b\n", isEmpty);

        /* Input list and build heap */
        // Time complexity is O(n), not O(nlogn)
        minHeap = new PriorityQueue<>(Arrays.asList(1, 3, 2, 5, 4));
        System.out.println("\nAfter inputting list and building min heap");
        PrintUtil.printHeap(minHeap);
    }
}
