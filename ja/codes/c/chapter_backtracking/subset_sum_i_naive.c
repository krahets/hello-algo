/**
 * File: subset_sum_i_naive.c
 * Created Time: 2023-07-28
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

#define MAX_SIZE 100
#define MAX_RES_SIZE 100

// 状態（部分集合）
int state[MAX_SIZE];
int stateSize = 0;

// 結果リスト（部分集合のリスト）
int res[MAX_RES_SIZE][MAX_SIZE];
int resColSizes[MAX_RES_SIZE];
int resSize = 0;

/* バックトラッキング：部分和 I */
void backtrack(int target, int total, int *choices, int choicesSize) {
    // 部分集合の和が target に等しければ、解を記録
    if (total == target) {
        for (int i = 0; i < stateSize; i++) {
            res[resSize][i] = state[i];
        }
        resColSizes[resSize++] = stateSize;
        return;
    }
    // すべての選択肢を走査
    for (int i = 0; i < choicesSize; i++) {
        // 枝刈り：部分和が target を超える場合はその選択をスキップする
        if (total + choices[i] > target) {
            continue;
        }
        // 試行：選択を行い、要素と total を更新する
        state[stateSize++] = choices[i];
        // 次の選択へ進む
        backtrack(target, total + choices[i], choices, choicesSize);
        // バックトラック：選択を取り消し、前の状態に戻す
        stateSize--;
    }
}

/* 部分和 I を解く（重複部分集合を含む） */
void subsetSumINaive(int *nums, int numsSize, int target) {
    resSize = 0; // 解の個数を 0 に初期化する
    backtrack(target, 0, nums, numsSize);
}

/* Driver Code */
int main() {
    int nums[] = {3, 4, 5};
    int numsSize = sizeof(nums) / sizeof(nums[0]);
    int target = 9;

    subsetSumINaive(nums, numsSize, target);

    printf("入力配列 nums = ");
    printArray(nums, numsSize);
    printf("target = %d\n", target);
    printf("合計が %d に等しいすべての部分集合 res = \n", target);
    for (int i = 0; i < resSize; i++) {
        printArray(res[i], resColSizes[i]);
    }

    return 0;
}
