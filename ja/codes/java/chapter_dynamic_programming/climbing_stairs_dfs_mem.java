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
        // 既知の値 dp[1] と dp[2] のうち、該当する方を返す
        if (i == 1 || i == 2)
            return i;
        // dp[i] が記録済みなら、その値を返す
        if (mem[i] != -1)
            return mem[i];
        // dp[i] = dp[i-1] + dp[i-2]
        int count = dfs(i - 1, mem) + dfs(i - 2, mem);
        // dp[i] を記録する
        mem[i] = count;
        return count;
    }

    /* 階段の登り方：メモ化探索 */
    public static int climbingStairsDFSMem(int n) {
        // mem[i] に i 段目までの登り方の総数を記録する。-1 は未記録を表す
        int[] mem = new int[n + 1];
        Arrays.fill(mem, -1);
        return dfs(n, mem);
    }

    public static void main(String[] args) {
        int n = 9;

        int res = climbingStairsDFSMem(n);
        System.out.println(String.format("全 %d 段の階段の登り方は %d 通り", n, res));
    }
}