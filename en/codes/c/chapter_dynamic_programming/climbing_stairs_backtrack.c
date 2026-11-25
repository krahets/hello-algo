/**
 * File: climbing_stairs_backtrack.c
 * Created Time: 2023-09-22
 * Author: huawuque404 (huawuque404@163.com)
 */

#include "../utils/common.h"

/* Backtracking */
void backtrack(int *choices, int state, int n, int *res, int len) {
    // Count one more way when we reach stair n
    if (state == n)
        res[0]++;
    // Iterate over all choices
    for (int i = 0; i < len; i++) {
        int choice = choices[i];
        // Prune moves that would overshoot stair n
        if (state + choice > n)
            continue;
        // Try a choice and update the state
        backtrack(choices, state + choice, n, res, len);
        // Undo the choice
    }
}

/* Climbing stairs with backtracking */
int climbingStairsBacktrack(int n) {
    int choices[2] = {1, 2}; // Each move can climb 1 or 2 stairs
    int state = 0;           // Start at stair 0
    int *res = (int *)malloc(sizeof(int));
    *res = 0; // Store the number of ways in res[0]
    int len = sizeof(choices) / sizeof(int);
    backtrack(choices, state, n, res, len);
    int result = *res;
    free(res);
    return result;
}

/* Driver code */
int main() {
    int n = 9;

    int res = climbingStairsBacktrack(n);
    printf("Ways to climb %d stairs: %d\n", n, res);

    return 0;
}