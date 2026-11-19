/**
 * File: heap.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_heap

import utils.printHeap
import java.util.*

/* Driver code */
fun main() {
    // [region]{init}
    /* Initialize heaps */
    // Initialize a min heap
    var minHeap = PriorityQueue<Int>()
    // Initialize a max heap by supplying a lambda expression as the Comparator
    val maxHeap = PriorityQueue { a: Int, b: Int -> b - a }
    // [endregion]{init}

    println("\nThe following example uses a max heap")

    // [region]{push}
    /* Push an element onto the heap */
    maxHeap.offer(1)
    maxHeap.offer(3)
    maxHeap.offer(2)
    maxHeap.offer(5)
    maxHeap.offer(4)
    // [endregion]{push}
    printHeap(maxHeap)

    // [region]{peek}
    /* Get the top element of the heap */
    var peek = maxHeap.peek() // 5
    // [endregion]{peek}
    print("\nTop element of the heap: $peek\n")

    // [region]{pop_1}
    /* Pop the top element from the heap */
    // The elements are popped in descending order
    peek = maxHeap.poll() // 5
    // [endregion]{pop_1}
    println("Element popped from the heap: $peek")
    // [region]{pop_2}
    peek = maxHeap.poll() // 4
    // [endregion]{pop_2}
    println("Element popped from the heap: $peek")
    // [region]{pop_3}
    peek = maxHeap.poll() // 3
    // [endregion]{pop_3}
    println("Element popped from the heap: $peek")
    // [region]{pop_4}
    peek = maxHeap.poll() // 2
    // [endregion]{pop_4}
    println("Element popped from the heap: $peek")
    // [region]{pop_5}
    peek = maxHeap.poll() // 1
    // [endregion]{pop_5}
    println("Element popped from the heap: $peek")

    // [region]{size}
    /* Get the heap size */
    val size = maxHeap.size
    // [endregion]{size}
    print("\nNumber of elements in the heap: $size\n")

    // [region]{is_empty}
    /* Check whether the heap is empty */
    val isEmpty = maxHeap.isEmpty()
    // [endregion]{is_empty}
    print("\nIs the heap empty? $isEmpty\n")

    // [region]{heapify}
    /* Build a heap from an input list */
    // The time complexity is O(n), not O(nlogn)
    minHeap = PriorityQueue(mutableListOf<Int?>(1, 3, 2, 5, 4))
    // [endregion]{heapify}
    println("\nAfter building a min heap from the input list:")
    printHeap(minHeap)
}