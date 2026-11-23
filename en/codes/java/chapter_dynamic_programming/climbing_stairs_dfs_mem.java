/**
 * File: climbing_stairs_dfs_mem.java
 * Created Time: 2023-06-30
 * Author: krahets (krahets@163.com)
 */

package chapter_dynamic_programming;

import java.util.Arrays;

public class climbing_stairs_dfs_mem {
    /* Memoized search */
    public static int dfs(int i, int[] mem) {
        // The values of dp[1] and dp[2] are known; return them
        if (i == 1 || i == 2)
            return i;
        // If dp[i] has been recorded, return it directly
        if (mem[i] != -1)
            return mem[i];
        // dp[i] = dp[i-1] + dp[i-2]
        int count = dfs(i - 1, mem) + dfs(i - 2, mem);
        // Record dp[i]
        mem[i] = count;
        return count;
    }

    /* Climbing stairs: memoized search */
    public static int climbingStairsDFSMem(int n) {
        // mem[i] stores the number of ways to reach step i; -1 means no result has been recorded
        int[] mem = new int[n + 1];
        Arrays.fill(mem, -1);
        return dfs(n, mem);
    }

    public static void main(String[] args) {
        int n = 9;

        int res = climbingStairsDFSMem(n);
        System.out.println(String.format("Number of ways to climb %d stairs: %d", n, res));
    }
}