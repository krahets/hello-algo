/**
 * File: permutations_i.c
 * Created Time: 2023-06-04
 * Author: Gonglja (glj0@outlook.com), krahets (krahets@163.com)
 */

#include "../utils/common.h"

// Assume there are at most 1000 permutations
#define MAX_SIZE 1000

/* Backtracking: permutations I */
void backtrack(int *state, int stateSize, int *choices, int choicesSize, bool *selected, int **res, int *resSize) {
    // Record a solution when the state length equals the number of elements
    if (stateSize == choicesSize) {
        res[*resSize] = (int *)malloc(choicesSize * sizeof(int));
        for (int i = 0; i < choicesSize; i++) {
            res[*resSize][i] = state[i];
        }
        (*resSize)++;
        return;
    }
    // Iterate over all choices
    for (int i = 0; i < choicesSize; i++) {
        int choice = choices[i];
        // Prune: do not choose an element more than once
        if (!selected[i]) {
            // Try: make a choice and update the state
            selected[i] = true;
            state[stateSize] = choice;
            // Proceed to the next choice
            backtrack(state, stateSize + 1, choices, choicesSize, selected, res, resSize);
            // Backtrack: undo the choice and restore the previous state
            selected[i] = false;
        }
    }
}

/* Permutations I */
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

/* Driver code */
int main() {
    int nums[] = {1, 2, 3};
    int numsSize = sizeof(nums) / sizeof(nums[0]);
    int returnSize;

    int **res = permutationsI(nums, numsSize, &returnSize);

    printf("Input array nums = ");
    printArray(nums, numsSize);
    printf("\nAll permutations res = \n");
    for (int i = 0; i < returnSize; i++) {
        printArray(res[i], numsSize);
    }

    // Free memory
    for (int i = 0; i < returnSize; i++) {
        free(res[i]);
    }
    free(res);

    return 0;
}
