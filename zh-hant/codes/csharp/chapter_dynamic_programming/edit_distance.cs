/**
* File: edit_distance.cs
* Created Time: 2023-07-14
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_dynamic_programming;

public class edit_distance {
    /* 編輯距離：暴力搜尋 */
    int EditDistanceDFS(string s, string t, int i, int j) {
        // 若 s 和 t 皆為空字串，回傳 0
        if (i == 0 && j == 0)
            return 0;
        // 若 s 為空字串，回傳 t 的長度
        if (i == 0)
            return j;
        // 若 t 為空字串，回傳 s 的長度
        if (j == 0)
            return i;
        // 若兩個字元相同，直接跳過這兩個字元
        if (s[i - 1] == t[j - 1])
            return EditDistanceDFS(s, t, i - 1, j - 1);
        // 最少編輯步數 = 插入、刪除、取代三種操作對應的最少步數中的最小值 + 1
        int insert = EditDistanceDFS(s, t, i, j - 1);
        int delete = EditDistanceDFS(s, t, i - 1, j);
        int replace = EditDistanceDFS(s, t, i - 1, j - 1);
        // 回傳最少編輯步數
        return Math.Min(Math.Min(insert, delete), replace) + 1;
    }

    /* 編輯距離：記憶化搜尋 */
    int EditDistanceDFSMem(string s, string t, int[][] mem, int i, int j) {
        // 若 s 和 t 皆為空字串，回傳 0
        if (i == 0 && j == 0)
            return 0;
        // 若 s 為空字串，回傳 t 的長度
        if (i == 0)
            return j;
        // 若 t 為空字串，回傳 s 的長度
        if (j == 0)
            return i;
        // 若已有紀錄，直接回傳該值
        if (mem[i][j] != -1)
            return mem[i][j];
        // 若兩個字元相同，直接跳過這兩個字元
        if (s[i - 1] == t[j - 1])
            return EditDistanceDFSMem(s, t, mem, i - 1, j - 1);
        // 最少編輯步數 = 插入、刪除、取代三種操作對應的最少步數中的最小值 + 1
        int insert = EditDistanceDFSMem(s, t, mem, i, j - 1);
        int delete = EditDistanceDFSMem(s, t, mem, i - 1, j);
        int replace = EditDistanceDFSMem(s, t, mem, i - 1, j - 1);
        // 記錄並回傳最少編輯步數
        mem[i][j] = Math.Min(Math.Min(insert, delete), replace) + 1;
        return mem[i][j];
    }

    /* 編輯距離：動態規劃 */
    int EditDistanceDP(string s, string t) {
        int n = s.Length, m = t.Length;
        int[,] dp = new int[n + 1, m + 1];
        // 狀態轉移：第一列和第一欄
        for (int i = 1; i <= n; i++) {
            dp[i, 0] = i;
        }
        for (int j = 1; j <= m; j++) {
            dp[0, j] = j;
        }
        // 狀態轉移：其餘各列與各欄
        for (int i = 1; i <= n; i++) {
            for (int j = 1; j <= m; j++) {
                if (s[i - 1] == t[j - 1]) {
                    // 若兩個字元相同，直接跳過這兩個字元
                    dp[i, j] = dp[i - 1, j - 1];
                } else {
                    // 最少編輯步數 = 插入、刪除、取代三種操作對應的最少步數中的最小值 + 1
                    dp[i, j] = Math.Min(Math.Min(dp[i, j - 1], dp[i - 1, j]), dp[i - 1, j - 1]) + 1;
                }
            }
        }
        return dp[n, m];
    }

    /* 編輯距離：空間最佳化後的動態規劃 */
    int EditDistanceDPComp(string s, string t) {
        int n = s.Length, m = t.Length;
        int[] dp = new int[m + 1];
        // 狀態轉移：第一列
        for (int j = 1; j <= m; j++) {
            dp[j] = j;
        }
        // 狀態轉移：其餘各列
        for (int i = 1; i <= n; i++) {
            // 狀態轉移：第一欄
            int leftup = dp[0]; // 暫存 dp[i-1, j-1]
            dp[0] = i;
            // 狀態轉移：其餘各欄
            for (int j = 1; j <= m; j++) {
                int temp = dp[j];
                if (s[i - 1] == t[j - 1]) {
                    // 若兩個字元相同，直接跳過這兩個字元
                    dp[j] = leftup;
                } else {
                    // 最少編輯步數 = 插入、刪除、取代三種操作對應的最少步數中的最小值 + 1
                    dp[j] = Math.Min(Math.Min(dp[j - 1], dp[j]), leftup) + 1;
                }
                leftup = temp; // 更新為下一輪的 dp[i-1, j-1]
            }
        }
        return dp[m];
    }

    [Test]
    public void Test() {
        string s = "bag";
        string t = "pack";
        int n = s.Length, m = t.Length;

        // 暴力搜尋
        int res = EditDistanceDFS(s, t, n, m);
        Console.WriteLine("將 " + s + " 改成 " + t + " 至少需要編輯 " + res + " 步");

        // 記憶化搜尋
        int[][] mem = new int[n + 1][];
        for (int i = 0; i <= n; i++) {
            mem[i] = new int[m + 1];
            Array.Fill(mem[i], -1);
        }

        res = EditDistanceDFSMem(s, t, mem, n, m);
        Console.WriteLine("將 " + s + " 改成 " + t + " 至少需要編輯 " + res + " 步");

        // 動態規劃
        res = EditDistanceDP(s, t);
        Console.WriteLine("將 " + s + " 改成 " + t + " 至少需要編輯 " + res + " 步");

        // 空間最佳化後的動態規劃
        res = EditDistanceDPComp(s, t);
        Console.WriteLine("將 " + s + " 改成 " + t + " 至少需要編輯 " + res + " 步");
    }
}
