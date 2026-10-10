/**
 * File: my_heap.cs
 * Created Time: 2023-02-06
 * Author: zjkung1123 (zjkung1123@gmail.com)
 */

namespace hello_algo.chapter_heap;

/* Max heap */
class MaxHeap {
    // Use list instead of array, no need to consider capacity expansion
    List<int> maxHeap;

    /* Constructor, build empty heap */
    public MaxHeap() {
        maxHeap = [];
    }

    /* Constructor, build heap from input list */
    public MaxHeap(IEnumerable<int> nums) {
        // Add list elements to heap as is
        maxHeap = new List<int>(nums);
        // Heapify all nodes except leaf nodes
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
        return (i - 1) / 2; // Floor division
    }

    /* Access top element */
    public int Peek() {
        return maxHeap[0];
    }

    /* Element enters heap */
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

    /* Check if heap is empty */
    public bool IsEmpty() {
        return Size() == 0;
    }

    /* Starting from node i, heapify from bottom to top */
    void SiftUp(int i) {
        while (true) {
            // Get parent node of node i
            int p = Parent(i);
            // If 'past root node' or 'node needs no repair', end heapify
            if (p < 0 || maxHeap[i] <= maxHeap[p])
                break;
            // Swap two nodes
            Swap(i, p);
            // Loop upward heapify
            i = p;
        }
    }

    /* Element exits heap */
    public int Pop() {
        // Handle empty case
        if (IsEmpty())
            throw new IndexOutOfRangeException();
        // Delete node
        Swap(0, Size() - 1);
        // Remove node
        int val = maxHeap.Last();
        maxHeap.RemoveAt(Size() - 1);
        // Return top element
        SiftDown(0);
        // Return heap top element
        return val;
    }

    /* Starting from node i, heapify from top to bottom */
    void SiftDown(int i) {
        while (true) {
            // If node i is largest or indices l, r are out of bounds, no need to continue heapify, break
            int l = Left(i), r = Right(i), ma = i;
            if (l < Size() && maxHeap[l] > maxHeap[ma])
                ma = l;
            if (r < Size() && maxHeap[r] > maxHeap[ma])
                ma = r;
            // If 'node i is largest' or 'past leaf node', end heapify
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

    /* Driver Code */
    public void Print() {
        var queue = new Queue<int>(maxHeap);
        PrintUtil.PrintHeap(queue);
    }
}

public class my_heap {
    [Test]
    public void Test() {
        /* Consider negating the elements before entering the heap, which can reverse the size relationship, thus implementing max heap */
        MaxHeap maxHeap = new([9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2]);
        Console.WriteLine("\nAfter inputting list and building heap");
        maxHeap.Print();

        /* Check if heap is empty */
        int peek = maxHeap.Peek();
        Console.WriteLine($"Heap top element is {peek}");

        /* Element enters heap */
        int val = 7;
        maxHeap.Push(val);
        Console.WriteLine($"After element {val} pushes to heap");
        maxHeap.Print();

        /* Time complexity is O(n), not O(nlogn) */
        peek = maxHeap.Pop();
        Console.WriteLine($"After heap top element {peek} pops from heap");
        maxHeap.Print();

        /* Get heap size */
        int size = maxHeap.Size();
        Console.WriteLine($"Heap size is {size}");

        /* Check if heap is empty */
        bool isEmpty = maxHeap.IsEmpty();
        Console.WriteLine($"Is heap empty {isEmpty}");
    }
}
