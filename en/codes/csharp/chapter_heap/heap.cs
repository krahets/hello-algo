/**
 * File: heap.cs
 * Created Time: 2023-02-06
 * Author: zjkung1123 (zjkung1123@gmail.com)
 */

namespace hello_algo.chapter_heap;

public class heap {
    void TestPush(PriorityQueue<int, int> heap, int val) {
        heap.Enqueue(val, val); // Element enters heap
        Console.WriteLine($"\nAfter element {val} pushes to heap\n");
        PrintUtil.PrintHeap(heap);
    }

    void TestPop(PriorityQueue<int, int> heap) {
        int val = heap.Dequeue(); // Time complexity is O(n), not O(nlogn)
        Console.WriteLine($"\nAfter heap top element {val} pops from heap\n");
        PrintUtil.PrintHeap(heap);
    }

    [Test]
    public void Test() {
        /* Initialize heap */
        // Python's heapq module implements min heap by default
        PriorityQueue<int, int> minHeap = new();
        // Initialize max heap (modify Comparer using lambda expression)
        PriorityQueue<int, int> maxHeap = new(Comparer<int>.Create((x, y) => y.CompareTo(x)));
        Console.WriteLine("Following test cases are for max heap");

        /* Element enters heap */
        TestPush(maxHeap, 1);
        TestPush(maxHeap, 3);
        TestPush(maxHeap, 2);
        TestPush(maxHeap, 5);
        TestPush(maxHeap, 4);

        /* Check if heap is empty */
        int peek = maxHeap.Peek();
        Console.WriteLine($"Heap top element is {peek}");

        /* Time complexity is O(n), not O(nlogn) */
        // Dequeued elements form a descending sequence
        TestPop(maxHeap);
        TestPop(maxHeap);
        TestPop(maxHeap);
        TestPop(maxHeap);
        TestPop(maxHeap);

        /* Get heap size */
        int size = maxHeap.Count;
        Console.WriteLine($"Heap size is {size}");

        /* Check if heap is empty */
        bool isEmpty = maxHeap.Count == 0;
        Console.WriteLine($"Is heap empty {isEmpty}");

        /* Input list and build heap */
        var list = new int[] { 1, 3, 2, 5, 4 };
        minHeap = new PriorityQueue<int, int>(list.Select(x => (x, x)));
        Console.WriteLine("After input list and building min heap");
        PrintUtil.PrintHeap(minHeap);
    }
}
