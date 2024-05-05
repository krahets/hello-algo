/**
 * File: my_heap.cs
 * Created Time: 2023-02-06
 * Author: zjkung1123 (zjkung1123@gmail.com)
 */

namespace hello_algo.chapter_heap;

/* Max-heap */
class MaxHeap {
    // Use list instead of array to avoid the need for resizing
    List<int> maxHeap;

    /* Constructor, build an empty heap */
    public MaxHeap() {
        maxHeap = [];
    }

    /* Constructor, build a heap based on the input list */
    public MaxHeap(IEnumerable<int> nums) {
        // Add all list elements into the heap
        maxHeap = new List<int>(nums);
        // Heapify all nodes except leaves
        var size = Parent(this.Size() - 1);
        for (int i = size; i >= 0; i--) {
            SiftDown(i);
        }
    }

    /* Get index of left child node */
    int Left(int i) {
        return 2 * i + 1;
    }

    /* Get index of right child node */
    int Right(int i) {
        return 2 * i + 2;
    }

    /* Get index of parent node */
    int Parent(int i) {
        return (i - 1) / 2; // Integer division down
    }

    /* Access heap top element */
    public int Peek() {
        return maxHeap[0];
    }

    /* Push the element into heap */
    public void Push(int val) {
        // Add node
        maxHeap.Add(val);
        // Heapify from bottom to top
        SiftUp(Size() - 1);
    }

    /* Get heap size */
    public int Size() {
        return maxHeap.Count;
    }

    /* Determine if heap is empty */
    public bool IsEmpty() {
        return Size() == 0;
    }

    /* Start heapifying node i, from bottom to top */
    void SiftUp(int i) {
        while (true) {
            // Get parent node of node i
            int p = Parent(i);
            // If "passing the root node" or "no node needs fixing", then end heapification
            if (p < 0 || maxHeap[i] <= maxHeap[p])
                break;
            // Swap two nodes
            Swap(i, p);
            // Loop upwards heapification
            i = p;
        }
    }

    /* Element exits heap */
    public int Pop() {
        // Empty handling
        if (IsEmpty())
            throw new IndexOutOfRangeException();
        // Swap the root node with the rightmost leaf node (swap the first element with the last element)
        Swap(0, Size() - 1);
        // Remove node
        int val = maxHeap.Last();
        maxHeap.RemoveAt(Size() - 1);
        // Heapify from top to bottom
        SiftDown(0);
        // Return heap top element
        return val;
    }

    /* Start heapifying node i, from top to bottom */
    void SiftDown(int i) {
        while (true) {
            // Determine the largest node among i, l, r, noted as ma
            int l = Left(i), r = Right(i), ma = i;
            if (l < Size() && maxHeap[l] > maxHeap[ma])
                ma = l;
            if (r < Size() && maxHeap[r] > maxHeap[ma])
                ma = r;
            // If "node i is the largest" or "passing the leaf node", then end heapification
            if (ma == i) break;
            // Swap two nodes
            Swap(i, ma);
            // Loop downwards heapification
            i = ma;
        }
    }

    /* Swap elements */
    void Swap(int i, int p) {
        (maxHeap[i], maxHeap[p]) = (maxHeap[p], maxHeap[i]);
    }

    /* Print heap (binary tree) */
    public void Print() {
        var queue = new Queue<int>(maxHeap);
        PrintUtil.PrintHeap(queue);
    }
}

public class my_heap {
    [Test]
    public void Test() {
        /* Initialize max-heap */
        MaxHeap maxHeap = new([9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2]);
        Console.WriteLine("\nEnter list and build heap");
        maxHeap.Print();

        /* Access heap top element */
        int peek = maxHeap.Peek();
        Console.WriteLine($"The top element of the heap is {peek}");

        /* Push the element into heap */
        int val = 7;
        maxHeap.Push(val);
        Console.WriteLine($"Element {val} after being pushed to the heap");
        maxHeap.Print();

        /* Pop the element at the heap top */
        peek = maxHeap.Pop();
        Console.WriteLine($"The top element of the heap {peek} after being popped");
        maxHeap.Print();

        /* Get heap size */
        int size = maxHeap.Size();
        Console.WriteLine($"Heap element count is {size}");

        /* Determine if heap is empty */
        bool isEmpty = maxHeap.IsEmpty();
        Console.WriteLine($"Is the heap empty {isEmpty}");
    }
}
