/**
 * File: edit_distance.c
 * Created Time: 2023-10-02
 * Author: Zuoxun (845242523@qq.com)
 */

#include "../utils/common.h"

/* Find minimum value */
int myMin(int a, int b) {
    return a < b ? a : b;
}

/* Edit distance: Brute-force search */
int editDistanceDFS(char *s, char *t, int i, int j) {    
    // If both s and t are empty, return 0
    if (i == 0 && j == 0)
        return 0;
    // If s is empty, return length of t
    if (i == 0)
        return j;
    // If t is empty, return length of s
    if (j == 0)
        return i;
    // If two characters are equal, skip both characters
    if (s[i - 1] == t[j - 1])
        return editDistanceDFS(s, t, i - 1, j - 1);
    // Minimum edit steps = minimum edit steps of insert, delete, replace + 1
    int insert = editDistanceDFS(s, t, i, j - 1);
    int del = editDistanceDFS(s, t, i - 1, j);
    int replace = editDistanceDFS(s, t, i - 1, j - 1);
    // Return minimum edit steps
    return myMin(myMin(insert, del), replace) + 1;
}

/* Edit distance: Memoization search */
int editDistanceDFSMem(char *s, char *t, int memCols, int **mem, int i, int j) {
    // If both s and t are empty, return 0
    if (i == 0 && j == 0)
        return 0;
    // If s is empty, return length of t
    if (i == 0)
        return j;
    // If t is empty, return length of s
    if (j == 0)
        return i;
    // If there's a record, return it directly
    if (mem[i][j] != -1)
        return mem[i][j];
    // If two characters are equal, skip both characters
    if (s[i - 1] == t[j - 1])
        return editDistanceDFSMem(s, t, memCols, mem, i - 1, j - 1);
    // Minimum edit steps = minimum edit steps of insert, delete, replace + 1
    int insert = editDistanceDFSMem(s, t, memCols, mem, i, j - 1);
    int del = editDistanceDFSMem(s, t, memCols, mem, i - 1, j);
    int replace = editDistanceDFSMem(s, t, memCols, mem, i - 1, j - 1);
    // Record and return minimum edit steps
    mem[i][j] = myMin(myMin(insert, del), replace) + 1;
    return mem[i][j];
}

/* Edit distance: Dynamic programming */
int editDistanceDP(char *s, char *t, int n, int m) {
    int **dp = malloc((n + 1) * sizeof(int *));
    for (int i = 0; i <= n; i++) {
        dp[i] = calloc(m + 1, sizeof(int));
    }
    // State transition: first row and first column
    for (int i = 1; i <= n; i++) {
        dp[i][0] = i;
    }
    for (int j = 1; j <= m; j++) {
        dp[0][j] = j;
    }
    // State transition: rest of the rows and columns
    for (int i = 1; i <= n; i++) {
        for (int j = 1; j <= m; j++) {
            if (s[i - 1] == t[j - 1]) {
                // If two characters are equal, skip both characters
                dp[i][j] = dp[i - 1][j - 1];
            } else {
                // Minimum edit steps = minimum edit steps of insert, delete, replace + 1
                dp[i][j] = myMin(myMin(dp[i][j - 1], dp[i - 1][j]), dp[i - 1][j - 1]) + 1;
            }
        }
    }
    int res = dp[n][m];
    // Free memory
    for (int i = 0; i <= n; i++) {
        free(dp[i]);
    }
    return res;
}

/* Edit distance: Space-optimized dynamic programming */
int editDistanceDPComp(char *s, char *t, int n, int m) {
    int *dp = calloc(m + 1, sizeof(int));
    // State transition: first row
    for (int j = 1; j <= m; j++) {
        dp[j] = j;
    }
    // State transition: rest of the rows
    for (int i = 1; i <= n; i++) {
        // State transition: first column
        int leftup = dp[0]; // Temporarily store dp[i-1, j-1]
        dp[0] = i;
        // State transition: rest of the columns
        for (int j = 1; j <= m; j++) {
            int temp = dp[j];
            if (s[i - 1] == t[j - 1]) {
                // If two characters are equal, skip both characters
                dp[j] = leftup;
            } else {
                // Minimum edit steps = minimum edit steps of insert, delete, replace + 1
                dp[j] = myMin(myMin(dp[j - 1], dp[j]), leftup) + 1;
            }
            leftup = temp; // Update for next round's dp[i-1, j-1]
        }
    }
    int res = dp[m];
    // Free memory
    free(dp);
    return res;
}

/* Driver Code */
int main() {
    char *s = "bag";
    char *t = "pack";
    int n = strlen(s), m = strlen(t);

    // Brute-force search
    int res = editDistanceDFS(s, t, n, m);
    printf("Changing %s to %s requires a minimum of %d edits\n", s, t, res);

    // Memoization search
    int **mem = malloc((n + 1) * sizeof(int *));
    for (int i = 0; i <= n; i++) {
        mem[i] = malloc((m + 1) * sizeof(int));
        memset(mem[i], -1, (m + 1) * sizeof(int));
    }
    res = editDistanceDFSMem(s, t, m + 1, mem, n, m);
    printf("Changing %s to %s requires a minimum of %d edits\n", s, t, res);
    // Free memory
    for (int i = 0; i <= n; i++) {
        free(mem[i]);
    }
    free(mem);

    // Dynamic programming
    res = editDistanceDP(s, t, n, m);
    printf("Changing %s to %s requires a minimum of %d edits\n", s, t, res);

    // Space-optimized dynamic programming
    res = editDistanceDPComp(s, t, n, m);
    printf("Changing %s to %s requires a minimum of %d edits\n", s, t, res);

    return 0;
}
