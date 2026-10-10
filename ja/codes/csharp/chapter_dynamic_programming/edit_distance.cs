/**
* File: edit_distance.cs
* Created Time: 2023-07-14
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_dynamic_programming;

public class edit_distance {
    /* 編集距離：総当たり探索 */
    int EditDistanceDFS(string s, string t, int i, int j) {
        // s と t がともに空なら 0 を返す
        if (i == 0 && j == 0)
            return 0;
        // s が空なら t の長さを返す
        if (i == 0)
            return j;
        // t が空なら s の長さを返す
        if (j == 0)
            return i;
        // 2 つの文字が等しければ、その 2 文字をそのままスキップする
        if (s[i - 1] == t[j - 1])
            return EditDistanceDFS(s, t, i - 1, j - 1);
        // 最小編集回数 = 挿入・削除・置換の 3 操作における最小編集回数 + 1
        int insert = EditDistanceDFS(s, t, i, j - 1);
        int delete = EditDistanceDFS(s, t, i - 1, j);
        int replace = EditDistanceDFS(s, t, i - 1, j - 1);
        // 最小編集回数を返す
        return Math.Min(Math.Min(insert, delete), replace) + 1;
    }

    /* 編集距離：メモ化探索 */
    int EditDistanceDFSMem(string s, string t, int[][] mem, int i, int j) {
        // s と t がともに空なら 0 を返す
        if (i == 0 && j == 0)
            return 0;
        // s が空なら t の長さを返す
        if (i == 0)
            return j;
        // t が空なら s の長さを返す
        if (j == 0)
            return i;
        // 記録済みなら、それをそのまま返す
        if (mem[i][j] != -1)
            return mem[i][j];
        // 2 つの文字が等しければ、その 2 文字をそのままスキップする
        if (s[i - 1] == t[j - 1])
            return EditDistanceDFSMem(s, t, mem, i - 1, j - 1);
        // 最小編集回数 = 挿入・削除・置換の 3 操作における最小編集回数 + 1
        int insert = EditDistanceDFSMem(s, t, mem, i, j - 1);
        int delete = EditDistanceDFSMem(s, t, mem, i - 1, j);
        int replace = EditDistanceDFSMem(s, t, mem, i - 1, j - 1);
        // 最小編集回数を記録して返す
        mem[i][j] = Math.Min(Math.Min(insert, delete), replace) + 1;
        return mem[i][j];
    }

    /* 編集距離：動的計画法 */
    int EditDistanceDP(string s, string t) {
        int n = s.Length, m = t.Length;
        int[,] dp = new int[n + 1, m + 1];
        // 状態遷移：先頭行と先頭列
        for (int i = 1; i <= n; i++) {
            dp[i, 0] = i;
        }
        for (int j = 1; j <= m; j++) {
            dp[0, j] = j;
        }
        // 状態遷移: 残りの行と列
        for (int i = 1; i <= n; i++) {
            for (int j = 1; j <= m; j++) {
                if (s[i - 1] == t[j - 1]) {
                    // 2 つの文字が等しければ、その 2 文字をそのままスキップする
                    dp[i, j] = dp[i - 1, j - 1];
                } else {
                    // 最小編集回数 = 挿入・削除・置換の 3 操作における最小編集回数 + 1
                    dp[i, j] = Math.Min(Math.Min(dp[i, j - 1], dp[i - 1, j]), dp[i - 1, j - 1]) + 1;
                }
            }
        }
        return dp[n, m];
    }

    /* 編集距離：空間最適化した動的計画法 */
    int EditDistanceDPComp(string s, string t) {
        int n = s.Length, m = t.Length;
        int[] dp = new int[m + 1];
        // 状態遷移：先頭行
        for (int j = 1; j <= m; j++) {
            dp[j] = j;
        }
        // 状態遷移：残りの行
        for (int i = 1; i <= n; i++) {
            // 状態遷移：先頭列
            int leftup = dp[0]; // dp[i-1, j-1] を一時保存する
            dp[0] = i;
            // 状態遷移：残りの列
            for (int j = 1; j <= m; j++) {
                int temp = dp[j];
                if (s[i - 1] == t[j - 1]) {
                    // 2 つの文字が等しければ、その 2 文字をそのままスキップする
                    dp[j] = leftup;
                } else {
                    // 最小編集回数 = 挿入・削除・置換の 3 操作における最小編集回数 + 1
                    dp[j] = Math.Min(Math.Min(dp[j - 1], dp[j]), leftup) + 1;
                }
                leftup = temp; // 次の反復の dp[i-1, j-1] に更新する
            }
        }
        return dp[m];
    }

    [Test]
    public void Test() {
        string s = "bag";
        string t = "pack";
        int n = s.Length, m = t.Length;

        // 全探索
        int res = EditDistanceDFS(s, t, n, m);
        Console.WriteLine("" + s + " を " + t + " に変更するには少なくとも " + res + " 回の編集が必要");

        // メモ化探索
        int[][] mem = new int[n + 1][];
        for (int i = 0; i <= n; i++) {
            mem[i] = new int[m + 1];
            Array.Fill(mem[i], -1);
        }

        res = EditDistanceDFSMem(s, t, mem, n, m);
        Console.WriteLine("" + s + " を " + t + " に変更するには少なくとも " + res + " 回の編集が必要");

        // 動的計画法
        res = EditDistanceDP(s, t);
        Console.WriteLine("" + s + " を " + t + " に変更するには少なくとも " + res + " 回の編集が必要");

        // 空間最適化後の動的計画法
        res = EditDistanceDPComp(s, t);
        Console.WriteLine("" + s + " を " + t + " に変更するには少なくとも " + res + " 回の編集が必要");
    }
}
