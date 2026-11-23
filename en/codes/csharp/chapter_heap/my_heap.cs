/**
 * File: my_heap.cs
 * Created Time: 2023-02-06
 * Author: zjkung1123 (zjkung1123@gmail.com)
 */

namespace hello_algo.chapter_heap;

/* Max heap */
class MaxHeap {
    // Use a resizable list instead of an array to avoid managing capacity growth
    List<int> maxHeap;

    /* Constructor: create an empty heap */
    public MaxHeap() {
        maxHeap = [];
    }

    /* Constructor: build a heap from an input list */
    public MaxHeap(IEnumerable<int> nums) {
        // Place the list elements in the heap without changing their order
        maxHeap = new List<int>(nums);
        // Sift down from every non-leaf node
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
        return (i - 1) / 2; // Integer division (truncates toward zero in C#)
    }

    /* Access the top element of the heap */
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

    /* Sift up starting from node i */
    void SiftUp(int i) {
        while (true) {
            // Get the parent of node i
            int p = Parent(i);
            // Stop sifting if the root has been passed or the node needs no adjustment
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
        // Swap the root with the rightmost leaf on the last level (swap the first and last elements)
        Swap(0, Size() - 1);
        // Remove a node
        int val = maxHeap.Last();
        maxHeap.RemoveAt(Size() - 1);
        // Sift down
        SiftDown(0);
        // Return the top element of the heap
        return val;
    }

    /* Sift down starting from node i */
    void SiftDown(int i) {
        while (true) {
            // Find the node with the largest value among i, l, and r, and store its index in ma
            int l = Left(i), r = Right(i), ma = i;
            if (l < Size() && maxHeap[l] > maxHeap[ma])
                ma = l;
            if (r < Size() && maxHeap[r] > maxHeap[ma])
                ma = r;
            // Stop sifting if node i has the largest value or has no children
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

    /* Print the heap (binary tree) */
    public void Print() {
        var queue = new Queue<int>(maxHeap);
        PrintUtil.PrintHeap(queue);
    }
}

public class my_heap {
    [Test]
    public void Test() {
        /* Initialize a max heap */
        MaxHeap maxHeap = new([9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2]);
        Console.WriteLine("\nAfter building a heap from the input list:");
        maxHeap.Print();

        /* Get the top element of the heap */
        int peek = maxHeap.Peek();
        Console.WriteLine($"Top element of the heap: {peek}");

        /* Push an element onto the heap */
        int val = 7;
        maxHeap.Push(val);
        Console.WriteLine($"After pushing {val} onto the heap:");
        maxHeap.Print();

        /* Pop the top element from the heap */
        peek = maxHeap.Pop();
        Console.WriteLine($"After popping the top element {peek} from the heap:");
        maxHeap.Print();

        /* Get the heap size */
        int size = maxHeap.Size();
        Console.WriteLine($"Number of elements in the heap: {size}");

        /* Check whether the heap is empty */
        bool isEmpty = maxHeap.IsEmpty();
        Console.WriteLine($"Is the heap empty? {isEmpty}");
    }
}
