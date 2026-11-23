/**
 * File: climbing_stairs_backtrack.c
 * Created Time: 2023-09-22
 * Author: huawuque404 (huawuque404@163.com)
 */

#include "../utils/common.h"

/* Backtracking */
void backtrack(int *choices, int state, int n, int *res, int len) {
    // When step n is reached, increase the number of ways by 1
    if (state == n)
        res[0]++;
    // Iterate over all choices
    for (int i = 0; i < len; i++) {
        int choice = choices[i];
        // Prune: do not go beyond step n
        if (state + choice > n)
            continue;
        // Try: make a choice and update the state
        backtrack(choices, state + choice, n, res, len);
        // Backtrack
    }
}

/* Climbing stairs: backtracking */
int climbingStairsBacktrack(int n) {
    int choices[2] = {1, 2}; // Choose to climb 1 or 2 steps
    int state = 0;           // Start climbing from step 0
    int *res = (int *)malloc(sizeof(int));
    *res = 0; // Use res[0] to record the number of ways
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
    printf("Number of ways to climb %d stairs: %d\n", n, res);

    return 0;
}