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

// 結果リスト（部分集合のリスト）
int res[MAX_RES_SIZE][MAX_SIZE];
int resColSizes[MAX_RES_SIZE];
int resSize = 0;

/* バックトラッキング：部分集合和 II */
void backtrack(int target, int *choices, int choicesSize, int start) {
    // 部分集合の和が target と等しくなったら、解を記録する
    if (target == 0) {
        for (int i = 0; i < stateSize; i++) {
            res[resSize][i] = state[i];
        }
        resColSizes[resSize++] = stateSize;
        return;
    }
    // すべての選択肢を走査する
    // 枝刈り 2：start から走査を始め、重複した部分集合の生成を避ける
    // 枝刈り 3：start から走査を始め、同じ要素の再選択を避ける
    for (int i = start; i < choicesSize; i++) {
        // 枝刈り 1：部分集合の和が target を超える場合、直ちにスキップする
        if (target - choices[i] < 0) {
            continue;
        }
        // 枝刈り 4：この要素が左隣の要素と等しい場合、探索の分岐が重複するため、直ちにスキップする
        if (i > start && choices[i] == choices[i - 1]) {
            continue;
        }
        // 試行：選択を行い、target, start を更新する
        state[stateSize] = choices[i];
        stateSize++;
        // 次の選択に進む
        backtrack(target - choices[i], choices, choicesSize, i + 1);
        // 復元：選択を取り消し、以前の状態に戻す
        stateSize--;
    }
}

/* 比較関数 */
int cmp(const void *a, const void *b) {
    return (*(int *)a - *(int *)b);
}

/* 部分集合和 II を解く */
void subsetSumII(int *nums, int numsSize, int target) {
    // nums をソートする
    qsort(nums, numsSize, sizeof(int), cmp);
    // バックトラッキングを開始する
    backtrack(target, nums, numsSize, 0);
}

/* 実行用コード */
int main() {
    int nums[] = {4, 4, 5};
    int numsSize = sizeof(nums) / sizeof(nums[0]);
    int target = 9;

    subsetSumII(nums, numsSize, target);

    printf("入力配列 nums = ");
    printArray(nums, numsSize);
    printf("target = %d\n", target);
    printf("和が %d になるすべての部分集合 res = \n", target);
    for (int i = 0; i < resSize; ++i) {
        printArray(res[i], resColSizes[i]);
    }

    return 0;
}
