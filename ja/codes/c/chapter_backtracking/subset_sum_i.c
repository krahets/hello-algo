/**
 * File: subset_sum_i.c
 * Created Time: 2023-07-29
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
void backtrack(int target, int *choices, int choicesSize, int start) {
    // 部分集合の和が target に等しければ、解を記録
    if (target == 0) {
        for (int i = 0; i < stateSize; ++i) {
            res[resSize][i] = state[i];
        }
        resColSizes[resSize++] = stateSize;
        return;
    }
    // すべての選択肢を走査
    // 枝刈り 2: start から走査し、重複する部分集合の生成を避ける
    for (int i = start; i < choicesSize; i++) {
        // 枝刈り1：部分集合の和が target を超えたら、直ちにループを終了する
        // 配列はソート済みで後続要素のほうが大きく、部分集合の和は必ず target を超えるため
        if (target - choices[i] < 0) {
            break;
        }
        // 試す：選択を行い、target と start を更新
        state[stateSize] = choices[i];
        stateSize++;
        // 次の選択へ進む
        backtrack(target - choices[i], choices, choicesSize, i);
        // バックトラック：選択を取り消し、前の状態に戻す
        stateSize--;
    }
}

/* 比較関数 */
int cmp(const void *a, const void *b) {
    return (*(int *)a - *(int *)b);
}

/* 部分和 I を解く */
void subsetSumI(int *nums, int numsSize, int target) {
    qsort(nums, numsSize, sizeof(int), cmp); // nums をソート
    int start = 0;                           // 開始点を走査
    backtrack(target, nums, numsSize, start);
}

/* Driver Code */
int main() {
    int nums[] = {3, 4, 5};
    int numsSize = sizeof(nums) / sizeof(nums[0]);
    int target = 9;

    subsetSumI(nums, numsSize, target);

    printf("入力配列 nums = ");
    printArray(nums, numsSize);
    printf("target = %d\n", target);
    printf("合計が %d に等しいすべての部分集合 res = \n", target);
    for (int i = 0; i < resSize; ++i) {
        printArray(res[i], resColSizes[i]);
    }

    return 0;
}
