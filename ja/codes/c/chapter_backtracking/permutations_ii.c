/**
 * File: permutations_ii.c
 * Created Time: 2023-10-17
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.h"

// 順列は最大 1000 個、要素の値は最大 1000 と仮定する
#define MAX_SIZE 1000

/* バックトラッキング：すべての順列 II */
void backtrack(int *state, int stateSize, int *choices, int choicesSize, bool *selected, int **res, int *resSize) {
    // 状態の長さが要素数と等しくなったら、解を記録する
    if (stateSize == choicesSize) {
        res[*resSize] = (int *)malloc(choicesSize * sizeof(int));
        for (int i = 0; i < choicesSize; i++) {
            res[*resSize][i] = state[i];
        }
        (*resSize)++;
        return;
    }
    // すべての選択肢を走査する
    bool duplicated[MAX_SIZE] = {false};
    for (int i = 0; i < choicesSize; i++) {
        int choice = choices[i];
        // 枝刈り：同じ要素の再選択も、等しい値を持つ要素の重複選択も許可しない
        if (!selected[i] && !duplicated[choice]) {
            // 試行：選択を行い、状態を更新する
            duplicated[choice] = true; // 選択済みの要素の値を記録する
            selected[i] = true;
            state[stateSize] = choice;
            // 次の選択に進む
            backtrack(state, stateSize + 1, choices, choicesSize, selected, res, resSize);
            // 復元：選択を取り消し、以前の状態に戻す
            selected[i] = false;
        }
    }
}

/* すべての順列 II */
int **permutationsII(int *nums, int numsSize, int *returnSize) {
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

/* 実行用コード */
int main() {
    int nums[] = {1, 1, 2};
    int numsSize = sizeof(nums) / sizeof(nums[0]);
    int returnSize;

    int **res = permutationsII(nums, numsSize, &returnSize);

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
