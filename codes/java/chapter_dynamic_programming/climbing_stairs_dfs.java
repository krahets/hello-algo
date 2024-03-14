/**
 * File: climbing_stairs_dfs.java
 * Created Time: 2023-06-30
 * Author: krahets (krahets@163.com)
 */

package chapter_dynamic_programming;

public class climbing_stairs_dfs {
    /* 搜索 */
    public static int dfs(int i) {
        // 已知 dp[1] 和 dp[2] ，返回之
        if (i == 1 || i == 2)
            return i;
        // dp[i] = dp[i-1] + dp[i-2]
        int count = dfs(i - 1) + dfs(i - 2);
        return count;
    }

    /* 爬楼梯：搜索 */
    public static int climbingStairsDFS(int n) {
        return dfs(n);
    }

    public static void main(String[] args) {
        int n = 9;

        int res = climbingStairsDFS(n);
        System.out.println(String.format("爬 %d 阶楼梯共有 %d 种方案", n, res));
    }
}
