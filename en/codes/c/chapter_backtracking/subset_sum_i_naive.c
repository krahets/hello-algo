/**
 * File: subset_sum_i_naive.c
 * Created Time: 2023-07-28
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

/* Backtracking algorithm: Subset sum I */
void backtrack(int target, int total, int *choices, int choicesSize) {
    // When the subset sum equals target, record the solution
    if (total == target) {
        for (int i = 0; i < stateSize; i++) {
            res[resSize][i] = state[i];
        }
        resColSizes[resSize++] = stateSize;
        return;
    }
    // Traverse all choices
    for (int i = 0; i < choicesSize; i++) {
        // Pruning: if the subset sum exceeds target, skip this choice
        if (total + choices[i] > target) {
            continue;
        }
        // Attempt: make choice, update element sum total
        state[stateSize++] = choices[i];
        // Proceed to the next round of selection
        backtrack(target, total + choices[i], choices, choicesSize);
        // Backtrack: undo choice, restore to previous state
        stateSize--;
    }
}

/* Solve subset sum I (including duplicate subsets) */
void subsetSumINaive(int *nums, int numsSize, int target) {
    resSize = 0; // Initialize solution count to 0
    backtrack(target, 0, nums, numsSize);
}

/* Driver Code */
int main() {
    int nums[] = {3, 4, 5};
    int numsSize = sizeof(nums) / sizeof(nums[0]);
    int target = 9;

    subsetSumINaive(nums, numsSize, target);

    printf("Input array nums = ");
    printArray(nums, numsSize);
    printf("target = %d\n", target);
    printf("All subsets with sum equal to %d res = \n", target);
    for (int i = 0; i < resSize; i++) {
        printArray(res[i], resColSizes[i]);
    }

    return 0;
}
