/**
 * File: subset_sum_i.c
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

/* Backtracking algorithm: Subset sum I */
void backtrack(int target, int *choices, int choicesSize, int start) {
    // When the subset sum equals target, record the solution
    if (target == 0) {
        for (int i = 0; i < stateSize; ++i) {
            res[resSize][i] = state[i];
        }
        resColSizes[resSize++] = stateSize;
        return;
    }
    // Traverse all choices
    // Pruning 2: start traversing from start to avoid generating duplicate subsets
    for (int i = start; i < choicesSize; i++) {
        // Pruning 1: if the subset sum exceeds target, end the loop directly
        // This is because the array is sorted, and later elements are larger, so the subset sum will definitely exceed target
        if (target - choices[i] < 0) {
            break;
        }
        // Attempt: make choice, update target, start
        state[stateSize] = choices[i];
        stateSize++;
        // Proceed to the next round of selection
        backtrack(target - choices[i], choices, choicesSize, i);
        // Backtrack: undo choice, restore to previous state
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
    int start = 0;                           // Start point for traversal
    backtrack(target, nums, numsSize, start);
}

/* Driver Code */
int main() {
    int nums[] = {3, 4, 5};
    int numsSize = sizeof(nums) / sizeof(nums[0]);
    int target = 9;

    subsetSumI(nums, numsSize, target);

    printf("Input array nums = ");
    printArray(nums, numsSize);
    printf("target = %d\n", target);
    printf("All subsets with sum equal to %d res = \n", target);
    for (int i = 0; i < resSize; ++i) {
        printArray(res[i], resColSizes[i]);
    }

    return 0;
}
