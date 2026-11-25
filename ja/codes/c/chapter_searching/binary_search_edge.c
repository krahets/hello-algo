/**
 * File: binary_search_edge.c
 * Created Time: 2023-09-09
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 挿入位置の二分探索（重複する要素がある場合） */
int binarySearchInsertion(int *nums, int numSize, int target) {
    int i = 0, j = numSize - 1; // 閉区間 [0, n-1] で初期化する
    while (i <= j) {
        int m = i + (j - i) / 2; // 中央のインデックス m を求める
        if (nums[m] < target) {
            i = m + 1; // target の探索範囲は [m+1, j]
        } else {
            j = m - 1; // target 未満の最も右の要素を [i, m-1] で探す
        }
    }
    // 挿入位置 i を返す
    return i;
}

/* 最も左にある target の二分探索 */
int binarySearchLeftEdge(int *nums, int numSize, int target) {
    // target の挿入位置を探すことと同じ
    int i = binarySearchInsertion(nums, numSize, target);
    // target が見つからなかったので -1 を返す
    if (i == numSize || nums[i] != target) {
        return -1;
    }
    // target が見つかったのでインデックス i を返す
    return i;
}

/* 最も右にある target の二分探索 */
int binarySearchRightEdge(int *nums, int numSize, int target) {
    // 最も左にある target + 1 の探索に置き換える
    int i = binarySearchInsertion(nums, numSize, target + 1);
    // j は最も右の target を、i は target より大きい最初の要素を指す
    int j = i - 1;
    // target が見つからなかったので -1 を返す
    if (j == -1 || nums[j] != target) {
        return -1;
    }
    // target が見つかったのでインデックス j を返す
    return j;
}

/* 実行例 */
int main() {
    // 重複する要素がある配列
    int nums[] = {1, 3, 6, 6, 6, 6, 6, 10, 12, 15};
    printf("\n配列 nums = ");
    printArray(nums, sizeof(nums) / sizeof(nums[0]));

    // 左端と右端の二分探索
    int targets[] = {6, 7};
    for (int i = 0; i < sizeof(targets) / sizeof(targets[0]); i++) {
        int index = binarySearchLeftEdge(nums, sizeof(nums) / sizeof(nums[0]), targets[i]);
        printf("最も左にある %d のインデックスは %d\n", targets[i], index);
        index = binarySearchRightEdge(nums, sizeof(nums) / sizeof(nums[0]), targets[i]);
        printf("最も右にある %d のインデックスは %d\n", targets[i], index);
    }

    return 0;
}
