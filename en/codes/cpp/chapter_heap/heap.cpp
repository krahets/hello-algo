/**
 * File: heap.cpp
 * Created Time: 2023-01-19
 * Author: LoneRanger(836253168@qq.com)
 */

#include "../utils/common.hpp"

/* Driver code */
int main() {
    // [region]{init}
    /* Initialize the heap */
    // Initialize a min heap
    priority_queue<int, vector<int>, greater<int>> minHeap;
    // Initialize a max heap
    priority_queue<int, vector<int>, less<int>> maxHeap;
    // [endregion]{init}

    cout << "\nThe following example uses a max heap" << endl;

    // [region]{push}
    /* Push an element onto the heap */
    maxHeap.push(1);
    maxHeap.push(3);
    maxHeap.push(2);
    maxHeap.push(5);
    maxHeap.push(4);
    // [endregion]{push}
    printHeap(maxHeap);

    // [region]{peek}
    /* Get the top element of the heap */
    int peek = maxHeap.top(); // 5
    // [endregion]{peek}
    cout << "\nTop element of the heap: " << peek << endl;

    cout << "\nElement popped from the heap: " << maxHeap.top() << endl;
    // [region]{pop_1}
    /* Pop the top element from the heap */
    // The elements are popped in descending order
    maxHeap.pop(); // 5
    // [endregion]{pop_1}
    printHeap(maxHeap);
    cout << "\nElement popped from the heap: " << maxHeap.top() << endl;
    // [region]{pop_2}
    maxHeap.pop(); // 4
    // [endregion]{pop_2}
    printHeap(maxHeap);
    cout << "\nElement popped from the heap: " << maxHeap.top() << endl;
    // [region]{pop_3}
    maxHeap.pop(); // 3
    // [endregion]{pop_3}
    printHeap(maxHeap);
    cout << "\nElement popped from the heap: " << maxHeap.top() << endl;
    // [region]{pop_4}
    maxHeap.pop(); // 2
    // [endregion]{pop_4}
    printHeap(maxHeap);
    cout << "\nElement popped from the heap: " << maxHeap.top() << endl;
    // [region]{pop_5}
    maxHeap.pop(); // 1
    // [endregion]{pop_5}
    printHeap(maxHeap);

    // [region]{size}
    /* Get the heap size */
    int size = maxHeap.size();
    // [endregion]{size}
    cout << "\nNumber of elements in the heap: " << size << endl;

    // [region]{is_empty}
    /* Check whether the heap is empty */
    bool isEmpty = maxHeap.empty();
    // [endregion]{is_empty}
    cout << "\nIs the heap empty: " << isEmpty << endl;

    // [region]{heapify}
    /* Build a heap from an input list */
    // The time complexity is O(n), not O(nlogn)
    vector<int> input{1, 3, 2, 5, 4};
    minHeap = priority_queue<int, vector<int>, greater<int>>(input.begin(), input.end());
    // [endregion]{heapify}
    cout << "After building a min heap from the input list:" << endl;
    printHeap(minHeap);

    return 0;
}
