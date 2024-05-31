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
    // Use list instead of array to avoid the need for resizing
    private List<Integer> maxHeap;

    /* Constructor, build heap based on input list */
    public MaxHeap(List<Integer> nums) {
        // Add all list elements into the heap
        maxHeap = new ArrayList<>(nums);
        // Heapify all nodes except leaves
        for (int i = parent(size() - 1); i >= 0; i--) {
            siftDown(i);
        }
    }

    /* Get index of left child node */
    private int left(int i) {
        return 2 * i + 1;
    }

    /* Get index of right child node */
    private int right(int i) {
        return 2 * i + 2;
    }

    /* Get index of parent node */
    private int parent(int i) {
        return (i - 1) / 2; // Integer division down
    }

    /* Swap elements */
    private void swap(int i, int j) {
        int tmp = maxHeap.get(i);
        maxHeap.set(i, maxHeap.get(j));
        maxHeap.set(j, tmp);
    }

    /* Get heap size */
    public int size() {
        return maxHeap.size();
    }

    /* Determine if heap is empty */
    public boolean isEmpty() {
        return size() == 0;
    }

    /* Access heap top element */
    public int peek() {
        return maxHeap.get(0);
    }

    /* Push the element into heap */
    public void push(int val) {
        // Add node
        maxHeap.add(val);
        // Heapify from bottom to top
        siftUp(size() - 1);
    }

    /* Start heapifying node i, from bottom to top */
    private void siftUp(int i) {
        while (true) {
            // Get parent node of node i
            int p = parent(i);
            // When "crossing the root node" or "node does not need repair", end heapification
            if (p < 0 || maxHeap.get(i) <= maxHeap.get(p))
                break;
            // Swap two nodes
            swap(i, p);
            // Loop upwards heapification
            i = p;
        }
    }

    /* Element exits heap */
    public int pop() {
        // Empty handling
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        // Swap the root node with the rightmost leaf node (swap the first element with the last element)
        swap(0, size() - 1);
        // Remove node
        int val = maxHeap.remove(size() - 1);
        // Heapify from top to bottom
        siftDown(0);
        // Return heap top element
        return val;
    }

    /* Start heapifying node i, from top to bottom */
    private void siftDown(int i) {
        while (true) {
            // Determine the largest node among i, l, r, noted as ma
            int l = left(i), r = right(i), ma = i;
            if (l < size() && maxHeap.get(l) > maxHeap.get(ma))
                ma = l;
            if (r < size() && maxHeap.get(r) > maxHeap.get(ma))
                ma = r;
            // If node i is the largest or indices l, r are out of bounds, no further heapification needed, break
            if (ma == i)
                break;
            // Swap two nodes
            swap(i, ma);
            // Loop downwards heapification
            i = ma;
        }
    }

    /* Print heap (binary tree) */
    public void print() {
        Queue<Integer> queue = new PriorityQueue<>((a, b) -> { return b - a; });
        queue.addAll(maxHeap);
        PrintUtil.printHeap(queue);
    }
}

public class my_heap {
    public static void main(String[] args) {
        /* Initialize max-heap */
        MaxHeap maxHeap = new MaxHeap(Arrays.asList(9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2));
        System.out.println("\nEnter list and build heap");
        maxHeap.print();

        /* Access heap top element */
        int peek = maxHeap.peek();
        System.out.format("\nTop element of the heap is %d\n", peek);

        /* Push the element into heap */
        int val = 7;
        maxHeap.push(val);
        System.out.format("\nAfter element %d is added to the heap\n", val);
        maxHeap.print();

        /* Pop the element at the heap top */
        peek = maxHeap.pop();
        System.out.format("\nAfter the top element %d is removed from the heap\n", peek);
        maxHeap.print();

        /* Get heap size */
        int size = maxHeap.size();
        System.out.format("\nNumber of elements in the heap is %d\n", size);

        /* Determine if heap is empty */
        boolean isEmpty = maxHeap.isEmpty();
        System.out.format("\nIs the heap empty %b\n", isEmpty);
    }
}
