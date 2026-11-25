/**
 * File: bucket_sort.cpp
 * Created Time: 2023-03-30
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* バケットソート */
void bucketSort(vector<float> &nums) {
    // k = n/2 個のバケットを初期化。各バケットには平均 2 要素が入る想定
    int k = nums.size() / 2;
    vector<vector<float>> buckets(k);
    // 1. 配列の要素を各バケットに振り分ける
    for (float num : nums) {
        // 入力範囲は [0, 1)。num * k でインデックスの範囲 [0, k-1] に写す
        int i = num * k;
        // num をバケット bucket_idx に追加
        buckets[i].push_back(num);
    }
    // 2. 各バケットをソートする
    for (vector<float> &bucket : buckets) {
        // 組み込みのソート関数を使用。他のソートアルゴリズムでもよい
        sort(bucket.begin(), bucket.end());
    }
    // 3. バケットを順に連結
    int i = 0;
    for (vector<float> &bucket : buckets) {
        for (float num : bucket) {
            nums[i++] = num;
        }
    }
}

/* 実行例 */
int main() {
    // 入力は [0, 1) の範囲の浮動小数点数とする
    vector<float> nums = {0.49f, 0.96f, 0.82f, 0.09f, 0.57f, 0.43f, 0.91f, 0.75f, 0.15f, 0.37f};
    bucketSort(nums);
    cout << "バケットソート後の nums = ";
    printVector(nums);

    return 0;
}
