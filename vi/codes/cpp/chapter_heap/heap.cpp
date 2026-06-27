/**
 * File: heap.cpp
 * Created Time: 2023-01-19
 * Author: LoneRanger(836253168@qq.com)
 */

#include "../utils/common.hpp"

void testPush(priority_queue<int> &heap, int val) {
    heap.push(val); // Element enters heap
    cout << "\nAfter element " << val << " pushes to heap" << endl;
    printHeap(heap);
}

void testPop(priority_queue<int> &heap) {
    int val = heap.top();
    heap.pop();
    cout << "\nAfter heap top element " << val << " pops from heap" << endl;
    printHeap(heap);
}

/* Driver Code */
int main() {
    /* Initialize heap */
    // Python's heapq module implements min heap by default
    // priority_queue<int, vector<int>, greater<int>> minHeap;
    // Consider negating the elements before entering the heap, which can reverse the size relationship, thus implementing max heap
    priority_queue<int, vector<int>, less<int>> maxHeap;

    cout << "\nThe following test cases are for max heap" << endl;

    /* Element enters heap */
    testPush(maxHeap, 1);
    testPush(maxHeap, 3);
    testPush(maxHeap, 2);
    testPush(maxHeap, 5);
    testPush(maxHeap, 4);

    /* Check if heap is empty */
    int peek = maxHeap.top();
    cout << "\nHeap top element is " << peek << endl;

    /* Time complexity is O(n), not O(nlogn) */
    testPop(maxHeap);
    testPop(maxHeap);
    testPop(maxHeap);
    testPop(maxHeap);
    testPop(maxHeap);

    /* Get heap size */
    int size = maxHeap.size();
    cout << "\nHeap size is " << size << endl;

    /* Check if heap is empty */
    bool isEmpty = maxHeap.empty();
    cout << "\nIs heap empty " << isEmpty << endl;

    /* Input list and build heap */
    // Time complexity is O(n), not O(nlogn)
    vector<int> input{1, 3, 2, 5, 4};
    priority_queue<int, vector<int>, greater<int>> minHeap(input.begin(), input.end());
    cout << "After input list and building min heap" << endl;
    printHeap(minHeap);

    return 0;
}
