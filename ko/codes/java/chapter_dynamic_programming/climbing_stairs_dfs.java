/**
 * File: climbing_stairs_dfs.java
 * Created Time: 2023-06-30
 * Author: krahets (krahets@163.com)
 */

package chapter_dynamic_programming;

public class climbing_stairs_dfs {
    /* 탐색 */
    public static int dfs(int i) {
        // 이미 아는 dp[1]과 dp[2]의 값 중 해당 값을 반환한다
        if (i == 1 || i == 2)
            return i;
        // dp[i] = dp[i-1] + dp[i-2]
        int count = dfs(i - 1) + dfs(i - 2);
        return count;
    }

    /* 계단 오르기: 탐색 */
    public static int climbingStairsDFS(int n) {
        return dfs(n);
    }

    public static void main(String[] args) {
        int n = 9;

        int res = climbingStairsDFS(n);
        System.out.println(String.format("계단 %d개를 오르는 방법은 %d가지", n, res));
    }
}
