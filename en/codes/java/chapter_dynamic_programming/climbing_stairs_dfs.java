/**
 * File: climbing_stairs_dfs.java
 * Created Time: 2023-06-30
 * Author: krahets (krahets@163.com)
 */

package chapter_dynamic_programming;

public class climbing_stairs_dfs {
    /* Search */
    public static int dfs(int i) {
        // Known dp[1] and dp[2], return them
        if (i == 1 || i == 2)
            return i;
        // dp[i] = dp[i-1] + dp[i-2]
        int count = dfs(i - 1) + dfs(i - 2);
        return count;
    }

    /* Climbing stairs: Search */
    public static int climbingStairsDFS(int n) {
        return dfs(n);
    }

    public static void main(String[] args) {
        int n = 9;

        int res = climbingStairsDFS(n);
        System.out.println(String.format("There are %d solutions to climb %d stairs", n, res));
    }
}
