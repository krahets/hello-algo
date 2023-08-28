/**
* File: recursion.cs
* Created Time: 2023-08-28
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_computational_complexity;

public class recursion {
    /* 递归 */
    public int recur(int n) {
        // 终止条件
        if (n == 1)
            return 1;
        // 递：递归调用
        int res = recur(n - 1);
        // 归：返回结果
        return n + res;
    }

    /* 尾递归 */
    public int tailRecur(int n, int res) {
        // 终止条件
        if (n == 0)
            return res;
        // 尾递归调用
        return tailRecur(n - 1, res + n);
    }

    /* 斐波那契数列：递归 */
    public int fib(int n) {
        // 终止条件 f(1) = 0, f(2) = 1
        if (n == 1 || n == 2)
            return n - 1;
        // 递归调用 f(n) = f(n-1) + f(n-2)
        int res = fib(n - 1) + fib(n - 2);
        // 返回结果 f(n)
        return res;
    }

    /* Driver Code */
    [Test]
    public void Test() {
        int n = 5;
        int res;

        res = recur(n);
        Console.WriteLine("\n递归函数的求和结果 res = " + res);

        res = tailRecur(n, 0);
        Console.WriteLine("\n尾递归函数的求和结果 res = " + res);

        res = fib(n);
        Console.WriteLine("\n斐波那契数列的第 " + n + " 项为 " + res);
    }
}
