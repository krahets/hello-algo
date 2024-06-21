/**
 * File: my_heap.cpp
 * Created Time: 2023-02-04
 * Author: LoneRanger (836253168@qq.com), what-is-me (whatisme@outlook.jp)
 */

#include "../utils/common.hpp"

/* Max-heap */
class MaxHeap {
  private:
    // Using a dynamic array to avoid the need for resizing
    vector<int> maxHeap;

    /* Get index of left child node */
    int left(int i) {
        return 2 * i + 1;
    }

    /* Get index of right child node */
    int right(int i) {
        return 2 * i + 2;
    }

    /* Get index of parent node */
    int parent(int i) {
        return (i - 1) / 2; // Integer division down
    }

    /* Start heapifying node i, from bottom to top */
    void siftUp(int i) {
        while (true) {
            // Get parent node of node i
            int p = parent(i);
            // When "crossing the root node" or "node does not need repair", end heapification
            if (p < 0 || maxHeap[i] <= maxHeap[p])
                break;
            // Swap two nodes
            swap(maxHeap[i], maxHeap[p]);
            // Loop upwards heapification
            i = p;
        }
    }

    /* Start heapifying node i, from top to bottom */
    void siftDown(int i) {
        while (true) {
            // Determine the largest node among i, l, r, noted as ma
            int l = left(i), r = right(i), ma = i;
            if (l < size() && maxHeap[l] > maxHeap[ma])
                ma = l;
            if (r < size() && maxHeap[r] > maxHeap[ma])
                ma = r;
            // If node i is the largest or indices l, r are out of bounds, no further heapification needed, break
            if (ma == i)
                break;
            swap(maxHeap[i], maxHeap[ma]);
            // Loop downwards heapification
            i = ma;
        }
    }

  public:
    /* Constructor, build heap based on input list */
    MaxHeap(vector<int> nums) {
        // Add all list elements into the heap
        maxHeap = nums;
        // Heapify all nodes except leaves
        for (int i = parent(size() - 1); i >= 0; i--) {
            siftDown(i);
        }
    }

    /* Get heap size */
    int size() {
        return maxHeap.size();
    }

    /* Determine if heap is empty */
    bool isEmpty() {
        return size() == 0;
    }

    /* Access heap top element */
    int peek() {
        return maxHeap[0];
    }

    /* Push the element into heap */
    void push(int val) {
        // Add node
        maxHeap.push_back(val);
        // Heapify from bottom to top
        siftUp(size() - 1);
    }

    /* Element exits heap */
    void pop() {
        // Empty handling
        if (isEmpty()) {
            throw out_of_range("Heap is empty");
        }
        // Swap the root node with the rightmost leaf node (swap the first element with the last element)
        swap(maxHeap[0], maxHeap[size() - 1]);
        // Remove node
        maxHeap.pop_back();
        // Heapify from top to bottom
        siftDown(0);
    }

    /* Print heap (binary tree)*/
    void print() {
        cout << "Array representation of the heap:";
        printVector(maxHeap);
        cout << "Tree representation of the heap:" << endl;
        TreeNode *root = vectorToTree(maxHeap);
        printTree(root);
        freeMemoryTree(root);
    }
};

/* Driver Code */
int main() {
    /* Initialize max-heap */
    vector<int> vec{9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2};
    MaxHeap maxHeap(vec);
    cout << "\nEnter list and build heap" << endl;
    maxHeap.print();

    /* Access heap top element */
    int peek = maxHeap.peek();
    cout << "\nTop element of the heap is " << peek << endl;

    /* Push the element into heap */
    int val = 7;
    maxHeap.push(val);
    cout << "\nAfter element " << val << " is added to the heap" << endl;
    maxHeap.print();

    /* Pop the element at the heap top */
    peek = maxHeap.peek();
    maxHeap.pop();
    cout << "\nAfter the top element " << peek << " is removed from the heap" << endl;
    maxHeap.print();

    /* Get heap size */
    int size = maxHeap.size();
    cout << "\nNumber of elements in the heap is " << size << endl;

    /* Determine if heap is empty */
    bool isEmpty = maxHeap.isEmpty();
    cout << "\nIs the heap empty " << isEmpty << endl;

    return 0;
}
