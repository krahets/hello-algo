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
        System.out.format("\nHeap after pushing %d:\n", val);
        PrintUtil.printHeap(heap);
    }

    public static void testPop(Queue<Integer> heap) {
        int val = heap.poll(); // Pop the root
        System.out.format("\nHeap after popping the root (%d):\n", val);
        PrintUtil.printHeap(heap);
    }

    public static void main(String[] args) {
        /* Initialize the heap */
        // Initialize a min-heap
        Queue<Integer> minHeap = new PriorityQueue<>();
        // Initialize a max-heap using a lambda expression to customize the Comparator
        Queue<Integer> maxHeap = new PriorityQueue<>((a, b) -> b - a);

        System.out.println("\nThe following example uses a max-heap");

        /* Push an element onto the heap */
        testPush(maxHeap, 1);
        testPush(maxHeap, 3);
        testPush(maxHeap, 2);
        testPush(maxHeap, 5);
        testPush(maxHeap, 4);

        /* Get the root element */
        int peek = maxHeap.peek();
        System.out.format("\nRoot element: %d\n", peek);

        /* Pop the root */
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

        /* Build a heap from the input list */
        // The time complexity is O(n), rather than O(nlogn)
        minHeap = new PriorityQueue<>(Arrays.asList(1, 3, 2, 5, 4));
        System.out.println("\nMin-heap built from the input list:");
        PrintUtil.printHeap(minHeap);
    }
}
