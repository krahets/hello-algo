/**
 * File: heap.java
 * Created Time: 2023-01-07
 * Author: krahets (krahets@163.com)
 */

package chapter_heap;

import utils.*;
import java.util.*;

public class heap {
    public static void main(String[] args) {
        // [region]{init}
        /* Initialize heaps */
        // Initialize a min heap
        Queue<Integer> minHeap = new PriorityQueue<>();
        // Initialize a max heap by supplying a lambda expression as the Comparator
        Queue<Integer> maxHeap = new PriorityQueue<>((a, b) -> b - a);
        // [endregion]{init}

        System.out.println("\nThe following example uses a max heap");

        // [region]{push}
        /* Push an element onto the heap */
        maxHeap.offer(1);
        maxHeap.offer(3);
        maxHeap.offer(2);
        maxHeap.offer(5);
        maxHeap.offer(4);
        // [endregion]{push}
        PrintUtil.printHeap(maxHeap);

        // [region]{peek}
        /* Get the top element of the heap */
        int peek = maxHeap.peek(); // 5
        // [endregion]{peek}
        System.out.format("\nTop element: %d\n", peek);

        // [region]{pop_1}
        /* Pop the top element from the heap */
        // The elements are popped in descending order
        peek = maxHeap.poll(); // 5
        // [endregion]{pop_1}
        System.out.println(peek);
        // [region]{pop_2}
        peek = maxHeap.poll(); // 4
        // [endregion]{pop_2}
        System.out.println(peek);
        // [region]{pop_3}
        peek = maxHeap.poll(); // 3
        // [endregion]{pop_3}
        System.out.println(peek);
        // [region]{pop_4}
        peek = maxHeap.poll(); // 2
        // [endregion]{pop_4}
        System.out.println(peek);
        // [region]{pop_5}
        peek = maxHeap.poll(); // 1
        // [endregion]{pop_5}
        System.out.println(peek);

        // [region]{size}
        /* Get the heap size */
        int size = maxHeap.size();
        // [endregion]{size}
        System.out.format("\nNumber of elements in the heap: %d\n", size);

        // [region]{is_empty}
        /* Check whether the heap is empty */
        boolean isEmpty = maxHeap.isEmpty();
        // [endregion]{is_empty}
        System.out.format("\nIs the heap empty? %b\n", isEmpty);

        // [region]{heapify}
        /* Build a heap from an input list */
        // The time complexity is O(n), not O(nlogn)
        minHeap = new PriorityQueue<>(Arrays.asList(1, 3, 2, 5, 4));
        // [endregion]{heapify}
        System.out.println("\nAfter building a min heap from the input list:");
        PrintUtil.printHeap(minHeap);
    }
}
