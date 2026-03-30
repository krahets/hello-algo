/**
 * File: radix_sort.c
 * Created Time: 2023-01-18
 * Author: Reanon (793584285@qq.com)
 */

#include "../utils/common.h"

/* 要素 num の下から k 桁目を取得（exp = 10^(k-1)） */
int digit(int num, int exp) {
    // ここで高コストな累乗計算を繰り返さないよう、k ではなく exp を渡す
    return (num / exp) % 10;
}

/* 計数ソート（nums の k 桁目でソート） */
void countingSortDigit(int nums[], int size, int exp) {
    // 10 進数の各桁は 0~9 の範囲なので、長さ 10 のバケット配列が必要
    int *counter = (int *)malloc((sizeof(int) * 10));
    memset(counter, 0, sizeof(int) * 10); // 後続のメモリ解放に備えて 0 で初期化する
    // 0~9 の各数字の出現回数を集計する
    for (int i = 0; i < size; i++) {
        // nums[i] の第 k 位を取得し、d とする
        int d = digit(nums[i], exp);
        // 数字 d の出現回数を数える
        counter[d]++;
    }
    // 累積和を求め、「出現回数」を「配列インデックス」に変換する
    for (int i = 1; i < 10; i++) {
        counter[i] += counter[i - 1];
    }
    // 逆順に走査し、バケット内の集計結果に従って各要素を res に格納する
    int *res = (int *)malloc(sizeof(int) * size);
    for (int i = size - 1; i >= 0; i--) {
        int d = digit(nums[i], exp);
        int j = counter[d] - 1; // d の配列内インデックス j を取得する
        res[j] = nums[i];       // 現在の要素をインデックス j に格納する
        counter[d]--;           // d の個数を 1 減らす
    }
    // 結果で元の配列 nums を上書きする
    for (int i = 0; i < size; i++) {
        nums[i] = res[i];
    }
    // メモリを解放する
    free(res);
    free(counter);
}

/* 基数ソート */
void radixSort(int nums[], int size) {
    // 最大桁数の判定用に配列の最大要素を取得
    int max = INT32_MIN;
    for (int i = 0; i < size; i++) {
        if (nums[i] > max) {
            max = nums[i];
        }
    }
    // 下位桁から上位桁の順に走査する
    for (int exp = 1; max >= exp; exp *= 10)
        // 配列要素の k 桁目に対して計数ソートを行う
        // k = 1 -> exp = 1
        // k = 2 -> exp = 10
        // つまり exp = 10^(k-1)
        countingSortDigit(nums, size, exp);
}

/* Driver Code */
int main() {
    // 基数ソート
    int nums[] = {10546151, 35663510, 42865989, 34862445, 81883077,
                  88906420, 72429244, 30524779, 82060337, 63832996};
    int size = sizeof(nums) / sizeof(int);
    radixSort(nums, size);
    printf("基数ソート完了後 nums = ");
    printArray(nums, size);
}
