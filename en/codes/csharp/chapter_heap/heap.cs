/**
 * File: heap.cs
 * Created Time: 2023-02-06
 * Author: zjkung1123 (zjkung1123@gmail.com)
 */

namespace hello_algo.chapter_heap;

public class heap {
    void TestPush(PriorityQueue<int, int> heap, int val) {
        heap.Enqueue(val, val); // Push an element onto the heap
        Console.WriteLine($"\nHeap after pushing {val}:\n");
        PrintUtil.PrintHeap(heap);
    }

    void TestPop(PriorityQueue<int, int> heap) {
        int val = heap.Dequeue(); // Pop the root
        Console.WriteLine($"\nHeap after popping the root ({val}):\n");
        PrintUtil.PrintHeap(heap);
    }

    [Test]
    public void Test() {
        /* Initialize the heap */
        // Initialize a min-heap
        PriorityQueue<int, int> minHeap = new();
        // Initialize a max-heap using a lambda expression to customize the Comparer
        PriorityQueue<int, int> maxHeap = new(Comparer<int>.Create((x, y) => y.CompareTo(x)));
        Console.WriteLine("The following example uses a max-heap");

        /* Push an element onto the heap */
        TestPush(maxHeap, 1);
        TestPush(maxHeap, 3);
        TestPush(maxHeap, 2);
        TestPush(maxHeap, 5);
        TestPush(maxHeap, 4);

        /* Get the root element */
        int peek = maxHeap.Peek();
        Console.WriteLine($"Root element: {peek}");

        /* Pop the root */
        // The elements come off the heap in descending order
        TestPop(maxHeap);
        TestPop(maxHeap);
        TestPop(maxHeap);
        TestPop(maxHeap);
        TestPop(maxHeap);

        /* Get the heap size */
        int size = maxHeap.Count;
        Console.WriteLine($"Number of elements in the heap: {size}");

        /* Check whether the heap is empty */
        bool isEmpty = maxHeap.Count == 0;
        Console.WriteLine($"Is the heap empty? {isEmpty}");

        /* Build a heap from the input list */
        var list = new int[] { 1, 3, 2, 5, 4 };
        minHeap = new PriorityQueue<int, int>(list.Select(x => (x, x)));
        Console.WriteLine("Min-heap built from the input list:");
        PrintUtil.PrintHeap(minHeap);
    }
}
