/**
* File: knapsack.cs
* Created Time: 2023-07-07
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_dynamic_programming;

public class knapsack {
    /* 0-1 ナップサック問題：全探索 */
    int KnapsackDFS(int[] weight, int[] val, int i, int c) {
        // すべての品物を選び終えたか、ナップサックの残り容量がなければ、価値 0 を返す
        if (i == 0 || c == 0) {
            return 0;
        }
        // ナップサックの容量を超える場合、入れない選択しかできない
        if (weight[i - 1] > c) {
            return KnapsackDFS(weight, val, i - 1, c);
        }
        // 品物 i を入れない場合と入れる場合の最大価値を計算する
        int no = KnapsackDFS(weight, val, i - 1, c);
        int yes = KnapsackDFS(weight, val, i - 1, c - weight[i - 1]) + val[i - 1];
        // 2 通りの選択のうち、価値が大きいほうを返す
        return Math.Max(no, yes);
    }

    /* 0-1 ナップサック問題：メモ化探索 */
    int KnapsackDFSMem(int[] weight, int[] val, int[][] mem, int i, int c) {
        // すべての品物を選び終えたか、ナップサックの残り容量がなければ、価値 0 を返す
        if (i == 0 || c == 0) {
            return 0;
        }
        // 記録済みなら、その値をそのまま返す
        if (mem[i][c] != -1) {
            return mem[i][c];
        }
        // ナップサックの容量を超える場合、入れない選択しかできない
        if (weight[i - 1] > c) {
            return KnapsackDFSMem(weight, val, mem, i - 1, c);
        }
        // 品物 i を入れない場合と入れる場合の最大価値を計算する
        int no = KnapsackDFSMem(weight, val, mem, i - 1, c);
        int yes = KnapsackDFSMem(weight, val, mem, i - 1, c - weight[i - 1]) + val[i - 1];
        // 2 通りの選択のうち、価値が大きいほうを記録して返す
        mem[i][c] = Math.Max(no, yes);
        return mem[i][c];
    }

    /* 0-1 ナップサック問題：動的計画法 */
    int KnapsackDP(int[] weight, int[] val, int cap) {
        int n = weight.Length;
        // dp テーブルを初期化する
        int[,] dp = new int[n + 1, cap + 1];
        // 状態遷移
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (weight[i - 1] > c) {
                    // ナップサックの容量を超える場合、品物 i を選ばない
                    dp[i, c] = dp[i - 1, c];
                } else {
                    // 品物 i を選ばない場合と選ぶ場合の大きいほうの値
                    dp[i, c] = Math.Max(dp[i - 1, c - weight[i - 1]] + val[i - 1], dp[i - 1, c]);
                }
            }
        }
        return dp[n, cap];
    }

    /* 0-1 ナップサック問題：空間を最適化した動的計画法 */
    int KnapsackDPComp(int[] weight, int[] val, int cap) {
        int n = weight.Length;
        // dp テーブルを初期化する
        int[] dp = new int[cap + 1];
        // 状態遷移
        for (int i = 1; i <= n; i++) {
            // 逆順に走査する
            for (int c = cap; c > 0; c--) {
                if (weight[i - 1] > c) {
                    // ナップサックの容量を超える場合、品物 i を選ばない
                    dp[c] = dp[c];
                } else {
                    // 品物 i を選ばない場合と選ぶ場合の大きいほうの値
                    dp[c] = Math.Max(dp[c], dp[c - weight[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[cap];
    }

    [Test]
    public void Test() {
        int[] weight = [10, 20, 30, 40, 50];
        int[] val = [50, 120, 150, 210, 240];
        int cap = 50;
        int n = weight.Length;

        // 全探索
        int res = KnapsackDFS(weight, val, n, cap);
        Console.WriteLine("ナップサックの容量を超えない品物の最大価値は " + res);

        // メモ化探索
        int[][] mem = new int[n + 1][];
        for (int i = 0; i <= n; i++) {
            mem[i] = new int[cap + 1];
            Array.Fill(mem[i], -1);
        }
        res = KnapsackDFSMem(weight, val, mem, n, cap);
        Console.WriteLine("ナップサックの容量を超えない品物の最大価値は " + res);

        // 動的計画法
        res = KnapsackDP(weight, val, cap);
        Console.WriteLine("ナップサックの容量を超えない品物の最大価値は " + res);

        // 空間を最適化した動的計画法
        res = KnapsackDPComp(weight, val, cap);
        Console.WriteLine("ナップサックの容量を超えない品物の最大価値は " + res);
    }
}
