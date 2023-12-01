/**
* File: edit_distance.cs
* Created Time: 2023-07-14
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_dynamic_programming;

public class edit_distance {
    /* 编辑距离：暴力搜索 */
    int EditDistanceDFS(string s, string t, int i, int j) {
        // 若 s 和 t 都为空，则返回 0
        if (i == 0 && j == 0)
            return 0;
        // 若 s 为空，则返回 t 长度
        if (i == 0)
            return j;
        // 若 t 为空，则返回 s 长度
        if (j == 0)
            return i;
        // 若两字符相等，则直接跳过此两字符
        if (s[i - 1] == t[j - 1])
            return EditDistanceDFS(s, t, i - 1, j - 1);
        // 最少编辑步数 = 插入、删除、替换这三种操作的最少编辑步数 + 1
        int insert = EditDistanceDFS(s, t, i, j - 1);
        int delete = EditDistanceDFS(s, t, i - 1, j);
        int replace = EditDistanceDFS(s, t, i - 1, j - 1);
        // 返回最少编辑步数
        return Math.Min(Math.Min(insert, delete), replace) + 1;
    }

    /* 编辑距离：记忆化搜索 */
    int EditDistanceDFSMem(string s, string t, int[][] mem, int i, int j) {
        // 若 s 和 t 都为空，则返回 0
        if (i == 0 && j == 0)
            return 0;
        // 若 s 为空，则返回 t 长度
        if (i == 0)
            return j;
        // 若 t 为空，则返回 s 长度
        if (j == 0)
            return i;
        // 若已有记录，则直接返回之
        if (mem[i][j] != -1)
            return mem[i][j];
        // 若两字符相等，则直接跳过此两字符
        if (s[i - 1] == t[j - 1])
            return EditDistanceDFSMem(s, t, mem, i - 1, j - 1);
        // 最少编辑步数 = 插入、删除、替换这三种操作的最少编辑步数 + 1
        int insert = EditDistanceDFSMem(s, t, mem, i, j - 1);
        int delete = EditDistanceDFSMem(s, t, mem, i - 1, j);
        int replace = EditDistanceDFSMem(s, t, mem, i - 1, j - 1);
        // 记录并返回最少编辑步数
        mem[i][j] = Math.Min(Math.Min(insert, delete), replace) + 1;
        return mem[i][j];
    }

    /* 编辑距离：动态规划 */
    int EditDistanceDP(string s, string t) {
        int n = s.Length, m = t.Length;
        int[,] dp = new int[n + 1, m + 1];
        // 状态转移：首行首列
        for (int i = 1; i <= n; i++) {
            dp[i, 0] = i;
        }
        for (int j = 1; j <= m; j++) {
            dp[0, j] = j;
        }
        // 状态转移：其余行和列
        for (int i = 1; i <= n; i++) {
            for (int j = 1; j <= m; j++) {
                if (s[i - 1] == t[j - 1]) {
                    // 若两字符相等，则直接跳过此两字符
                    dp[i, j] = dp[i - 1, j - 1];
                } else {
                    // 最少编辑步数 = 插入、删除、替换这三种操作的最少编辑步数 + 1
                    dp[i, j] = Math.Min(Math.Min(dp[i, j - 1], dp[i - 1, j]), dp[i - 1, j - 1]) + 1;
                }
            }
        }
        return dp[n, m];
    }

    /* 编辑距离：空间优化后的动态规划 */
    int EditDistanceDPComp(string s, string t) {
        int n = s.Length, m = t.Length;
        int[] dp = new int[m + 1];
        // 状态转移：首行
        for (int j = 1; j <= m; j++) {
            dp[j] = j;
        }
        // 状态转移：其余行
        for (int i = 1; i <= n; i++) {
            // 状态转移：首列
            int leftup = dp[0]; // 暂存 dp[i-1, j-1]
            dp[0] = i;
            // 状态转移：其余列
            for (int j = 1; j <= m; j++) {
                int temp = dp[j];
                if (s[i - 1] == t[j - 1]) {
                    // 若两字符相等，则直接跳过此两字符
                    dp[j] = leftup;
                } else {
                    // 最少编辑步数 = 插入、删除、替换这三种操作的最少编辑步数 + 1
                    dp[j] = Math.Min(Math.Min(dp[j - 1], dp[j]), leftup) + 1;
                }
                leftup = temp; // 更新为下一轮的 dp[i-1, j-1]
            }
        }
        return dp[m];
    }

    [Test]
    public void Test() {
        string s = "bag";
        string t = "pack";
        int n = s.Length, m = t.Length;

        // 暴力搜索
        int res = EditDistanceDFS(s, t, n, m);
        Console.WriteLine("将 " + s + " 更改为 " + t + " 最少需要编辑 " + res + " 步");

        // 记忆化搜索
        int[][] mem = new int[n + 1][];
        for (int i = 0; i <= n; i++) {
            mem[i] = new int[m + 1];
            Array.Fill(mem[i], -1);
        }

        res = EditDistanceDFSMem(s, t, mem, n, m);
        Console.WriteLine("将 " + s + " 更改为 " + t + " 最少需要编辑 " + res + " 步");

        // 动态规划
        res = EditDistanceDP(s, t);
        Console.WriteLine("将 " + s + " 更改为 " + t + " 最少需要编辑 " + res + " 步");

        // 空间优化后的动态规划
        res = EditDistanceDPComp(s, t);
        Console.WriteLine("将 " + s + " 更改为 " + t + " 最少需要编辑 " + res + " 步");
    }
}
