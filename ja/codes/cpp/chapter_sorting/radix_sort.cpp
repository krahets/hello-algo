/**
 * File: radix_sort.cpp
 * Created Time: 2023-03-26
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 要素 num の第 k 桁を取得する。exp = 10^(k-1) とする */
int digit(int num, int exp) {
    // k ではなく exp を渡すことで、ここで高コストのべき乗計算を繰り返すのを避ける
    return (num / exp) % 10;
}

/* カウントソート（nums の第 k 桁に基づくソート） */
void countingSortDigit(vector<int> &nums, int exp) {
    // 十進数の各桁の範囲は 0~9 なので、長さ 10 のバケット配列が必要
    vector<int> counter(10, 0);
    int n = nums.size();
    // 0~9 の各数字の出現回数を数える
    for (int i = 0; i < n; i++) {
        int d = digit(nums[i], exp); // nums[i] の第 k 桁を取得し、d とする
        counter[d]++;                // 数字 d の出現回数を数える
    }
    // 累積和を求め、「出現回数」を「配列のインデックス」に変換する
    for (int i = 1; i < 10; i++) {
        counter[i] += counter[i - 1];
    }
    // 逆順に走査し、バケット内の集計結果に基づいて各要素を res に入れる
    vector<int> res(n, 0);
    for (int i = n - 1; i >= 0; i--) {
        int d = digit(nums[i], exp);
        int j = counter[d] - 1; // 配列内での d のインデックス j を取得する
        res[j] = nums[i];       // 現在の要素をインデックス j に入れる
        counter[d]--;           // d の個数を 1 減らす
    }
    // 結果で元の配列 nums を上書きする
    for (int i = 0; i < n; i++)
        nums[i] = res[i];
}

/* 基数ソート */
void radixSort(vector<int> &nums) {
    // 最大桁数を判定するため、配列の最大要素を取得する
    int m = *max_element(nums.begin(), nums.end());
    // 下位の桁から上位の桁へ順に走査する
    for (int exp = 1; exp <= m; exp *= 10)
        // 配列の要素の第 k 桁に対してカウントソートを行う
        // k = 1 -> exp = 1
        // k = 2 -> exp = 10
        // つまり exp = 10^(k-1)
        countingSortDigit(nums, exp);
}

/* 実行用コード */
int main() {
    // 基数ソート
    vector<int> nums = {10546151, 35663510, 42865989, 34862445, 81883077,
                        88906420, 72429244, 30524779, 82060337, 63832996};
    radixSort(nums);
    cout << "基数ソート完了後 nums = ";
    printVector(nums);

    return 0;
}
