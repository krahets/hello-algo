/**
 * File: heap.cpp
 * Created Time: 2023-01-19
 * Author: LoneRanger(836253168@qq.com)
 */

#include "../utils/common.hpp"

void testPush(priority_queue<int> &heap, int val) {
    heap.push(val); // Push an element onto the heap
    cout << "\nAfter pushing element " << val << " onto the heap:" << endl;
    printHeap(heap);
}

void testPop(priority_queue<int> &heap) {
    int val = heap.top();
    heap.pop();
    cout << "\nAfter popping top element " << val << " from the heap:" << endl;
    printHeap(heap);
}

/* Driver code */
int main() {
    /* Initialize the heap */
    // Initialize a min heap
    // priority_queue<int, vector<int>, greater<int>> minHeap;
    // Initialize a max heap
    priority_queue<int, vector<int>, less<int>> maxHeap;

    cout << "\nThe following example uses a max heap" << endl;

    /* Push an element onto the heap */
    testPush(maxHeap, 1);
    testPush(maxHeap, 3);
    testPush(maxHeap, 2);
    testPush(maxHeap, 5);
    testPush(maxHeap, 4);

    /* Get the top element of the heap */
    int peek = maxHeap.top();
    cout << "\nTop element of the heap: " << peek << endl;

    /* Pop the top element from the heap */
    testPop(maxHeap);
    testPop(maxHeap);
    testPop(maxHeap);
    testPop(maxHeap);
    testPop(maxHeap);

    /* Get the heap size */
    int size = maxHeap.size();
    cout << "\nNumber of elements in the heap: " << size << endl;

    /* Check whether the heap is empty */
    bool isEmpty = maxHeap.empty();
    cout << "\nIs the heap empty: " << isEmpty << endl;

    /* Build a heap from an input list */
    // The time complexity is O(n), not O(nlogn)
    vector<int> input{1, 3, 2, 5, 4};
    priority_queue<int, vector<int>, greater<int>> minHeap(input.begin(), input.end());
    cout << "After building a min heap from the input list:" << endl;
    printHeap(minHeap);

    return 0;
}
