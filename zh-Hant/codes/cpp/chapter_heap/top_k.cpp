/**
 * File: top_k.cpp
 * Created Time: 2023-06-12
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 基於堆積查詢陣列中最大的 k 個元素 */
priority_queue<int, vector<int>, greater<int>> topKHeap(vector<int> &nums, int k) {
    // 初始化小頂堆積
    priority_queue<int, vector<int>, greater<int>> heap;
    // 將陣列的前 k 個元素入堆積
    for (int i = 0; i < k; i++) {
        heap.push(nums[i]);
    }
    // 從第 k+1 個元素開始，保持堆積的長度為 k
    for (int i = k; i < nums.size(); i++) {
        // 若當前元素大於堆積頂元素，則將堆積頂元素出堆積、當前元素入堆積
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
    cout << "最大的 " << k << " 個元素為: ";
    printHeap(res);

    return 0;
}
