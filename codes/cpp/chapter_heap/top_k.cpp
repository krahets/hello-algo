/**
 * File: top_k.cpp
 * Created Time: 2023-06-12
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 基于堆查找数组中最大的 k 个元素 */
priority_queue<int, vector<int>, greater<int>> topKHeap(vector<int> &nums, int k) {
    // 初始化小顶堆
    priority_queue<int, vector<int>, greater<int>> heap;
    // 将数组的前 k 个元素入堆
    for (int i = 0; i < k; i++) {
        heap.push(nums[i]);
    }
    // 从第 k+1 个元素开始，保持堆的长度为 k
    for (int i = k; i < nums.size(); i++) {
        // 若当前元素大于堆顶元素，则将堆顶元素出堆、当前元素入堆
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
    cout << "最大的 " << k << " 个元素为: ";
    printHeap(res);

    return 0;
}
