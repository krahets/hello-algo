/**
* File: recursion.cs
* Created Time: 2023-08-28
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_computational_complexity;

public class recursion {
    /* 遞迴 */
    int Recur(int n) {
        // 終止條件
        if (n == 1)
            return 1;
        // 遞：遞迴呼叫
        int res = Recur(n - 1);
        // 迴：回傳結果
        return n + res;
    }

    /* 以迭代模擬遞迴 */
    int ForLoopRecur(int n) {
        // 自行建立堆疊，模擬系統的呼叫堆疊
        Stack<int> stack = new();
        int res = 0;
        // 遞：遞迴呼叫
        for (int i = n; i > 0; i--) {
            // 以「推入堆疊」模擬「遞」
            stack.Push(i);
        }
        // 迴：回傳結果
        while (stack.Count > 0) {
            // 以「彈出堆疊」模擬「迴」
            res += stack.Pop();
        }
        // res = 1+2+3+...+n
        return res;
    }

    /* 尾端遞迴 */
    int TailRecur(int n, int res) {
        // 終止條件
        if (n == 0)
            return res;
        // 尾端遞迴呼叫
        return TailRecur(n - 1, res + n);
    }

    /* 費氏數列：遞迴 */
    int Fib(int n) {
        // 終止條件 f(1) = 0, f(2) = 1
        if (n == 1 || n == 2)
            return n - 1;
        // 遞迴呼叫 f(n) = f(n-1) + f(n-2)
        int res = Fib(n - 1) + Fib(n - 2);
        // 回傳結果 f(n)
        return res;
    }

    /* 主程式 */
    [Test]
    public void Test() {
        int n = 5;
        int res;

        res = Recur(n);
        Console.WriteLine("\n遞迴函式的總和 res = " + res);

        res = ForLoopRecur(n);
        Console.WriteLine("\n以迭代模擬遞迴的總和 res = " + res);

        res = TailRecur(n, 0);
        Console.WriteLine("\n尾端遞迴函式的總和 res = " + res);

        res = Fib(n);
        Console.WriteLine("\n費氏數列的第 " + n + " 項為 " + res);
    }
}
