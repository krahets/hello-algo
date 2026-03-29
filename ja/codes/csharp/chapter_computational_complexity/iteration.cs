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
        // 1, 2, ..., n-1, n を順に加算する
        for (int i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }

    /* while ループ */
    int WhileLoop(int n) {
        int res = 0;
        int i = 1; // 条件変数を初期化する
        // 1, 2, ..., n-1, n を順に加算する
        while (i <= n) {
            res += i;
            i += 1; // 条件変数を更新する
        }
        return res;
    }

    /* while ループ（2回更新） */
    int WhileLoopII(int n) {
        int res = 0;
        int i = 1; // 条件変数を初期化する
        // 1, 4, 10, ... を順に加算する
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
        // i = 1, 2, ..., n-1, n とループする
        for (int i = 1; i <= n; i++) {
            // j = 1, 2, ..., n-1, n とループする
            for (int j = 1; j <= n; j++) {
                res.Append($"({i}, {j}), ");
            }
        }
        return res.ToString();
    }

    /* Driver Code */
    [Test]
    public void Test() {
        int n = 5;
        int res;

        res = ForLoop(n);
        Console.WriteLine("\nfor ループの合計結果 res = " + res);

        res = WhileLoop(n);
        Console.WriteLine("\nwhile ループの合計結果 res = " + res);

        res = WhileLoopII(n);
        Console.WriteLine("\nwhile ループ（2回更新）の合計結果 res = " + res);

        string resStr = NestedForLoop(n);
        Console.WriteLine("\n二重 for ループの走査結果 " + resStr);
    }
}
