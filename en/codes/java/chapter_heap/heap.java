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
        heap.offer(val); // Push an element onto the heap
        System.out.format("\nAfter pushing %d onto the heap:\n", val);
        PrintUtil.printHeap(heap);
    }

    public static void testPop(Queue<Integer> heap) {
        int val = heap.poll(); // Pop the top element from the heap
        System.out.format("\nAfter popping the top element %d:\n", val);
        PrintUtil.printHeap(heap);
    }

    public static void main(String[] args) {
        /* Initialize heaps */
        // Initialize a min heap
        Queue<Integer> minHeap = new PriorityQueue<>();
        // Initialize a max heap by supplying a lambda expression as the Comparator
        Queue<Integer> maxHeap = new PriorityQueue<>((a, b) -> b - a);

        System.out.println("\nThe following example uses a max heap");

        /* Push an element onto the heap */
        testPush(maxHeap, 1);
        testPush(maxHeap, 3);
        testPush(maxHeap, 2);
        testPush(maxHeap, 5);
        testPush(maxHeap, 4);

        /* Get the top element of the heap */
        int peek = maxHeap.peek();
        System.out.format("\nTop element: %d\n", peek);

        /* Pop the top element from the heap */
        testPop(maxHeap);
        testPop(maxHeap);
        testPop(maxHeap);
        testPop(maxHeap);
        testPop(maxHeap);

        /* Get the heap size */
        int size = maxHeap.size();
        System.out.format("\nNumber of elements in the heap: %d\n", size);

        /* Check whether the heap is empty */
        boolean isEmpty = maxHeap.isEmpty();
        System.out.format("\nIs the heap empty? %b\n", isEmpty);

        /* Build a heap from an input list */
        // The time complexity is O(n), not O(nlogn)
        minHeap = new PriorityQueue<>(Arrays.asList(1, 3, 2, 5, 4));
        System.out.println("\nAfter building a min heap from the input list:");
        PrintUtil.printHeap(minHeap);
    }
}
