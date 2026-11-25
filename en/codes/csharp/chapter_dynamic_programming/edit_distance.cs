/**
* File: edit_distance.cs
* Created Time: 2023-07-14
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_dynamic_programming;

public class edit_distance {
    /* Edit distance with brute-force search */
    int EditDistanceDFS(string s, string t, int i, int j) {
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
            return EditDistanceDFS(s, t, i - 1, j - 1);
        // Minimum edits = 1 + the smallest remaining edit count after an insertion, deletion, or replacement
        int insert = EditDistanceDFS(s, t, i, j - 1);
        int delete = EditDistanceDFS(s, t, i - 1, j);
        int replace = EditDistanceDFS(s, t, i - 1, j - 1);
        // Return the minimum number of edits
        return Math.Min(Math.Min(insert, delete), replace) + 1;
    }

    /* Edit distance with memoized search */
    int EditDistanceDFSMem(string s, string t, int[][] mem, int i, int j) {
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
            return EditDistanceDFSMem(s, t, mem, i - 1, j - 1);
        // Minimum edits = 1 + the smallest remaining edit count after an insertion, deletion, or replacement
        int insert = EditDistanceDFSMem(s, t, mem, i, j - 1);
        int delete = EditDistanceDFSMem(s, t, mem, i - 1, j);
        int replace = EditDistanceDFSMem(s, t, mem, i - 1, j - 1);
        // Cache and return the minimum number of edits
        mem[i][j] = Math.Min(Math.Min(insert, delete), replace) + 1;
        return mem[i][j];
    }

    /* Edit distance with dynamic programming */
    int EditDistanceDP(string s, string t) {
        int n = s.Length, m = t.Length;
        int[,] dp = new int[n + 1, m + 1];
        // State transitions for the first row and column
        for (int i = 1; i <= n; i++) {
            dp[i, 0] = i;
        }
        for (int j = 1; j <= m; j++) {
            dp[0, j] = j;
        }
        // State transitions for the remaining rows and columns
        for (int i = 1; i <= n; i++) {
            for (int j = 1; j <= m; j++) {
                if (s[i - 1] == t[j - 1]) {
                    // Skip both characters if they match
                    dp[i, j] = dp[i - 1, j - 1];
                } else {
                    // Minimum edits = 1 + the smallest remaining edit count after an insertion, deletion, or replacement
                    dp[i, j] = Math.Min(Math.Min(dp[i, j - 1], dp[i - 1, j]), dp[i - 1, j - 1]) + 1;
                }
            }
        }
        return dp[n, m];
    }

    /* Edit distance with space-optimized dynamic programming */
    int EditDistanceDPComp(string s, string t) {
        int n = s.Length, m = t.Length;
        int[] dp = new int[m + 1];
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
                    dp[j] = Math.Min(Math.Min(dp[j - 1], dp[j]), leftup) + 1;
                }
                leftup = temp; // Update the saved value to hold dp[i-1, j-1] for the next iteration
            }
        }
        return dp[m];
    }

    [Test]
    public void Test() {
        string s = "bag";
        string t = "pack";
        int n = s.Length, m = t.Length;

        // Brute-force search
        int res = EditDistanceDFS(s, t, n, m);
        Console.WriteLine("Changing " + s + " to " + t + " requires at least " + res + " edits");

        // Memoized search
        int[][] mem = new int[n + 1][];
        for (int i = 0; i <= n; i++) {
            mem[i] = new int[m + 1];
            Array.Fill(mem[i], -1);
        }

        res = EditDistanceDFSMem(s, t, mem, n, m);
        Console.WriteLine("Changing " + s + " to " + t + " requires at least " + res + " edits");

        // Dynamic programming
        res = EditDistanceDP(s, t);
        Console.WriteLine("Changing " + s + " to " + t + " requires at least " + res + " edits");

        // Space-optimized dynamic programming
        res = EditDistanceDPComp(s, t);
        Console.WriteLine("Changing " + s + " to " + t + " requires at least " + res + " edits");
    }
}
