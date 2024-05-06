/**
 * File: heap.cpp
 * Created Time: 2023-01-19
 * Author: LoneRanger(836253168@qq.com)
 */

#include "../utils/common.hpp"

void testPush(priority_queue<int> &heap, int val) {
    heap.push(val); // Push the element into heap
    cout << "\nAfter element " << val << " is added to the heap" << endl;
    printHeap(heap);
}

void testPop(priority_queue<int> &heap) {
    int val = heap.top();
    heap.pop();
    cout << "\nAfter the top element " << val << " is removed from the heap" << endl;
    printHeap(heap);
}

/* Driver Code */
int main() {
    /* Initialize the heap */
    // Initialize min-heap
    // priority_queue<int, vector<int>, greater<int>> minHeap;
    // Initialize max-heap
    priority_queue<int, vector<int>, less<int>> maxHeap;

    cout << "\nThe following test case is for max-heap" << endl;

    /* Push the element into heap */
    testPush(maxHeap, 1);
    testPush(maxHeap, 3);
    testPush(maxHeap, 2);
    testPush(maxHeap, 5);
    testPush(maxHeap, 4);

    /* Access heap top element */
    int peek = maxHeap.top();
    cout << "\nTop element of the heap is " << peek << endl;

    /* Pop the element at the heap top */
    testPop(maxHeap);
    testPop(maxHeap);
    testPop(maxHeap);
    testPop(maxHeap);
    testPop(maxHeap);

    /* Get heap size */
    int size = maxHeap.size();
    cout << "\nNumber of elements in the heap is " << size << endl;

    /* Determine if heap is empty */
    bool isEmpty = maxHeap.empty();
    cout << "\nIs the heap empty " << isEmpty << endl;

    /* Enter list and build heap */
    // Time complexity is O(n), not O(nlogn)
    vector<int> input{1, 3, 2, 5, 4};
    priority_queue<int, vector<int>, greater<int>> minHeap(input.begin(), input.end());
    cout << "After inputting the list and building a min-heap" << endl;
    printHeap(minHeap);

    return 0;
}
