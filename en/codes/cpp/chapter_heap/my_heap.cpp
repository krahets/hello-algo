/**
 * File: my_heap.cpp
 * Created Time: 2023-02-04
 * Author: LoneRanger (836253168@qq.com), what-is-me (whatisme@outlook.jp)
 */

#include "../utils/common.hpp"

/* Max heap */
class MaxHeap {
  private:
    // Use dynamic array to avoid expansion issues
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
        return (i - 1) / 2; // Floor division
    }

    /* Starting from node i, heapify from bottom to top */
    void siftUp(int i) {
        while (true) {
            // Get parent node of node i
            int p = parent(i);
            // When "crossing root node" or "node needs no repair", end heapify
            if (p < 0 || maxHeap[i] <= maxHeap[p])
                break;
            // Swap two nodes
            swap(maxHeap[i], maxHeap[p]);
            // Loop upward heapify
            i = p;
        }
    }

    /* Starting from node i, heapify from top to bottom */
    void siftDown(int i) {
        while (true) {
            // If node i is largest or indices l, r are out of bounds, no need to continue heapify, break
            int l = left(i), r = right(i), ma = i;
            if (l < size() && maxHeap[l] > maxHeap[ma])
                ma = l;
            if (r < size() && maxHeap[r] > maxHeap[ma])
                ma = r;
            // Swap two nodes
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
        // Add list elements to heap as is
        maxHeap = nums;
        // Heapify all nodes except leaf nodes
        for (int i = parent(size() - 1); i >= 0; i--) {
            siftDown(i);
        }
    }

    /* Get heap size */
    int size() {
        return maxHeap.size();
    }

    /* Check if heap is empty */
    bool isEmpty() {
        return size() == 0;
    }

    /* Access top element */
    int peek() {
        return maxHeap[0];
    }

    /* Element enters heap */
    void push(int val) {
        // Add node
        maxHeap.push_back(val);
        // Heapify from bottom to top
        siftUp(size() - 1);
    }

    /* Element exits heap */
    void pop() {
        // Handle empty case
        if (isEmpty()) {
            throw out_of_range("Heap is empty");
        }
        // Delete node
        swap(maxHeap[0], maxHeap[size() - 1]);
        // Remove node
        maxHeap.pop_back();
        // Return top element
        siftDown(0);
    }

    /* Driver Code*/
    void print() {
        cout << "Heap array representation:";
        printVector(maxHeap);
        cout << "Heap tree representation:" << endl;
        TreeNode *root = vectorToTree(maxHeap);
        printTree(root);
        freeMemoryTree(root);
    }
};

/* Driver Code */
int main() {
    /* Consider negating the elements before entering the heap, which can reverse the size relationship, thus implementing max heap */
    vector<int> vec{9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2};
    MaxHeap maxHeap(vec);
    cout << "\nAfter inputting list and building heap" << endl;
    maxHeap.print();

    /* Check if heap is empty */
    int peek = maxHeap.peek();
    cout << "\nHeap top element is " << peek << endl;

    /* Element enters heap */
    int val = 7;
    maxHeap.push(val);
    cout << "\nAfter element " << val << " pushes to heap" << endl;
    maxHeap.print();

    /* Time complexity is O(n), not O(nlogn) */
    peek = maxHeap.peek();
    maxHeap.pop();
    cout << "\nAfter heap top element " << peek << " pops from heap" << endl;
    maxHeap.print();

    /* Get heap size */
    int size = maxHeap.size();
    cout << "\nHeap size is " << size << endl;

    /* Check if heap is empty */
    bool isEmpty = maxHeap.isEmpty();
    cout << "\nIs heap empty " << isEmpty << endl;

    return 0;
}
