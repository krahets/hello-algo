/**
 * File: climbing_stairs_dp.java
 * Created Time: 2023-06-30
 * Author: krahets (krahets@163.com)
 */

package chapter_dynamic_programming;

public class climbing_stairs_dp {
    /* 爬樓梯：動態規劃 */
    public static int climbingStairsDP(int n) {
        if (n == 1 || n == 2)
            return n;
        // 初始化 dp 表，用來儲存子問題的解
        int[] dp = new int[n + 1];
        // 初始狀態：設定最小子問題的解
        dp[1] = 1;
        dp[2] = 2;
        // 狀態轉移：從較小的子問題逐步求出較大子問題的解
        for (int i = 3; i <= n; i++) {
            dp[i] = dp[i - 1] + dp[i - 2];
        }
        return dp[n];
    }

    /* 爬樓梯：空間最佳化後的動態規劃 */
    public static int climbingStairsDPComp(int n) {
        if (n == 1 || n == 2)
            return n;
        int a = 1, b = 2;
        for (int i = 3; i <= n; i++) {
            int tmp = b;
            b = a + b;
            a = tmp;
        }
        return b;
    }

    public static void main(String[] args) {
        int n = 9;

        int res = climbingStairsDP(n);
        System.out.println(String.format("爬 %d 階樓梯共有 %d 種走法", n, res));

        res = climbingStairsDPComp(n);
        System.out.println(String.format("爬 %d 階樓梯共有 %d 種走法", n, res));
    }
}
