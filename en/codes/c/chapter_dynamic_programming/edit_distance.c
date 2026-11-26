/**
 * File: edit_distance.c
 * Created Time: 2023-10-02
 * Author: Zuoxun (845242523@qq.com)
 */

#include "../utils/common.h"

/* Find the minimum */
int myMin(int a, int b) {
    return a < b ? a : b;
}

/* Edit distance with brute-force search */
int editDistanceDFS(char *s, char *t, int i, int j) {    
    // Return 0 if both s and t are empty
    if (i == 0 && j == 0)
        return 0;
    // Return the length of t if s is empty
    if (i == 0)
        return j;
    // Return the length of s if t is empty
    if (j == 0)
        return i;
    // Skip both characters if they match
    if (s[i - 1] == t[j - 1])
        return editDistanceDFS(s, t, i - 1, j - 1);
    // Minimum edits = 1 + the smallest remaining edit count after an insertion, deletion, or replacement
    int insert = editDistanceDFS(s, t, i, j - 1);
    int del = editDistanceDFS(s, t, i - 1, j);
    int replace = editDistanceDFS(s, t, i - 1, j - 1);
    // Return the minimum number of edits
    return myMin(myMin(insert, del), replace) + 1;
}

/* Edit distance with memoized search */
int editDistanceDFSMem(char *s, char *t, int memCols, int **mem, int i, int j) {
    // Return 0 if both s and t are empty
    if (i == 0 && j == 0)
        return 0;
    // Return the length of t if s is empty
    if (i == 0)
        return j;
    // Return the length of s if t is empty
    if (j == 0)
        return i;
    // Return the cached result if available
    if (mem[i][j] != -1)
        return mem[i][j];
    // Skip both characters if they match
    if (s[i - 1] == t[j - 1])
        return editDistanceDFSMem(s, t, memCols, mem, i - 1, j - 1);
    // Minimum edits = 1 + the smallest remaining edit count after an insertion, deletion, or replacement
    int insert = editDistanceDFSMem(s, t, memCols, mem, i, j - 1);
    int del = editDistanceDFSMem(s, t, memCols, mem, i - 1, j);
    int replace = editDistanceDFSMem(s, t, memCols, mem, i - 1, j - 1);
    // Cache and return the minimum number of edits
    mem[i][j] = myMin(myMin(insert, del), replace) + 1;
    return mem[i][j];
}

/* Edit distance with dynamic programming */
int editDistanceDP(char *s, char *t, int n, int m) {
    int **dp = malloc((n + 1) * sizeof(int *));
    for (int i = 0; i <= n; i++) {
        dp[i] = calloc(m + 1, sizeof(int));
    }
    // State transitions for the first row and column
    for (int i = 1; i <= n; i++) {
        dp[i][0] = i;
    }
    for (int j = 1; j <= m; j++) {
        dp[0][j] = j;
    }
    // State transitions for the remaining rows and columns
    for (int i = 1; i <= n; i++) {
        for (int j = 1; j <= m; j++) {
            if (s[i - 1] == t[j - 1]) {
                // Skip both characters if they match
                dp[i][j] = dp[i - 1][j - 1];
            } else {
                // Minimum edits = 1 + the smallest remaining edit count after an insertion, deletion, or replacement
                dp[i][j] = myMin(myMin(dp[i][j - 1], dp[i - 1][j]), dp[i - 1][j - 1]) + 1;
            }
        }
    }
    int res = dp[n][m];
    // Free the memory
    for (int i = 0; i <= n; i++) {
        free(dp[i]);
    }
    return res;
}

/* Edit distance with space-optimized dynamic programming */
int editDistanceDPComp(char *s, char *t, int n, int m) {
    int *dp = calloc(m + 1, sizeof(int));
    // State transitions for the first row
    for (int j = 1; j <= m; j++) {
        dp[j] = j;
    }
    // State transitions for the remaining rows
    for (int i = 1; i <= n; i++) {
        // State transitions for the first column
        int leftup = dp[0]; // Save dp[i-1, j-1] temporarily
        dp[0] = i;
        // State transitions for the remaining columns
        for (int j = 1; j <= m; j++) {
            int temp = dp[j];
            if (s[i - 1] == t[j - 1]) {
                // Skip both characters if they match
                dp[j] = leftup;
            } else {
                // Minimum edits = 1 + the smallest remaining edit count after an insertion, deletion, or replacement
                dp[j] = myMin(myMin(dp[j - 1], dp[j]), leftup) + 1;
            }
            leftup = temp; // Update the saved value to hold dp[i-1, j-1] for the next iteration
        }
    }
    int res = dp[m];
    // Free the memory
    free(dp);
    return res;
}

/* Driver code */
int main() {
    char *s = "bag";
    char *t = "pack";
    int n = strlen(s), m = strlen(t);

    // Brute-force search
    int res = editDistanceDFS(s, t, n, m);
    printf("Changing %s to %s requires at least %d edits\n", s, t, res);

    // Memoized search
    int **mem = malloc((n + 1) * sizeof(int *));
    for (int i = 0; i <= n; i++) {
        mem[i] = malloc((m + 1) * sizeof(int));
        memset(mem[i], -1, (m + 1) * sizeof(int));
    }
    res = editDistanceDFSMem(s, t, m + 1, mem, n, m);
    printf("Changing %s to %s requires at least %d edits\n", s, t, res);
    // Free the memory
    for (int i = 0; i <= n; i++) {
        free(mem[i]);
    }
    free(mem);

    // Dynamic programming
    res = editDistanceDP(s, t, n, m);
    printf("Changing %s to %s requires at least %d edits\n", s, t, res);

    // Space-optimized dynamic programming
    res = editDistanceDPComp(s, t, n, m);
    printf("Changing %s to %s requires at least %d edits\n", s, t, res);

    return 0;
}
