/**
 * File: top_k.cpp
 * Created Time: 2023-06-12
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Find the k largest elements in the array using a heap */
priority_queue<int, vector<int>, greater<int>> topKHeap(vector<int> &nums, int k) {
    // Initialize a min-heap
    priority_queue<int, vector<int>, greater<int>> heap;
    // Push the first k array elements onto the heap
    for (int i = 0; i < k; i++) {
        heap.push(nums[i]);
    }
    // Starting with element k+1, keep the heap size at k
    for (int i = k; i < nums.size(); i++) {
        // If the current element exceeds the root, pop the root and push the current element
        if (nums[i] > heap.top()) {
            heap.pop();
            heap.push(nums[i]);
        }
    }
    return heap;
}

// Driver code
int main() {
    vector<int> nums = {1, 7, 6, 3, 2};
    int k = 3;

    priority_queue<int, vector<int>, greater<int>> res = topKHeap(nums, k);
    cout << "The top " << k << " elements are: ";
    printHeap(res);

    return 0;
}
