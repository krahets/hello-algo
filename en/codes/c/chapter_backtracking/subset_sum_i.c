/**
 * File: subset_sum_i.c
 * Created Time: 2023-07-29
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

#define MAX_SIZE 100
#define MAX_RES_SIZE 100

// State (current subset)
int state[MAX_SIZE];
int stateSize = 0;

// Results (list of subsets)
int res[MAX_RES_SIZE][MAX_SIZE];
int resColSizes[MAX_RES_SIZE];
int resSize = 0;

/* Backtracking: subset sum I */
void backtrack(int target, int *choices, int choicesSize, int start) {
    // Record a solution when the subset sums to target
    if (target == 0) {
        for (int i = 0; i < stateSize; ++i) {
            res[resSize][i] = state[i];
        }
        resColSizes[resSize++] = stateSize;
        return;
    }
    // Try each choice
    // Pruning rule 2: start at start to avoid duplicate subsets
    for (int i = start; i < choicesSize; i++) {
        // Pruning rule 1: break if the subset sum would exceed target
        // The array is sorted, so later elements are at least as large and would also take the sum over target
        if (target - choices[i] < 0) {
            break;
        }
        // Make a choice and update target and start
        state[stateSize] = choices[i];
        stateSize++;
        // Make the next choice
        backtrack(target - choices[i], choices, choicesSize, i);
        // Backtrack: undo the choice to restore the previous state
        stateSize--;
    }
}

/* Comparison function */
int cmp(const void *a, const void *b) {
    return (*(int *)a - *(int *)b);
}

/* Solve subset sum I */
void subsetSumI(int *nums, int numsSize, int target) {
    qsort(nums, numsSize, sizeof(int), cmp); // Sort nums
    int start = 0;                           // Starting index
    backtrack(target, nums, numsSize, start);
}

/* Driver code */
int main() {
    int nums[] = {3, 4, 5};
    int numsSize = sizeof(nums) / sizeof(nums[0]);
    int target = 9;

    subsetSumI(nums, numsSize, target);

    printf("Input array nums = ");
    printArray(nums, numsSize);
    printf("target = %d\n", target);
    printf("Subsets that sum to %d: res = \n", target);
    for (int i = 0; i < resSize; ++i) {
        printArray(res[i], resColSizes[i]);
    }

    return 0;
}
