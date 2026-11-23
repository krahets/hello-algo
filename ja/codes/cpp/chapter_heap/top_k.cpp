/**
 * File: top_k.cpp
 * Created Time: 2023-06-12
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* ヒープを使って配列内の大きいほうから k 個の要素を求める */
priority_queue<int, vector<int>, greater<int>> topKHeap(vector<int> &nums, int k) {
    // 最小ヒープを初期化する
    priority_queue<int, vector<int>, greater<int>> heap;
    // 配列の先頭 k 個の要素をヒープに挿入する
    for (int i = 0; i < k; i++) {
        heap.push(nums[i]);
    }
    // k+1 番目の要素から始め、ヒープの長さを k に保つ
    for (int i = k; i < nums.size(); i++) {
        // 現在の要素がヒープの先頭要素より大きい場合、先頭要素を取り出し、現在の要素を挿入する
        if (nums[i] > heap.top()) {
            heap.pop();
            heap.push(nums[i]);
        }
    }
    return heap;
}

// 実行用コード
int main() {
    vector<int> nums = {1, 7, 6, 3, 2};
    int k = 3;

    priority_queue<int, vector<int>, greater<int>> res = topKHeap(nums, k);
    cout << "大きいほうから " << k << " 個の要素： ";
    printHeap(res);

    return 0;
}
