/**
 * File: edit_distance.java
 * Created Time: 2023-07-13
 * Author: krahets (krahets@163.com)
 */

package chapter_dynamic_programming;

import java.util.Arrays;

public class edit_distance {
    /* Edit distance: brute-force search */
    static int editDistanceDFS(String s, String t, int i, int j) {
        // If the current prefixes of s and t are both empty, return 0
        if (i == 0 && j == 0)
            return 0;
        // If the current prefix of s is empty, return j, the length of the current prefix of t
        if (i == 0)
            return j;
        // If the current prefix of t is empty, return i, the length of the current prefix of s
        if (j == 0)
            return i;
        // If the two characters are equal, skip both of them
        if (s.charAt(i - 1) == t.charAt(j - 1))
            return editDistanceDFS(s, t, i - 1, j - 1);
        // Minimum edits = the minimum among the insertion, deletion, and replacement subproblems + 1
        int insert = editDistanceDFS(s, t, i, j - 1);
        int delete = editDistanceDFS(s, t, i - 1, j);
        int replace = editDistanceDFS(s, t, i - 1, j - 1);
        // Return the minimum number of edits
        return Math.min(Math.min(insert, delete), replace) + 1;
    }

    /* Edit distance: memoized search */
    static int editDistanceDFSMem(String s, String t, int[][] mem, int i, int j) {
        // If the current prefixes of s and t are both empty, return 0
        if (i == 0 && j == 0)
            return 0;
        // If the current prefix of s is empty, return j, the length of the current prefix of t
        if (i == 0)
            return j;
        // If the current prefix of t is empty, return i, the length of the current prefix of s
        if (j == 0)
            return i;
        // If a result has already been recorded, return it directly
        if (mem[i][j] != -1)
            return mem[i][j];
        // If the two characters are equal, skip both of them
        if (s.charAt(i - 1) == t.charAt(j - 1))
            return editDistanceDFSMem(s, t, mem, i - 1, j - 1);
        // Minimum edits = the minimum among the insertion, deletion, and replacement subproblems + 1
        int insert = editDistanceDFSMem(s, t, mem, i, j - 1);
        int delete = editDistanceDFSMem(s, t, mem, i - 1, j);
        int replace = editDistanceDFSMem(s, t, mem, i - 1, j - 1);
        // Record and return the minimum number of edits
        mem[i][j] = Math.min(Math.min(insert, delete), replace) + 1;
        return mem[i][j];
    }

    /* Edit distance: dynamic programming */
    static int editDistanceDP(String s, String t) {
        int n = s.length(), m = t.length();
        int[][] dp = new int[n + 1][m + 1];
        // State transitions: first row and first column
        for (int i = 1; i <= n; i++) {
            dp[i][0] = i;
        }
        for (int j = 1; j <= m; j++) {
            dp[0][j] = j;
        }
        // State transitions: remaining rows and columns
        for (int i = 1; i <= n; i++) {
            for (int j = 1; j <= m; j++) {
                if (s.charAt(i - 1) == t.charAt(j - 1)) {
                    // If the two characters are equal, skip both of them
                    dp[i][j] = dp[i - 1][j - 1];
                } else {
                    // Minimum edits = the minimum among the insertion, deletion, and replacement subproblems + 1
                    dp[i][j] = Math.min(Math.min(dp[i][j - 1], dp[i - 1][j]), dp[i - 1][j - 1]) + 1;
                }
            }
        }
        return dp[n][m];
    }

    /* Edit distance: space-optimized dynamic programming */
    static int editDistanceDPComp(String s, String t) {
        int n = s.length(), m = t.length();
        int[] dp = new int[m + 1];
        // State transitions: first row
        for (int j = 1; j <= m; j++) {
            dp[j] = j;
        }
        // State transitions: remaining rows
        for (int i = 1; i <= n; i++) {
            // State transitions: first column
            int leftup = dp[0]; // Temporarily store dp[i-1, j-1]
            dp[0] = i;
            // State transitions: remaining columns
            for (int j = 1; j <= m; j++) {
                int temp = dp[j];
                if (s.charAt(i - 1) == t.charAt(j - 1)) {
                    // If the two characters are equal, skip both of them
                    dp[j] = leftup;
                } else {
                    // Minimum edits = the minimum among the insertion, deletion, and replacement subproblems + 1
                    dp[j] = Math.min(Math.min(dp[j - 1], dp[j]), leftup) + 1;
                }
                leftup = temp; // Update to dp[i-1, j-1] for the next iteration
            }
        }
        return dp[m];
    }

    public static void main(String[] args) {
        String s = "bag";
        String t = "pack";
        int n = s.length(), m = t.length();

        // Brute-force search
        int res = editDistanceDFS(s, t, n, m);
        System.out.println("Changing " + s + " to " + t + " requires at least " + res + " edits");

        // Memoized search
        int[][] mem = new int[n + 1][m + 1];
        for (int[] row : mem)
            Arrays.fill(row, -1);
        res = editDistanceDFSMem(s, t, mem, n, m);
        System.out.println("Changing " + s + " to " + t + " requires at least " + res + " edits");

        // Dynamic programming
        res = editDistanceDP(s, t);
        System.out.println("Changing " + s + " to " + t + " requires at least " + res + " edits");

        // Space-optimized dynamic programming
        res = editDistanceDPComp(s, t);
        System.out.println("Changing " + s + " to " + t + " requires at least " + res + " edits");
    }
}
