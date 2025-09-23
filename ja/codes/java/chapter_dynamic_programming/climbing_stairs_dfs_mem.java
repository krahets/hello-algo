/**
 * File: climbing_stairs_dfs_mem.java
 * Created Time: 2023-06-30
 * Author: krahets (krahets@163.com)
 */

package chapter_dynamic_programming;

import java.util.Arrays;

public class climbing_stairs_dfs_mem {
    /* メモ化探索 */
    public static int dfs(int i, int[] mem) {
        // 既知の dp[1] と dp[2] を返す
        if (i == 1 || i == 2)
            return i;
        // dp[i] の記録がある場合、それを返す
        if (mem[i] != -1)
            return mem[i];
        // dp[i] = dp[i-1] + dp[i-2]
        int count = dfs(i - 1, mem) + dfs(i - 2, mem);
        // dp[i] を記録
        mem[i] = count;
        return count;
    }

    /* 階段登り：メモ化探索 */
    public static int climbingStairsDFSMem(int n) {
        // mem[i] は i 段目に登る総解数を記録、-1 は記録なしを意味する
        int[] mem = new int[n + 1];
        Arrays.fill(mem, -1);
        return dfs(n, mem);
    }

    public static void main(String[] args) {
        int n = 9;

        int res = climbingStairsDFSMem(n);
        System.out.println(String.format("%d段の階段を登る解は%d通りです", n, res));
    }
}