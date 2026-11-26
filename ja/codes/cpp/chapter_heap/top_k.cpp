/**
 * File: top_k.cpp
 * Created Time: 2023-06-12
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* ヒープを使って配列の上位 k 個の要素を求める */
priority_queue<int, vector<int>, greater<int>> topKHeap(vector<int> &nums, int k) {
    // 最小ヒープを初期化する
    priority_queue<int, vector<int>, greater<int>> heap;
    // 配列の先頭 k 個の要素をヒープに入れる
    for (int i = 0; i < k; i++) {
        heap.push(nums[i]);
    }
    // k+1 番目の要素からはヒープのサイズを k に保つ
    for (int i = k; i < nums.size(); i++) {
        // 現在の要素が根の要素より大きければ、根の要素を取り出して現在の要素を挿入する
        if (nums[i] > heap.top()) {
            heap.pop();
            heap.push(nums[i]);
        }
    }
    return heap;
}

// 実行例
int main() {
    vector<int> nums = {1, 7, 6, 3, 2};
    int k = 3;

    priority_queue<int, vector<int>, greater<int>> res = topKHeap(nums, k);
    cout << "上位 " << k << " 個の要素： ";
    printHeap(res);

    return 0;
}
