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
        // dp[1] と dp[2] は既知なので返す
        if (i == 1 || i == 2)
            return i;
        // dp[i] の記録があれば、それをそのまま返す
        if (mem[i] != -1)
            return mem[i];
        // dp[i] = dp[i-1] + dp[i-2]
        int count = dfs(i - 1, mem) + dfs(i - 2, mem);
        // dp[i] を記録する
        mem[i] = count;
        return count;
    }

    /* 階段登り：メモ化探索 */
    public static int climbingStairsDFSMem(int n) {
        // mem[i] は第 i 段まで上る方法の総数を記録し、-1 は未記録を表す
        int[] mem = new int[n + 1];
        Arrays.fill(mem, -1);
        return dfs(n, mem);
    }

    public static void main(String[] args) {
        int n = 9;

        int res = climbingStairsDFSMem(n);
        System.out.println(String.format("%d 段の階段の登り方は全部で %d 通り", n, res));
    }
}