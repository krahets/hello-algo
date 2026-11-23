/**
 * File: binary_search.c
 * Created Time: 2023-03-18
 * Author: Guanngxu (446678850@qq.com)
 */

#include "../utils/common.h"

/* 二分探索（閉区間） */
int binarySearch(int *nums, int len, int target) {
    // 閉区間 [0, n-1] を初期化する。i, j は配列の先頭要素と末尾要素をそれぞれ指す
    int i = 0, j = len - 1;
    // 探索区間が空になるまで繰り返す（i > j のとき空になる）
    while (i <= j) {
        int m = i + (j - i) / 2; // 中央のインデックス m を計算する
        if (nums[m] < target)    // この場合、target は区間 [m+1, j] に存在する
            i = m + 1;
        else if (nums[m] > target) // この場合、target は区間 [i, m-1] に存在する
            j = m - 1;
        else // 目的の要素が見つかったので、そのインデックスを返す
            return m;
    }
    // 目的の要素が見つからなかったので、-1 を返す
    return -1;
}

/* 二分探索（左閉右開区間） */
int binarySearchLCRO(int *nums, int len, int target) {
    // 左閉右開区間 [0, n) を初期化する。i, j は配列の先頭要素と末尾要素の次をそれぞれ指す
    int i = 0, j = len;
    // 探索区間が空になるまで繰り返す（i = j のとき空になる）
    while (i < j) {
        int m = i + (j - i) / 2; // 中央のインデックス m を計算する
        if (nums[m] < target)    // この場合、target は区間 [m+1, j) に存在する
            i = m + 1;
        else if (nums[m] > target) // この場合、target は区間 [i, m) に存在する
            j = m;
        else // 目的の要素が見つかったので、そのインデックスを返す
            return m;
    }
    // 目的の要素が見つからなかったので、-1 を返す
    return -1;
}

/* 実行用コード */
int main() {
    int target = 6;
    int nums[10] = {1, 3, 6, 8, 12, 15, 23, 26, 31, 35};

    /* 二分探索（閉区間） */
    int index = binarySearch(nums, 10, target);
    printf("目的の要素 6 のインデックス = %d\n", index);

    /* 二分探索（左閉右開区間） */
    index = binarySearchLCRO(nums, 10, target);
    printf("目的の要素 6 のインデックス = %d\n", index);

    return 0;
}
