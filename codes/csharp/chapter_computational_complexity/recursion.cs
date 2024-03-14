/**
* File: recursion.cs
* Created Time: 2023-08-28
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_computational_complexity;

public class recursion {
    /* 递归 */
    int Recur(int n) {
        // 终止条件
        if (n == 1)
            return 1;
        // 递：递归调用
        int res = Recur(n - 1);
        // 归：返回结果
        return n + res;
    }

    /* 使用迭代模拟递归 */
    int ForLoopRecur(int n) {
        // 使用一个显式的栈来模拟系统调用栈
        Stack<int> stack = new();
        int res = 0;
        // 递：递归调用
        for (int i = n; i > 0; i--) {
            // 通过“入栈操作”模拟“递”
            stack.Push(i);
        }
        // 归：返回结果
        while (stack.Count > 0) {
            // 通过“出栈操作”模拟“归”
            res += stack.Pop();
        }
        // res = 1+2+3+...+n
        return res;
    }

    /* 尾递归 */
    int TailRecur(int n, int res) {
        // 终止条件
        if (n == 0)
            return res;
        // 尾递归调用
        return TailRecur(n - 1, res + n);
    }

    /* 斐波那契数列：递归 */
    int Fib(int n) {
        // 终止条件 f(1) = 0, f(2) = 1
        if (n == 1 || n == 2)
            return n - 1;
        // 递归调用 f(n) = f(n-1) + f(n-2)
        int res = Fib(n - 1) + Fib(n - 2);
        // 返回结果 f(n)
        return res;
    }

    /* Driver Code */
    [Test]
    public void Test() {
        int n = 5;
        int res;

        res = Recur(n);
        Console.WriteLine("\n递归函数的求和结果 res = " + res);

        res = ForLoopRecur(n);
        Console.WriteLine("\n使用迭代模拟递归求和结果 res = " + res);

        res = TailRecur(n, 0);
        Console.WriteLine("\n尾递归函数的求和结果 res = " + res);

        res = Fib(n);
        Console.WriteLine("\n斐波那契数列的第 " + n + " 项为 " + res);
    }
}
