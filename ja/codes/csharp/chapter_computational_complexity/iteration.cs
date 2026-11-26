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
        // 1, 2, ..., n-1, n の和をループで求める
        for (int i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }

    /* while ループ */
    int WhileLoop(int n) {
        int res = 0;
        int i = 1; // 条件判定用の変数を初期化
        // 1, 2, ..., n-1, n の和をループで求める
        while (i <= n) {
            res += i;
            i += 1; // 条件判定用の変数を更新
        }
        return res;
    }

    /* while ループ（2 回更新） */
    int WhileLoopII(int n) {
        int res = 0;
        int i = 1; // 条件判定用の変数を初期化
        // 1, 4, 10, ... の和をループで求める
        while (i <= n) {
            res += i;
            // 条件判定用の変数を更新
            i += 1; 
            i *= 2;
        }
        return res;
    }

    /* 二重の for ループ */
    string NestedForLoop(int n) {
        StringBuilder res = new();
        // i = 1, 2, ..., n-1, n の順に繰り返す
        for (int i = 1; i <= n; i++) {
            // j = 1, 2, ..., n-1, n の順に繰り返す
            for (int j = 1; j <= n; j++) {
                res.Append($"({i}, {j}), ");
            }
        }
        return res.ToString();
    }

    /* 実行例 */
    [Test]
    public void Test() {
        int n = 5;
        int res;

        res = ForLoop(n);
        Console.WriteLine("\nfor ループによる総和 res = " + res);

        res = WhileLoop(n);
        Console.WriteLine("\nwhile ループによる総和 res = " + res);

        res = WhileLoopII(n);
        Console.WriteLine("\nwhile ループ（2 回更新）による総和 res = " + res);

        string resStr = NestedForLoop(n);
        Console.WriteLine("\n二重の for ループの走査結果 " + resStr);
    }
}
