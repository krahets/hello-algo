/**
 * File: climbing_stairs_backtrack.c
 * Created Time: 2023-09-22
 * Author: huawuque404 (huawuque404@163.com)
 */

#include "../utils/common.h"

/* Backtracking */
void backtrack(int *choices, int state, int n, int *res, int len) {
    // When climbing to the n-th stair, add 1 to the solution count
    if (state == n)
        res[0]++;
    // Traverse all choices
    for (int i = 0; i < len; i++) {
        int choice = choices[i];
        // Pruning: not allowed to go beyond the n-th stair
        if (state + choice > n)
            continue;
        // Attempt: make choice, update state
        backtrack(choices, state + choice, n, res, len);
        // Backtrack
    }
}

/* Climbing stairs: Backtracking */
int climbingStairsBacktrack(int n) {
    int choices[2] = {1, 2}; // Can choose to climb up 1 or 2 stairs
    int state = 0;           // Start climbing from the 0-th stair
    int *res = (int *)malloc(sizeof(int));
    *res = 0; // Use res[0] to record the solution count
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
    printf("Climbing %d stairs has %d solutions\n", n, res);

    return 0;
}