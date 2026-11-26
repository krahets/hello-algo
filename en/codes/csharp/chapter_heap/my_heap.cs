/**
 * File: my_heap.cs
 * Created Time: 2023-02-06
 * Author: zjkung1123 (zjkung1123@gmail.com)
 */

namespace hello_algo.chapter_heap;

/* Max-heap */
class MaxHeap {
    // Use a list instead of an array so it can grow as needed
    List<int> maxHeap;

    /* Constructor: create an empty heap */
    public MaxHeap() {
        maxHeap = [];
    }

    /* Constructor: build a heap from the input list */
    public MaxHeap(IEnumerable<int> nums) {
        // Copy the list elements into the heap in their original order
        maxHeap = new List<int>(nums);
        // Heapify all non-leaf nodes
        var size = Parent(this.Size() - 1);
        for (int i = size; i >= 0; i--) {
            SiftDown(i);
        }
    }

    /* Get the left child index */
    int Left(int i) {
        return 2 * i + 1;
    }

    /* Get the right child index */
    int Right(int i) {
        return 2 * i + 2;
    }

    /* Get the parent index */
    int Parent(int i) {
        return (i - 1) / 2; // Floor division
    }

    /* Peek at the root */
    public int Peek() {
        return maxHeap[0];
    }

    /* Push an element onto the heap */
    public void Push(int val) {
        // Add a node
        maxHeap.Add(val);
        // Sift up
        SiftUp(Size() - 1);
    }

    /* Get the heap size */
    public int Size() {
        return maxHeap.Count;
    }

    /* Check whether the heap is empty */
    public bool IsEmpty() {
        return Size() == 0;
    }

    /* Sift up from node i */
    void SiftUp(int i) {
        while (true) {
            // Get the parent of node i
            int p = Parent(i);
            // Stop sifting at the root or when the node already satisfies the heap property
            if (p < 0 || maxHeap[i] <= maxHeap[p])
                break;
            // Swap the two nodes
            Swap(i, p);
            // Continue sifting up
            i = p;
        }
    }

    /* Pop an element from the heap */
    public int Pop() {
        // Handle an empty heap
        if (IsEmpty())
            throw new IndexOutOfRangeException();
        // Swap the root and the rightmost leaf (the first and last elements)
        Swap(0, Size() - 1);
        // Remove the node
        int val = maxHeap.Last();
        maxHeap.RemoveAt(Size() - 1);
        // Sift down
        SiftDown(0);
        // Return the root element
        return val;
    }

    /* Sift down from node i */
    void SiftDown(int i) {
        while (true) {
            // Store the index of the largest of nodes i, l, and r in ma
            int l = Left(i), r = Right(i), ma = i;
            if (l < Size() && maxHeap[l] > maxHeap[ma])
                ma = l;
            if (r < Size() && maxHeap[r] > maxHeap[ma])
                ma = r;
            // Stop sifting if node i is largest or there are no children below it
            if (ma == i) break;
            // Swap the two nodes
            Swap(i, ma);
            // Continue sifting down
            i = ma;
        }
    }

    /* Swap elements */
    void Swap(int i, int p) {
        (maxHeap[i], maxHeap[p]) = (maxHeap[p], maxHeap[i]);
    }

    /* Print the heap as a binary tree */
    public void Print() {
        var queue = new Queue<int>(maxHeap);
        PrintUtil.PrintHeap(queue);
    }
}

public class my_heap {
    [Test]
    public void Test() {
        /* Initialize a max-heap */
        MaxHeap maxHeap = new([9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2]);
        Console.WriteLine("\nHeap built from the input list:");
        maxHeap.Print();

        /* Get the root element */
        int peek = maxHeap.Peek();
        Console.WriteLine($"Root element: {peek}");

        /* Push an element onto the heap */
        int val = 7;
        maxHeap.Push(val);
        Console.WriteLine($"Heap after pushing {val}:");
        maxHeap.Print();

        /* Pop the root */
        peek = maxHeap.Pop();
        Console.WriteLine($"Heap after popping the root ({peek}):");
        maxHeap.Print();

        /* Get the heap size */
        int size = maxHeap.Size();
        Console.WriteLine($"Number of elements in the heap: {size}");

        /* Check whether the heap is empty */
        bool isEmpty = maxHeap.IsEmpty();
        Console.WriteLine($"Is the heap empty? {isEmpty}");
    }
}
