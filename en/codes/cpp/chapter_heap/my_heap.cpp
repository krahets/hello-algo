/**
 * File: my_heap.cpp
 * Created Time: 2023-02-04
 * Author: LoneRanger (836253168@qq.com), what-is-me (whatisme@outlook.jp)
 */

#include "../utils/common.hpp"

/* Max-heap */
class MaxHeap {
  private:
    // Use a dynamic array so it can grow as needed
    vector<int> maxHeap;

    /* Get the left child index */
    int left(int i) {
        return 2 * i + 1;
    }

    /* Get the right child index */
    int right(int i) {
        return 2 * i + 2;
    }

    /* Get the parent index */
    int parent(int i) {
        return (i - 1) / 2; // Floor division
    }

    /* Sift up from node i */
    void siftUp(int i) {
        while (true) {
            // Get the parent of node i
            int p = parent(i);
            // Stop sifting at the root or when the node already satisfies the heap property
            if (p < 0 || maxHeap[i] <= maxHeap[p])
                break;
            // Swap the two nodes
            swap(maxHeap[i], maxHeap[p]);
            // Continue sifting up
            i = p;
        }
    }

    /* Sift down from node i */
    void siftDown(int i) {
        while (true) {
            // Store the index of the largest of nodes i, l, and r in ma
            int l = left(i), r = right(i), ma = i;
            if (l < size() && maxHeap[l] > maxHeap[ma])
                ma = l;
            if (r < size() && maxHeap[r] > maxHeap[ma])
                ma = r;
            // Stop if i is already largest or both child indices l and r are out of bounds
            if (ma == i)
                break;
            swap(maxHeap[i], maxHeap[ma]);
            // Continue sifting down
            i = ma;
        }
    }

  public:
    /* Constructor: build a heap from the input list */
    MaxHeap(vector<int> nums) {
        // Copy the list elements into the heap in their original order
        maxHeap = nums;
        // Heapify all non-leaf nodes
        for (int i = parent(size() - 1); i >= 0; i--) {
            siftDown(i);
        }
    }

    /* Get the heap size */
    int size() {
        return maxHeap.size();
    }

    /* Check whether the heap is empty */
    bool isEmpty() {
        return size() == 0;
    }

    /* Peek at the root */
    int peek() {
        return maxHeap[0];
    }

    /* Push an element onto the heap */
    void push(int val) {
        // Add a node
        maxHeap.push_back(val);
        // Sift up
        siftUp(size() - 1);
    }

    /* Pop an element from the heap */
    void pop() {
        // Handle an empty heap
        if (isEmpty()) {
            throw out_of_range("Heap is empty");
        }
        // Swap the root and the rightmost leaf (the first and last elements)
        swap(maxHeap[0], maxHeap[size() - 1]);
        // Remove the node
        maxHeap.pop_back();
        // Sift down
        siftDown(0);
    }

    /* Print the heap as a binary tree*/
    void print() {
        cout << "Heap as an array:";
        printVector(maxHeap);
        cout << "Heap as a tree:" << endl;
        TreeNode *root = vectorToTree(maxHeap);
        printTree(root);
        freeMemoryTree(root);
    }
};

/* Driver code */
int main() {
    /* Initialize a max-heap */
    vector<int> vec{9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2};
    MaxHeap maxHeap(vec);
    cout << "\nHeap built from the input list:" << endl;
    maxHeap.print();

    /* Get the root element */
    int peek = maxHeap.peek();
    cout << "\nRoot element: " << peek << endl;

    /* Push an element onto the heap */
    int val = 7;
    maxHeap.push(val);
    cout << "\nElement " << val << " has been pushed" << endl;
    maxHeap.print();

    /* Pop the root */
    peek = maxHeap.peek();
    maxHeap.pop();
    cout << "\nRoot element " << peek << " has been popped" << endl;
    maxHeap.print();

    /* Get the heap size */
    int size = maxHeap.size();
    cout << "\nNumber of elements in the heap: " << size << endl;

    /* Check whether the heap is empty */
    bool isEmpty = maxHeap.isEmpty();
    cout << "\nIs the heap empty? " << isEmpty << endl;

    return 0;
}
