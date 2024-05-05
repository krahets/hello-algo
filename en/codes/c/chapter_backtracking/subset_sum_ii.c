/**
 * File: subset_sum_ii.c
 * Created Time: 2023-07-29
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

#define MAX_SIZE 100
#define MAX_RES_SIZE 100

// State (subset)
int state[MAX_SIZE];
int stateSize = 0;

// Result list (subset list)
int res[MAX_RES_SIZE][MAX_SIZE];
int resColSizes[MAX_RES_SIZE];
int resSize = 0;

/* Backtracking algorithm: Subset Sum II */
void backtrack(int target, int *choices, int choicesSize, int start) {
    // When the subset sum equals target, record the solution
    if (target == 0) {
        for (int i = 0; i < stateSize; i++) {
            res[resSize][i] = state[i];
        }
        resColSizes[resSize++] = stateSize;
        return;
    }
    // Traverse all choices
    // Pruning two: start traversing from start to avoid generating duplicate subsets
    // Pruning three: start traversing from start to avoid repeatedly selecting the same element
    for (int i = start; i < choicesSize; i++) {
        // Pruning one: If the subset sum exceeds target, skip
        if (target - choices[i] < 0) {
            continue;
        }
        // Pruning four: if the element equals the left element, it indicates that the search branch is repeated, skip it
        if (i > start && choices[i] == choices[i - 1]) {
            continue;
        }
        // Attempt: make a choice, update target, start
        state[stateSize] = choices[i];
        stateSize++;
        // Proceed to the next round of selection
        backtrack(target - choices[i], choices, choicesSize, i + 1);
        // Retract: undo the choice, restore to the previous state
        stateSize--;
    }
}

/* Comparison function */
int cmp(const void *a, const void *b) {
    return (*(int *)a - *(int *)b);
}

/* Solve Subset Sum II */
void subsetSumII(int *nums, int numsSize, int target) {
    // Sort nums
    qsort(nums, numsSize, sizeof(int), cmp);
    // Start backtracking
    backtrack(target, nums, numsSize, 0);
}

/* Driver Code */
int main() {
    int nums[] = {4, 4, 5};
    int numsSize = sizeof(nums) / sizeof(nums[0]);
    int target = 9;

    subsetSumII(nums, numsSize, target);

    printf("Input array nums =");
    printArray(nums, numsSize);
    printf("target = %d\n", target);
    printf("All subsets equal to %d res = \n", target);
    for (int i = 0; i < resSize; ++i) {
        printArray(res[i], resColSizes[i]);
    }

    return 0;
}
