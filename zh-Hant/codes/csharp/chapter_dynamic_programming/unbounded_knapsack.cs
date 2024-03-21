/**
* File: unbounded_knapsack.cs
* Created Time: 2023-07-12
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_dynamic_programming;

public class unbounded_knapsack {
    /* 完全背包：動態規劃 */
    int UnboundedKnapsackDP(int[] wgt, int[] val, int cap) {
        int n = wgt.Length;
        // 初始化 dp 表
        int[,] dp = new int[n + 1, cap + 1];
        // 狀態轉移
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // 若超過背包容量，則不選物品 i
                    dp[i, c] = dp[i - 1, c];
                } else {
                    // 不選和選物品 i 這兩種方案的較大值
                    dp[i, c] = Math.Max(dp[i - 1, c], dp[i, c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[n, cap];
    }

    /* 完全背包：空間最佳化後的動態規劃 */
    int UnboundedKnapsackDPComp(int[] wgt, int[] val, int cap) {
        int n = wgt.Length;
        // 初始化 dp 表
        int[] dp = new int[cap + 1];
        // 狀態轉移
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // 若超過背包容量，則不選物品 i
                    dp[c] = dp[c];
                } else {
                    // 不選和選物品 i 這兩種方案的較大值
                    dp[c] = Math.Max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[cap];
    }

    [Test]
    public void Test() {
        int[] wgt = [1, 2, 3];
        int[] val = [5, 11, 15];
        int cap = 4;

        // 動態規劃
        int res = UnboundedKnapsackDP(wgt, val, cap);
        Console.WriteLine("不超過背包容量的最大物品價值為 " + res);

        // 空間最佳化後的動態規劃
        res = UnboundedKnapsackDPComp(wgt, val, cap);
        Console.WriteLine("不超過背包容量的最大物品價值為 " + res);
    }
}
