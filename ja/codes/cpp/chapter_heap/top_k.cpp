/**
 * File: top_k.cpp
 * Created Time: 2023-06-12
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* ヒープに基づいて配列中の最大の k 個の要素を探す */
priority_queue<int, vector<int>, greater<int>> topKHeap(vector<int> &nums, int k) {
    // 最小ヒープを初期化
    priority_queue<int, vector<int>, greater<int>> heap;
    // 配列の先頭 k 個の要素をヒープに追加
    for (int i = 0; i < k; i++) {
        heap.push(nums[i]);
    }
    // k+1 番目の要素から開始し、ヒープ長を k に保つ
    for (int i = k; i < nums.size(); i++) {
        // 現在の要素がヒープ先頭より大きければ、ヒープ先頭を取り出して現在の要素を追加する
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
    cout << "最大の " << k << " 個の要素は: ";
    printHeap(res);

    return 0;
}
