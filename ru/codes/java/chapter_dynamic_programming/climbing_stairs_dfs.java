/**
 * File: climbing_stairs_dfs.java
 * Created Time: 2023-06-30
 * Author: krahets (krahets@163.com)
 */

package chapter_dynamic_programming;

public class climbing_stairs_dfs {
    /* Поиск */
    public static int dfs(int i) {
        // dp[1] и dp[2] уже известны, вернуть их
        if (i == 1 || i == 2)
            return i;
        // dp[i] = dp[i-1] + dp[i-2]
        int count = dfs(i - 1) + dfs(i - 2);
        return count;
    }

    /* Подъем по лестнице: поиск */
    public static int climbingStairsDFS(int n) {
        return dfs(n);
    }

    public static void main(String[] args) {
        int n = 9;

        int res = climbingStairsDFS(n);
        System.out.println(String.format("Количество способов подняться по лестнице из %d ступеней: %d", n, res));
    }
}
