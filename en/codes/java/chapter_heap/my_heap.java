/**
 * File: my_heap.java
 * Created Time: 2023-01-07
 * Author: krahets (krahets@163.com)
 */

package chapter_heap;

import utils.*;
import java.util.*;

/* Max heap */
class MaxHeap {
    // Use list instead of array, no need to consider capacity expansion
    private List<Integer> maxHeap;

    /* Constructor, build heap based on input list */
    public MaxHeap(List<Integer> nums) {
        // Add list elements to heap as is
        maxHeap = new ArrayList<>(nums);
        // Heapify all nodes except leaf nodes
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
        return (i - 1) / 2; // Floor division
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

    /* Check if heap is empty */
    public boolean isEmpty() {
        return size() == 0;
    }

    /* Access top element */
    public int peek() {
        return maxHeap.get(0);
    }

    /* Element enters heap */
    public void push(int val) {
        // Add node
        maxHeap.add(val);
        // Heapify from bottom to top
        siftUp(size() - 1);
    }

    /* Starting from node i, heapify from bottom to top */
    private void siftUp(int i) {
        while (true) {
            // Get parent node of node i
            int p = parent(i);
            // When "crossing root node" or "node needs no repair", end heapify
            if (p < 0 || maxHeap.get(i) <= maxHeap.get(p))
                break;
            // Swap two nodes
            swap(i, p);
            // Loop upward heapify
            i = p;
        }
    }

    /* Element exits heap */
    public int pop() {
        // Handle empty case
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        // Delete node
        swap(0, size() - 1);
        // Remove node
        int val = maxHeap.remove(size() - 1);
        // Return top element
        siftDown(0);
        // Return heap top element
        return val;
    }

    /* Starting from node i, heapify from top to bottom */
    private void siftDown(int i) {
        while (true) {
            // If node i is largest or indices l, r are out of bounds, no need to continue heapify, break
            int l = left(i), r = right(i), ma = i;
            if (l < size() && maxHeap.get(l) > maxHeap.get(ma))
                ma = l;
            if (r < size() && maxHeap.get(r) > maxHeap.get(ma))
                ma = r;
            // Swap two nodes
            if (ma == i)
                break;
            // Swap two nodes
            swap(i, ma);
            // Loop downwards heapification
            i = ma;
        }
    }

    /* Driver Code */
    public void print() {
        Queue<Integer> queue = new PriorityQueue<>((a, b) -> { return b - a; });
        queue.addAll(maxHeap);
        PrintUtil.printHeap(queue);
    }
}

public class my_heap {
    public static void main(String[] args) {
        /* Consider negating the elements before entering the heap, which can reverse the size relationship, thus implementing max heap */
        MaxHeap maxHeap = new MaxHeap(Arrays.asList(9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2));
        System.out.println("\nAfter inputting list and building heap");
        maxHeap.print();

        /* Check if heap is empty */
        int peek = maxHeap.peek();
        System.out.format("\nHeap top element is %d\n", peek);

        /* Element enters heap */
        int val = 7;
        maxHeap.push(val);
        System.out.format("\nAfter element %d enters heap\n", val);
        maxHeap.print();

        /* Time complexity is O(n), not O(nlogn) */
        peek = maxHeap.pop();
        System.out.format("\nAfter heap top element %d exits heap\n", peek);
        maxHeap.print();

        /* Get heap size */
        int size = maxHeap.size();
        System.out.format("\nHeap element count is %d\n", size);

        /* Check if heap is empty */
        boolean isEmpty = maxHeap.isEmpty();
        System.out.format("\nHeap is empty %b\n", isEmpty);
    }
}
