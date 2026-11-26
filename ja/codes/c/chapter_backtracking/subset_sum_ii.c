/**
 * File: subset_sum_ii.c
 * Created Time: 2023-07-29
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

#define MAX_SIZE 100
#define MAX_RES_SIZE 100

// 状態（部分集合）
int state[MAX_SIZE];
int stateSize = 0;

// 結果のリスト（部分集合のリスト）
int res[MAX_RES_SIZE][MAX_SIZE];
int resColSizes[MAX_RES_SIZE];
int resSize = 0;

/* バックトラッキングによる部分和問題 II */
void backtrack(int target, int *choices, int choicesSize, int start) {
    // 部分集合の要素の和が target に等しくなったら解を記録する
    if (target == 0) {
        for (int i = 0; i < stateSize; i++) {
            res[resSize][i] = state[i];
        }
        resColSizes[resSize++] = stateSize;
        return;
    }
    // すべての選択肢を調べる
    // 枝刈り 2：start から調べて部分集合の重複を防ぐ
    // 枝刈り 3：start から調べて同じ要素を二度選ばないようにする
    for (int i = start; i < choicesSize; i++) {
        // 枝刈り 1：部分集合の要素の和が target を超えるなら飛ばす
        if (target - choices[i] < 0) {
            continue;
        }
        // 枝刈り 4：左隣の要素と値が等しければ、探索の枝が重複するので飛ばす
        if (i > start && choices[i] == choices[i - 1]) {
            continue;
        }
        // 試行：選択して target と start を更新する
        state[stateSize] = choices[i];
        stateSize++;
        // 次の選択に進む
        backtrack(target - choices[i], choices, choicesSize, i + 1);
        // 後戻り：選択を取り消し、元の状態に戻す
        stateSize--;
    }
}

/* 比較関数 */
int cmp(const void *a, const void *b) {
    return (*(int *)a - *(int *)b);
}

/* 部分和問題 II を解く */
void subsetSumII(int *nums, int numsSize, int target) {
    // nums をソートする
    qsort(nums, numsSize, sizeof(int), cmp);
    // バックトラッキングを開始する
    backtrack(target, nums, numsSize, 0);
}

/* 実行例 */
int main() {
    int nums[] = {4, 4, 5};
    int numsSize = sizeof(nums) / sizeof(nums[0]);
    int target = 9;

    subsetSumII(nums, numsSize, target);

    printf("入力配列 nums = ");
    printArray(nums, numsSize);
    printf("target = %d\n", target);
    printf("要素の和が %d となるすべての部分集合 res = \n", target);
    for (int i = 0; i < resSize; ++i) {
        printArray(res[i], resColSizes[i]);
    }

    return 0;
}
