/**
 * File: radix_sort.cpp
 * Created Time: 2023-03-26
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 要素numのk番目の桁を取得、exp = 10^(k-1) */
int digit(int num, int exp) {
    // kの代わりにexpを渡すことで、ここで繰り返される高価な冪乗計算を避けることができる
    return (num / exp) % 10;
}

/* カウントソート（numsのk番目の桁に基づく） */
void countingSortDigit(vector<int> &nums, int exp) {
    // 10進数の桁範囲は0~9なので、長さ10のバケット配列が必要
    vector<int> counter(10, 0);
    int n = nums.size();
    // 数字0~9の出現回数を統計
    for (int i = 0; i < n; i++) {
        int d = digit(nums[i], exp); // nums[i]のk番目の桁を取得、dとして記録
        counter[d]++;                // 数字dの出現回数を統計
    }
    // 前缀和を計算し、「出現回数」を「配列インデックス」に変換
    for (int i = 1; i < 10; i++) {
        counter[i] += counter[i - 1];
    }
    // 逆順で走査し、バケット統計に基づいて各要素をresに配置
    vector<int> res(n, 0);
    for (int i = n - 1; i >= 0; i--) {
        int d = digit(nums[i], exp);
        int j = counter[d] - 1; // dが配列内にあるインデックスjを取得
        res[j] = nums[i];       // 現在の要素をインデックスjに配置
        counter[d]--;           // dのカウントを1減らす
    }
    // 結果で元の配列numsを上書き
    for (int i = 0; i < n; i++)
        nums[i] = res[i];
}

/* 基数ソート */
void radixSort(vector<int> &nums) {
    // 配列の最大要素を取得、最大桁数を判定するために使用
    int m = *max_element(nums.begin(), nums.end());
    // 最下位桁から最上位桁まで走査
    for (int exp = 1; exp <= m; exp *= 10)
        // 配列要素のk番目の桁でカウントソートを実行
        // k = 1 -> exp = 1
        // k = 2 -> exp = 10
        // つまり、exp = 10^(k-1)
        countingSortDigit(nums, exp);
}

/* ドライバコード */
int main() {
    // 基数ソート
    vector<int> nums = {10546151, 35663510, 42865989, 34862445, 81883077,
                        88906420, 72429244, 30524779, 82060337, 63832996};
    radixSort(nums);
    cout << "基数ソート後、nums = ";
    printVector(nums);

    return 0;
}