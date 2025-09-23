/**
 * File: top_k.cpp
 * Created Time: 2023-06-12
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* ヒープを使用して配列内の最大k個の要素を見つける */
priority_queue<int, vector<int>, greater<int>> topKHeap(vector<int> &nums, int k) {
    // 最小ヒープを初期化
    priority_queue<int, vector<int>, greater<int>> heap;
    // 配列の最初のk個の要素をヒープに入力
    for (int i = 0; i < k; i++) {
        heap.push(nums[i]);
    }
    // k+1番目の要素から、ヒープの長さをkに保つ
    for (int i = k; i < nums.size(); i++) {
        // 現在の要素がヒープの先頭要素より大きい場合、ヒープの先頭要素を削除し、現在の要素をヒープに入力
        if (nums[i] > heap.top()) {
            heap.pop();
            heap.push(nums[i]);
        }
    }
    return heap;
}

// ドライバーコード
int main() {
    vector<int> nums = {1, 7, 6, 3, 2};
    int k = 3;

    priority_queue<int, vector<int>, greater<int>> res = topKHeap(nums, k);
    cout << "最大 " << k << " 個の要素は:";
    printHeap(res);

    return 0;
}