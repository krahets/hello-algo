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

// Result list (list of subsets)
int res[MAX_RES_SIZE][MAX_SIZE];
int resColSizes[MAX_RES_SIZE];
int resSize = 0;

/* Backtracking: subset sum I */
void backtrack(int target, int total, int *choices, int choicesSize) {
    // Record a solution when the subset sum equals target
    if (total == target) {
        for (int i = 0; i < stateSize; i++) {
            res[resSize][i] = state[i];
        }
        resColSizes[resSize++] = stateSize;
        return;
    }
    // Iterate over all choices
    for (int i = 0; i < choicesSize; i++) {
        // Prune: skip this choice if the subset sum would exceed target
        if (total + choices[i] > target) {
            continue;
        }
        // Try: make a choice and update the sum total
        state[stateSize++] = choices[i];
        // Proceed to the next choice
        backtrack(target, total + choices[i], choices, choicesSize);
        // Backtrack: undo the choice and restore the previous state
        stateSize--;
    }
}

/* Solve subset sum I (with duplicate subsets) */
void subsetSumINaive(int *nums, int numsSize, int target) {
    resSize = 0; // Initialize the solution count to 0
    backtrack(target, 0, nums, numsSize);
}

/* Driver code */
int main() {
    int nums[] = {3, 4, 5};
    int numsSize = sizeof(nums) / sizeof(nums[0]);
    int target = 9;

    subsetSumINaive(nums, numsSize, target);

    printf("Input array nums = ");
    printArray(nums, numsSize);
    printf("target = %d\n", target);
    printf("All subsets whose sum equals %d, res = \n", target);
    for (int i = 0; i < resSize; i++) {
        printArray(res[i], resColSizes[i]);
    }

    return 0;
}
