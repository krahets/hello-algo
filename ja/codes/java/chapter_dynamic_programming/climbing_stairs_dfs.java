/**
 * File: climbing_stairs_dfs.java
 * Created Time: 2023-06-30
 * Author: krahets (krahets@163.com)
 */

package chapter_dynamic_programming;

public class climbing_stairs_dfs {
    /* 探索 */
    public static int dfs(int i) {
        // 既知の dp[1] と dp[2] を返す
        if (i == 1 || i == 2)
            return i;
        // dp[i] = dp[i-1] + dp[i-2]
        int count = dfs(i - 1) + dfs(i - 2);
        return count;
    }

    /* 階段登り：探索 */
    public static int climbingStairsDFS(int n) {
        return dfs(n);
    }

    public static void main(String[] args) {
        int n = 9;

        int res = climbingStairsDFS(n);
        System.out.println(String.format("%d段の階段を登る解は%d通りです", n, res));
    }
}