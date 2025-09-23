/**
 * File: bucket_sort.cpp
 * Created Time: 2023-03-30
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* バケットソート */
void bucketSort(vector<float> &nums) {
    // k = n/2個のバケットを初期化、各バケットに2つの要素を割り当てることを期待
    int k = nums.size() / 2;
    vector<vector<float>> buckets(k);
    // 1. 配列要素を各バケットに分配
    for (float num : nums) {
        // 入力データ範囲は[0, 1)、num * kを使用してインデックス範囲[0, k-1]にマップ
        int i = num * k;
        // bucket_idxバケットに数値を追加
        buckets[i].push_back(num);
    }
    // 2. 各バケットをソート
    for (vector<float> &bucket : buckets) {
        // 組み込みソート関数を使用、他のソートアルゴリズムに置き換えることも可能
        sort(bucket.begin(), bucket.end());
    }
    // 3. バケットを走査して結果をマージ
    int i = 0;
    for (vector<float> &bucket : buckets) {
        for (float num : bucket) {
            nums[i++] = num;
        }
    }
}

/* ドライバコード */
int main() {
    // 入力データが浮動小数点数、範囲[0, 1)と仮定
    vector<float> nums = {0.49f, 0.96f, 0.82f, 0.09f, 0.57f, 0.43f, 0.91f, 0.75f, 0.15f, 0.37f};
    bucketSort(nums);
    cout << "バケットソート後、nums = ";
    printVector(nums);

    return 0;
}