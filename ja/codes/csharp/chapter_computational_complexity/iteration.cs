/**
* File: iteration.cs
* Created Time: 2023-08-28
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_computational_complexity;

public class iteration {
    /* for ループ */
    int ForLoop(int n) {
        int res = 0;
        // ループで 1, 2, ..., n-1, n の和を求める
        for (int i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }

    /* while ループ */
    int WhileLoop(int n) {
        int res = 0;
        int i = 1; // 条件変数を初期化する
        // ループで 1, 2, ..., n-1, n の和を求める
        while (i <= n) {
            res += i;
            i += 1; // 条件変数を更新する
        }
        return res;
    }

    /* while ループ（2 回の更新） */
    int WhileLoopII(int n) {
        int res = 0;
        int i = 1; // 条件変数を初期化する
        // ループで 1, 4, 10, ... の和を求める
        while (i <= n) {
            res += i;
            // 条件変数を更新する
            i += 1; 
            i *= 2;
        }
        return res;
    }

    /* 二重 for ループ */
    string NestedForLoop(int n) {
        StringBuilder res = new();
        // i = 1, 2, ..., n-1, n のループ
        for (int i = 1; i <= n; i++) {
            // j = 1, 2, ..., n-1, n のループ
            for (int j = 1; j <= n; j++) {
                res.Append($"({i}, {j}), ");
            }
        }
        return res.ToString();
    }

    /* 実行用コード */
    [Test]
    public void Test() {
        int n = 5;
        int res;

        res = ForLoop(n);
        Console.WriteLine("\nfor ループで求めた和 res = " + res);

        res = WhileLoop(n);
        Console.WriteLine("\nwhile ループで求めた和 res = " + res);

        res = WhileLoopII(n);
        Console.WriteLine("\nwhile ループ（2 回の更新）で求めた和 res = " + res);

        string resStr = NestedForLoop(n);
        Console.WriteLine("\n二重 for ループの走査結果 " + resStr);
    }
}
