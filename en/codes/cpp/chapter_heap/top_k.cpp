/**
 * File: top_k.cpp
 * Created Time: 2023-06-12
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Using heap to find the largest k elements in an array */
priority_queue<int, vector<int>, greater<int>> topKHeap(vector<int> &nums, int k) {
    // Initialize min-heap
    priority_queue<int, vector<int>, greater<int>> heap;
    // Enter the first k elements of the array into the heap
    for (int i = 0; i < k; i++) {
        heap.push(nums[i]);
    }
    // From the k+1th element, keep the heap length as k
    for (int i = k; i < nums.size(); i++) {
        // If the current element is larger than the heap top element, remove the heap top element and enter the current element into the heap
        if (nums[i] > heap.top()) {
            heap.pop();
            heap.push(nums[i]);
        }
    }
    return heap;
}

// Driver Code
int main() {
    vector<int> nums = {1, 7, 6, 3, 2};
    int k = 3;

    priority_queue<int, vector<int>, greater<int>> res = topKHeap(nums, k);
    cout << "The largest " << k << " elements are:";
    printHeap(res);

    return 0;
}
