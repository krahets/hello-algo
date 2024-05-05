/**
 * File: climbing_stairs_backtrack.c
 * Created Time: 2023-09-22
 * Author: huawuque404 (huawuque404@163.com)
 */

#include "../utils/common.h"

/* Backtracking */
void backtrack(int *choices, int state, int n, int *res, int len) {
    // When climbing to the nth step, add 1 to the number of solutions
    if (state == n)
        res[0]++;
    // Traverse all choices
    for (int i = 0; i < len; i++) {
        int choice = choices[i];
        // Pruning: do not allow climbing beyond the nth step
        if (state + choice > n)
            continue;
        // Attempt: make a choice, update the state
        backtrack(choices, state + choice, n, res, len);
        // Retract
    }
}

/* Climbing stairs: Backtracking */
int climbingStairsBacktrack(int n) {
    int choices[2] = {1, 2}; // Can choose to climb up 1 step or 2 steps
    int state = 0;           // Start climbing from the 0th step
    int *res = (int *)malloc(sizeof(int));
    *res = 0; // Use res[0] to record the number of solutions
    int len = sizeof(choices) / sizeof(int);
    backtrack(choices, state, n, res, len);
    int result = *res;
    free(res);
    return result;
}

/* Driver Code */
int main() {
    int n = 9;

    int res = climbingStairsBacktrack(n);
    printf("Climbing %d stairs has %d possible solutions\n", n, res);

    return 0;
}