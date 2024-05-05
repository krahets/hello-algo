/**
 * File: edit_distance.java
 * Created Time: 2023-07-13
 * Author: krahets (krahets@163.com)
 */

package chapter_dynamic_programming;

import java.util.Arrays;

public class edit_distance {
    /* Edit distance: Brute force search */
    static int editDistanceDFS(String s, String t, int i, int j) {
        // If both s and t are empty, return 0
        if (i == 0 && j == 0)
            return 0;
        // If s is empty, return the length of t
        if (i == 0)
            return j;
        // If t is empty, return the length of s
        if (j == 0)
            return i;
        // If the two characters are equal, skip these two characters
        if (s.charAt(i - 1) == t.charAt(j - 1))
            return editDistanceDFS(s, t, i - 1, j - 1);
        // The minimum number of edits = the minimum number of edits from three operations (insert, remove, replace) + 1
        int insert = editDistanceDFS(s, t, i, j - 1);
        int delete = editDistanceDFS(s, t, i - 1, j);
        int replace = editDistanceDFS(s, t, i - 1, j - 1);
        // Return the minimum number of edits
        return Math.min(Math.min(insert, delete), replace) + 1;
    }

    /* Edit distance: Memoized search */
    static int editDistanceDFSMem(String s, String t, int[][] mem, int i, int j) {
        // If both s and t are empty, return 0
        if (i == 0 && j == 0)
            return 0;
        // If s is empty, return the length of t
        if (i == 0)
            return j;
        // If t is empty, return the length of s
        if (j == 0)
            return i;
        // If there is a record, return it
        if (mem[i][j] != -1)
            return mem[i][j];
        // If the two characters are equal, skip these two characters
        if (s.charAt(i - 1) == t.charAt(j - 1))
            return editDistanceDFSMem(s, t, mem, i - 1, j - 1);
        // The minimum number of edits = the minimum number of edits from three operations (insert, remove, replace) + 1
        int insert = editDistanceDFSMem(s, t, mem, i, j - 1);
        int delete = editDistanceDFSMem(s, t, mem, i - 1, j);
        int replace = editDistanceDFSMem(s, t, mem, i - 1, j - 1);
        // Record and return the minimum number of edits
        mem[i][j] = Math.min(Math.min(insert, delete), replace) + 1;
        return mem[i][j];
    }

    /* Edit distance: Dynamic programming */
    static int editDistanceDP(String s, String t) {
        int n = s.length(), m = t.length();
        int[][] dp = new int[n + 1][m + 1];
        // State transition: first row and first column
        for (int i = 1; i <= n; i++) {
            dp[i][0] = i;
        }
        for (int j = 1; j <= m; j++) {
            dp[0][j] = j;
        }
        // State transition: the rest of the rows and columns
        for (int i = 1; i <= n; i++) {
            for (int j = 1; j <= m; j++) {
                if (s.charAt(i - 1) == t.charAt(j - 1)) {
                    // If the two characters are equal, skip these two characters
                    dp[i][j] = dp[i - 1][j - 1];
                } else {
                    // The minimum number of edits = the minimum number of edits from three operations (insert, remove, replace) + 1
                    dp[i][j] = Math.min(Math.min(dp[i][j - 1], dp[i - 1][j]), dp[i - 1][j - 1]) + 1;
                }
            }
        }
        return dp[n][m];
    }

    /* Edit distance: Space-optimized dynamic programming */
    static int editDistanceDPComp(String s, String t) {
        int n = s.length(), m = t.length();
        int[] dp = new int[m + 1];
        // State transition: first row
        for (int j = 1; j <= m; j++) {
            dp[j] = j;
        }
        // State transition: the rest of the rows
        for (int i = 1; i <= n; i++) {
            // State transition: first column
            int leftup = dp[0]; // Temporarily store dp[i-1, j-1]
            dp[0] = i;
            // State transition: the rest of the columns
            for (int j = 1; j <= m; j++) {
                int temp = dp[j];
                if (s.charAt(i - 1) == t.charAt(j - 1)) {
                    // If the two characters are equal, skip these two characters
                    dp[j] = leftup;
                } else {
                    // The minimum number of edits = the minimum number of edits from three operations (insert, remove, replace) + 1
                    dp[j] = Math.min(Math.min(dp[j - 1], dp[j]), leftup) + 1;
                }
                leftup = temp; // Update for the next round of dp[i-1, j-1]
            }
        }
        return dp[m];
    }

    public static void main(String[] args) {
        String s = "bag";
        String t = "pack";
        int n = s.length(), m = t.length();

        // Brute force search
        int res = editDistanceDFS(s, t, n, m);
        System.out.println("Changing " + s + " to " + t + " requires a minimum of " + res + " edits");

        // Memoized search
        int[][] mem = new int[n + 1][m + 1];
        for (int[] row : mem)
            Arrays.fill(row, -1);
        res = editDistanceDFSMem(s, t, mem, n, m);
        System.out.println("Changing " + s + " to " + t + " requires a minimum of " + res + " edits");

        // Dynamic programming
        res = editDistanceDP(s, t);
        System.out.println("Changing " + s + " to " + t + " requires a minimum of " + res + " edits");

        // Space-optimized dynamic programming
        res = editDistanceDPComp(s, t);
        System.out.println("Changing " + s + " to " + t + " requires a minimum of " + res + " edits");
    }
}
