/**
 * File: counting_sort.cpp
 * Created Time: 2023-03-17
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* カウントソート */
// 簡単な実装、オブジェクトのソートには使用できない
void countingSortNaive(vector<int> &nums) {
    // 1. 配列の最大要素mを統計
    int m = 0;
    for (int num : nums) {
        m = max(m, num);
    }
    // 2. 各数字の出現回数を統計
    // counter[num]はnumの出現回数を表す
    vector<int> counter(m + 1, 0);
    for (int num : nums) {
        counter[num]++;
    }
    // 3. counterを走査し、各要素を元の配列numsに戻す
    int i = 0;
    for (int num = 0; num < m + 1; num++) {
        for (int j = 0; j < counter[num]; j++, i++) {
            nums[i] = num;
        }
    }
}

/* カウントソート */
// 完全な実装、オブジェクトのソートが可能で安定ソート
void countingSort(vector<int> &nums) {
    // 1. 配列の最大要素mを統計
    int m = 0;
    for (int num : nums) {
        m = max(m, num);
    }
    // 2. 各数字の出現回数を統計
    // counter[num]はnumの出現回数を表す
    vector<int> counter(m + 1, 0);
    for (int num : nums) {
        counter[num]++;
    }
    // 3. counterの前缀和を計算し、「出現回数」を「末尾インデックス」に変換
    // counter[num]-1はnumがresで現れる最後のインデックス
    for (int i = 0; i < m; i++) {
        counter[i + 1] += counter[i];
    }
    // 4. numsを逆順で走査し、各要素を結果配列resに配置
    // 結果を記録する配列resを初期化
    int n = nums.size();
    vector<int> res(n);
    for (int i = n - 1; i >= 0; i--) {
        int num = nums[i];
        res[counter[num] - 1] = num; // numを対応するインデックスに配置
        counter[num]--;              // 前缀和を1減らし、numを配置する次のインデックスを取得
    }
    // 結果配列resで元の配列numsを上書き
    nums = res;
}

/* ドライバコード */
int main() {
    vector<int> nums = {1, 0, 1, 2, 0, 4, 0, 2, 2, 4};
    countingSortNaive(nums);
    cout << "カウントソート（オブジェクトソート不可）後、nums = ";
    printVector(nums);

    vector<int> nums1 = {1, 0, 1, 2, 0, 4, 0, 2, 2, 4};
    countingSort(nums1);
    cout << "カウントソート後、nums1 = ";
    printVector(nums1);

    return 0;
}