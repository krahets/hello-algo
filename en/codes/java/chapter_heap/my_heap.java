/**
 * File: my_heap.java
 * Created Time: 2023-01-07
 * Author: krahets (krahets@163.com)
 */

package chapter_heap;

import utils.*;
import java.util.*;

/* Max-heap */
class MaxHeap {
    // Use a list instead of an array so it can grow as needed
    private List<Integer> maxHeap;

    /* Constructor: build a heap from the input list */
    public MaxHeap(List<Integer> nums) {
        // Copy the list elements into the heap in their original order
        maxHeap = new ArrayList<>(nums);
        // Heapify all non-leaf nodes
        for (int i = parent(size() - 1); i >= 0; i--) {
            siftDown(i);
        }
    }

    /* Get the left child index */
    private int left(int i) {
        return 2 * i + 1;
    }

    /* Get the right child index */
    private int right(int i) {
        return 2 * i + 2;
    }

    /* Get the parent index */
    private int parent(int i) {
        return (i - 1) / 2; // Floor division
    }

    /* Swap elements */
    private void swap(int i, int j) {
        int tmp = maxHeap.get(i);
        maxHeap.set(i, maxHeap.get(j));
        maxHeap.set(j, tmp);
    }

    /* Get the heap size */
    public int size() {
        return maxHeap.size();
    }

    /* Check whether the heap is empty */
    public boolean isEmpty() {
        return size() == 0;
    }

    /* Peek at the root */
    public int peek() {
        return maxHeap.get(0);
    }

    /* Push an element onto the heap */
    public void push(int val) {
        // Add a node
        maxHeap.add(val);
        // Sift up
        siftUp(size() - 1);
    }

    /* Sift up from node i */
    private void siftUp(int i) {
        while (true) {
            // Get the parent of node i
            int p = parent(i);
            // Stop sifting at the root or when the node already satisfies the heap property
            if (p < 0 || maxHeap.get(i) <= maxHeap.get(p))
                break;
            // Swap the two nodes
            swap(i, p);
            // Continue sifting up
            i = p;
        }
    }

    /* Pop an element from the heap */
    public int pop() {
        // Handle an empty heap
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        // Swap the root and the rightmost leaf (the first and last elements)
        swap(0, size() - 1);
        // Remove the node
        int val = maxHeap.remove(size() - 1);
        // Sift down
        siftDown(0);
        // Return the root element
        return val;
    }

    /* Sift down from node i */
    private void siftDown(int i) {
        while (true) {
            // Store the index of the largest of nodes i, l, and r in ma
            int l = left(i), r = right(i), ma = i;
            if (l < size() && maxHeap.get(l) > maxHeap.get(ma))
                ma = l;
            if (r < size() && maxHeap.get(r) > maxHeap.get(ma))
                ma = r;
            // Stop if i is already largest or both child indices l and r are out of bounds
            if (ma == i)
                break;
            // Swap the two nodes
            swap(i, ma);
            // Continue sifting down
            i = ma;
        }
    }

    /* Print the heap as a binary tree */
    public void print() {
        Queue<Integer> queue = new PriorityQueue<>((a, b) -> { return b - a; });
        queue.addAll(maxHeap);
        PrintUtil.printHeap(queue);
    }
}

public class my_heap {
    public static void main(String[] args) {
        /* Initialize a max-heap */
        MaxHeap maxHeap = new MaxHeap(Arrays.asList(9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2));
        System.out.println("\nHeap built from the input list:");
        maxHeap.print();

        /* Get the root element */
        int peek = maxHeap.peek();
        System.out.format("\nRoot element: %d\n", peek);

        /* Push an element onto the heap */
        int val = 7;
        maxHeap.push(val);
        System.out.format("\nHeap after pushing %d:\n", val);
        maxHeap.print();

        /* Pop the root */
        peek = maxHeap.pop();
        System.out.format("\nHeap after popping the root (%d):\n", peek);
        maxHeap.print();

        /* Get the heap size */
        int size = maxHeap.size();
        System.out.format("\nNumber of elements in the heap: %d\n", size);

        /* Check whether the heap is empty */
        boolean isEmpty = maxHeap.isEmpty();
        System.out.format("\nIs the heap empty? %b\n", isEmpty);
    }
}
