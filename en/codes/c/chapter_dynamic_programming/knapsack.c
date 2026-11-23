/**
 * File: knapsack.c
 * Created Time: 2023-10-02
 * Author: Zuoxun (845242523@qq.com)
 */

#include "../utils/common.h"

/* Find the maximum */
int myMax(int a, int b) {
    return a > b ? a : b;
}

/* 0-1 knapsack: brute-force search */
int knapsackDFS(int wgt[], int val[], int i, int c) {
    // If all items have been considered or no capacity remains, return value 0
    if (i == 0 || c == 0) {
        return 0;
    }
    // If the item exceeds the remaining capacity, it must be excluded
    if (wgt[i - 1] > c) {
        return knapsackDFS(wgt, val, i - 1, c);
    }
    // Calculate the maximum values obtained by excluding and including item i
    int no = knapsackDFS(wgt, val, i - 1, c);
    int yes = knapsackDFS(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1];
    // Return the larger value from the two choices
    return myMax(no, yes);
}

/* 0-1 knapsack: memoized search */
int knapsackDFSMem(int wgt[], int val[], int memCols, int **mem, int i, int c) {
    // If all items have been considered or no capacity remains, return value 0
    if (i == 0 || c == 0) {
        return 0;
    }
    // If a result has already been recorded, return it directly
    if (mem[i][c] != -1) {
        return mem[i][c];
    }
    // If the item exceeds the remaining capacity, it must be excluded
    if (wgt[i - 1] > c) {
        return knapsackDFSMem(wgt, val, memCols, mem, i - 1, c);
    }
    // Calculate the maximum values obtained by excluding and including item i
    int no = knapsackDFSMem(wgt, val, memCols, mem, i - 1, c);
    int yes = knapsackDFSMem(wgt, val, memCols, mem, i - 1, c - wgt[i - 1]) + val[i - 1];
    // Record and return the larger value from the two choices
    mem[i][c] = myMax(no, yes);
    return mem[i][c];
}

/* 0-1 knapsack: dynamic programming */
int knapsackDP(int wgt[], int val[], int cap, int wgtSize) {
    int n = wgtSize;
    // Initialize the dp table
    int **dp = malloc((n + 1) * sizeof(int *));
    for (int i = 0; i <= n; i++) {
        dp[i] = calloc(cap + 1, sizeof(int));
    }
    // State transitions
    for (int i = 1; i <= n; i++) {
        for (int c = 1; c <= cap; c++) {
            if (wgt[i - 1] > c) {
                // If item i exceeds the remaining capacity, do not choose it
                dp[i][c] = dp[i - 1][c];
            } else {
                // Take the larger value obtained by excluding and including item i
                dp[i][c] = myMax(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1]);
            }
        }
    }
    int res = dp[n][cap];
    // Free memory
    for (int i = 0; i <= n; i++) {
        free(dp[i]);
    }
    return res;
}

/* 0-1 knapsack: space-optimized dynamic programming */
int knapsackDPComp(int wgt[], int val[], int cap, int wgtSize) {
    int n = wgtSize;
    // Initialize the dp table
    int *dp = calloc(cap + 1, sizeof(int));
    // State transitions
    for (int i = 1; i <= n; i++) {
        // Traverse in decreasing order
        for (int c = cap; c >= 1; c--) {
            if (wgt[i - 1] <= c) {
                // Take the larger value obtained by excluding and including item i
                dp[c] = myMax(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
            }
        }
    }
    int res = dp[cap];
    // Free memory
    free(dp);
    return res;
}

/* Driver code */
int main() {
    int wgt[] = {10, 20, 30, 40, 50};
    int val[] = {50, 120, 150, 210, 240};
    int cap = 50;
    int n = sizeof(wgt) / sizeof(wgt[0]);
    int wgtSize = n;

    // Brute-force search
    int res = knapsackDFS(wgt, val, n, cap);
    printf("Maximum item value within the knapsack capacity: %d\n", res);

    // Memoized search
    int **mem = malloc((n + 1) * sizeof(int *));
    for (int i = 0; i <= n; i++) {
        mem[i] = malloc((cap + 1) * sizeof(int));
        memset(mem[i], -1, (cap + 1) * sizeof(int));
    }
    res = knapsackDFSMem(wgt, val, cap + 1, mem, n, cap);
    printf("Maximum item value within the knapsack capacity: %d\n", res);
    // Free memory
    for (int i = 0; i <= n; i++) {
        free(mem[i]);
    }
    free(mem);

    // Dynamic programming
    res = knapsackDP(wgt, val, cap, wgtSize);
    printf("Maximum item value within the knapsack capacity: %d\n", res);

    // Space-optimized dynamic programming
    res = knapsackDPComp(wgt, val, cap, wgtSize);
    printf("Maximum item value within the knapsack capacity: %d\n", res);

    return 0;
}
