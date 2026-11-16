/**
 * File: heap.cs
 * Created Time: 2023-02-06
 * Author: zjkung1123 (zjkung1123@gmail.com)
 */

namespace hello_algo.chapter_heap;

public class heap {
    [Test]
    public void Test() {
        // [region]{init}
        /* Initialize heaps */
        // Initialize a min heap
        PriorityQueue<int, int> minHeap = new();
        // Initialize a max heap (use a lambda expression to customize the Comparer)
        PriorityQueue<int, int> maxHeap = new(Comparer<int>.Create((x, y) => y.CompareTo(x)));
        // [endregion]{init}
        Console.WriteLine("The following examples use a max heap");

        // [region]{push}
        /* Push an element onto the heap */
        maxHeap.Enqueue(1, 1);
        maxHeap.Enqueue(3, 3);
        maxHeap.Enqueue(2, 2);
        maxHeap.Enqueue(5, 5);
        maxHeap.Enqueue(4, 4);
        // [endregion]{push}
        PrintUtil.PrintHeap(maxHeap);

        // [region]{peek}
        /* Get the top element of the heap */
        int peek = maxHeap.Peek(); // 5
        // [endregion]{peek}
        Console.WriteLine($"Top element of the heap: {peek}");

        // [region]{pop_1}
        /* Pop the top element from the heap */
        // The elements are popped in descending order
        peek = maxHeap.Dequeue(); // 5
        // [endregion]{pop_1}
        Console.WriteLine($"Element popped from the heap: {peek}");
        // [region]{pop_2}
        peek = maxHeap.Dequeue(); // 4
        // [endregion]{pop_2}
        Console.WriteLine($"Element popped from the heap: {peek}");
        // [region]{pop_3}
        peek = maxHeap.Dequeue(); // 3
        // [endregion]{pop_3}
        Console.WriteLine($"Element popped from the heap: {peek}");
        // [region]{pop_4}
        peek = maxHeap.Dequeue(); // 2
        // [endregion]{pop_4}
        Console.WriteLine($"Element popped from the heap: {peek}");
        // [region]{pop_5}
        peek = maxHeap.Dequeue(); // 1
        // [endregion]{pop_5}
        Console.WriteLine($"Element popped from the heap: {peek}");

        // [region]{size}
        /* Get the heap size */
        int size = maxHeap.Count;
        // [endregion]{size}
        Console.WriteLine($"Number of elements in the heap: {size}");

        // [region]{is_empty}
        /* Check whether the heap is empty */
        bool isEmpty = maxHeap.Count == 0;
        // [endregion]{is_empty}
        Console.WriteLine($"Is the heap empty? {isEmpty}");

        // [region]{heapify}
        /* Build a heap from an input list */
        // The time complexity is O(n), not O(nlogn)
        minHeap = new PriorityQueue<int, int>([(1, 1), (3, 3), (2, 2), (5, 5), (4, 4)]);
        // [endregion]{heapify}
        Console.WriteLine("After building a min heap from the input list:");
        PrintUtil.PrintHeap(minHeap);
    }
}
