/**
 * File: counting_sort.cpp
 * Created Time: 2023-03-17
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* カウントソート */
// 簡易実装。オブジェクトのソートには使えない
void countingSortNaive(vector<int> &nums) {
    // 1. 配列の最大要素 m を求める
    int m = 0;
    for (int num : nums) {
        m = max(m, num);
    }
    // 2. 各数値の出現回数を数える
    // counter[num] は num の出現回数を表す
    vector<int> counter(m + 1, 0);
    for (int num : nums) {
        counter[num]++;
    }
    // 3. counter を走査し、各要素を元の配列 nums に入れる
    int i = 0;
    for (int num = 0; num < m + 1; num++) {
        for (int j = 0; j < counter[num]; j++, i++) {
            nums[i] = num;
        }
    }
}

/* カウントソート */
// 完全な実装。オブジェクトをソートでき、安定ソートである
void countingSort(vector<int> &nums) {
    // 1. 配列の最大要素 m を求める
    int m = 0;
    for (int num : nums) {
        m = max(m, num);
    }
    // 2. 各数値の出現回数を数える
    // counter[num] は num の出現回数を表す
    vector<int> counter(m + 1, 0);
    for (int num : nums) {
        counter[num]++;
    }
    // 3. counter の累積和を求め、「出現回数」を「末尾のインデックス」に変換する
    // つまり、counter[num]-1 は res 内で num が最後に現れるインデックスである
    for (int i = 0; i < m; i++) {
        counter[i + 1] += counter[i];
    }
    // 4. nums を逆順に走査し、各要素を結果配列 res に入れる
    // 結果を記録する配列 res を初期化する
    int n = nums.size();
    vector<int> res(n);
    for (int i = n - 1; i >= 0; i--) {
        int num = nums[i];
        res[counter[num] - 1] = num; // 対応するインデックスに num を配置する
        counter[num]--;              // 累積和を 1 減らし、次に num を配置するインデックスを求める
    }
    // 結果配列 res で元の配列 nums を上書きする
    nums = res;
}

/* 実行用コード */
int main() {
    vector<int> nums = {1, 0, 1, 2, 0, 4, 0, 2, 2, 4};
    countingSortNaive(nums);
    cout << "カウントソート（オブジェクトはソート不可）の完了後 nums = ";
    printVector(nums);

    vector<int> nums1 = {1, 0, 1, 2, 0, 4, 0, 2, 2, 4};
    countingSort(nums1);
    cout << "カウントソート完了後 nums1 = ";
    printVector(nums1);

    return 0;
}
