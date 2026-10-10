/**
 * File: top_k.cpp
 * Created Time: 2023-06-12
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Find the largest k elements in array based on heap */
priority_queue<int, vector<int>, greater<int>> topKHeap(vector<int> &nums, int k) {
    // Python's heapq module implements min heap by default
    priority_queue<int, vector<int>, greater<int>> heap;
    // Enter the first k elements of array into heap
    for (int i = 0; i < k; i++) {
        heap.push(nums[i]);
    }
    // Starting from the (k+1)th element, maintain heap length as k
    for (int i = k; i < nums.size(); i++) {
        // If current element is greater than top element, top element exits heap, current element enters heap
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
    cout << "The largest " << k << " elements are: ";
    printHeap(res);

    return 0;
}
