/**
 * File: heap.cs
 * Created Time: 2023-02-06
 * Author: zjkung1123 (zjkung1123@gmail.com)
 */

namespace hello_algo.chapter_heap;

public class heap {
    void TestPush(PriorityQueue<int, int> heap, int val) {
        heap.Enqueue(val, val); // Push the element into heap
        Console.WriteLine($"\nElement {val} after being pushed to the heap\n");
        PrintUtil.PrintHeap(heap);
    }

    void TestPop(PriorityQueue<int, int> heap) {
        int val = heap.Dequeue(); // Pop the element at the heap top
        Console.WriteLine($"\nThe top element of the heap {val} after being popped\n");
        PrintUtil.PrintHeap(heap);
    }

    [Test]
    public void Test() {
        /* Initialize the heap */
        // Initialize min-heap
        PriorityQueue<int, int> minHeap = new();
        // Initialize the max-heap (using lambda expression to modify Comparator if necessary)
        PriorityQueue<int, int> maxHeap = new(Comparer<int>.Create((x, y) => y - x));
        Console.WriteLine("The following test case is for a max-heap");

        /* Push the element into heap */
        TestPush(maxHeap, 1);
        TestPush(maxHeap, 3);
        TestPush(maxHeap, 2);
        TestPush(maxHeap, 5);
        TestPush(maxHeap, 4);

        /* Access heap top element */
        int peek = maxHeap.Peek();
        Console.WriteLine($"The top element of the heap is {peek}");

        /* Pop the element at the heap top */
        // Popped elements form a descending sequence
        TestPop(maxHeap);
        TestPop(maxHeap);
        TestPop(maxHeap);
        TestPop(maxHeap);
        TestPop(maxHeap);

        /* Get heap size */
        int size = maxHeap.Count;
        Console.WriteLine($"Heap element count is {size}");

        /* Determine if heap is empty */
        bool isEmpty = maxHeap.Count == 0;
        Console.WriteLine($"Is the heap empty {isEmpty}");

        /* Enter list and build heap */
        var list = new int[] { 1, 3, 2, 5, 4 };
        minHeap = new PriorityQueue<int, int>(list.Select(x => (x, x)));
        Console.WriteLine("After inputting the list and building a min-heap");
        PrintUtil.PrintHeap(minHeap);
    }
}
