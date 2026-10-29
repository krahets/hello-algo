/**
* File: recursion.cs
* Created Time: 2023-08-28
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_computational_complexity;

public class recursion {
    /* 再帰 */
    int Recur(int n) {
        // 終了条件
        if (n == 1)
            return 1;
        // 往路：再帰呼び出し
        int res = Recur(n - 1);
        // 復路：結果を返す
        return n + res;
    }

    /* 反復を使って再帰を再現する */
    int ForLoopRecur(int n) {
        // 明示的なスタックを使って、システムの呼び出しスタックを再現する
        Stack<int> stack = new();
        int res = 0;
        // 往路：再帰呼び出し
        for (int i = n; i > 0; i--) {
            // 「プッシュ操作」で再帰の「往路」を再現する
            stack.Push(i);
        }
        // 復路：結果を返す
        while (stack.Count > 0) {
            // 「ポップ操作」で再帰の「復路」を再現する
            res += stack.Pop();
        }
        // res = 1+2+3+...+n
        return res;
    }

    /* 末尾再帰 */
    int TailRecur(int n, int res) {
        // 終了条件
        if (n == 0)
            return res;
        // 末尾再帰呼び出し
        return TailRecur(n - 1, res + n);
    }

    /* フィボナッチ数列：再帰 */
    int Fib(int n) {
        // 終了条件 f(1) = 0, f(2) = 1
        if (n == 1 || n == 2)
            return n - 1;
        // 再帰呼び出し f(n) = f(n-1) + f(n-2)
        int res = Fib(n - 1) + Fib(n - 2);
        // 結果 f(n) を返す
        return res;
    }

    /* 実行用コード */
    [Test]
    public void Test() {
        int n = 5;
        int res;

        res = Recur(n);
        Console.WriteLine("\n再帰関数で求めた和 res = " + res);

        res = ForLoopRecur(n);
        Console.WriteLine("\n反復で再帰を再現して求めた和 res = " + res);

        res = TailRecur(n, 0);
        Console.WriteLine("\n末尾再帰関数で求めた和 res = " + res);

        res = Fib(n);
        Console.WriteLine("\nフィボナッチ数列の第 " + n + " 項は " + res);
    }
}
