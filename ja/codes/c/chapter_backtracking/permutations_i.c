/**
 * File: permutations_i.c
 * Created Time: 2023-06-04
 * Author: Gonglja (glj0@outlook.com), krahets (krahets@163.com)
 */

#include "../utils/common.h"

// 順列は最大 1000 個と仮定
#define MAX_SIZE 1000

/* バックトラッキング：順列 I */
void backtrack(int *state, int stateSize, int *choices, int choicesSize, bool *selected, int **res, int *resSize) {
    // 状態の長さが要素数に等しければ、解を記録
    if (stateSize == choicesSize) {
        res[*resSize] = (int *)malloc(choicesSize * sizeof(int));
        for (int i = 0; i < choicesSize; i++) {
            res[*resSize][i] = state[i];
        }
        (*resSize)++;
        return;
    }
    // すべての選択肢を走査
    for (int i = 0; i < choicesSize; i++) {
        int choice = choices[i];
        // 枝刈り：要素の重複選択を許可しない
        if (!selected[i]) {
            // 試行: 選択を行い、状態を更新
            selected[i] = true;
            state[stateSize] = choice;
            // 次の選択へ進む
            backtrack(state, stateSize + 1, choices, choicesSize, selected, res, resSize);
            // バックトラック：選択を取り消し、前の状態に戻す
            selected[i] = false;
        }
    }
}

/* 全順列 I */
int **permutationsI(int *nums, int numsSize, int *returnSize) {
    int *state = (int *)malloc(numsSize * sizeof(int));
    bool *selected = (bool *)malloc(numsSize * sizeof(bool));
    for (int i = 0; i < numsSize; i++) {
        selected[i] = false;
    }
    int **res = (int **)malloc(MAX_SIZE * sizeof(int *));
    *returnSize = 0;

    backtrack(state, 0, nums, numsSize, selected, res, returnSize);

    free(state);
    free(selected);

    return res;
}

/* Driver Code */
int main() {
    int nums[] = {1, 2, 3};
    int numsSize = sizeof(nums) / sizeof(nums[0]);
    int returnSize;

    int **res = permutationsI(nums, numsSize, &returnSize);

    printf("入力配列 nums = ");
    printArray(nums, numsSize);
    printf("\nすべての順列 res = \n");
    for (int i = 0; i < returnSize; i++) {
        printArray(res[i], numsSize);
    }

    // メモリを解放する
    for (int i = 0; i < returnSize; i++) {
        free(res[i]);
    }
    free(res);

    return 0;
}
