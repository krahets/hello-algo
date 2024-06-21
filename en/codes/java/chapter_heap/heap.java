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
        heap.offer(val); // Push the element into heap
        System.out.format("\nAfter element %d is added to the heap\n", val);
        PrintUtil.printHeap(heap);
    }

    public static void testPop(Queue<Integer> heap) {
        int val = heap.poll(); // Pop the element at the heap top
        System.out.format("\nAfter the top element %d is removed from the heap\n", val);
        PrintUtil.printHeap(heap);
    }

    public static void main(String[] args) {
        /* Initialize the heap */
        // Initialize min-heap
        Queue<Integer> minHeap = new PriorityQueue<>();
        // Initialize the max-heap (using lambda expression to modify Comparator if necessary)
        Queue<Integer> maxHeap = new PriorityQueue<>((a, b) -> b - a);

        System.out.println("\nThe following test case is for max-heap");

        /* Push the element into heap */
        testPush(maxHeap, 1);
        testPush(maxHeap, 3);
        testPush(maxHeap, 2);
        testPush(maxHeap, 5);
        testPush(maxHeap, 4);

        /* Access heap top element */
        int peek = maxHeap.peek();
        System.out.format("\nTop element of the heap is %d\n", peek);

        /* Pop the element at the heap top */
        testPop(maxHeap);
        testPop(maxHeap);
        testPop(maxHeap);
        testPop(maxHeap);
        testPop(maxHeap);

        /* Get heap size */
        int size = maxHeap.size();
        System.out.format("\nNumber of elements in the heap is %d\n", size);

        /* Determine if heap is empty */
        boolean isEmpty = maxHeap.isEmpty();
        System.out.format("\nIs the heap empty %b\n", isEmpty);

        /* Enter list and build heap */
        // Time complexity is O(n), not O(nlogn)
        minHeap = new PriorityQueue<>(Arrays.asList(1, 3, 2, 5, 4));
        System.out.println("\nEnter list and build min-heap");
        PrintUtil.printHeap(minHeap);
    }
}
