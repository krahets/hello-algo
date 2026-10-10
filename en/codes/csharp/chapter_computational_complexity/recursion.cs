/**
* File: recursion.cs
* Created Time: 2023-08-28
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_computational_complexity;

public class recursion {
    /* Recursion */
    int Recur(int n) {
        // Termination condition
        if (n == 1)
            return 1;
        // Recurse: recursive call
        int res = Recur(n - 1);
        // Return: return result
        return n + res;
    }

    /* Simulate recursion using iteration */
    int ForLoopRecur(int n) {
        // Use an explicit stack to simulate the system call stack
        Stack<int> stack = new();
        int res = 0;
        // Recurse: recursive call
        for (int i = n; i > 0; i--) {
            // Simulate "recurse" with "push"
            stack.Push(i);
        }
        // Return: return result
        while (stack.Count > 0) {
            // Simulate "return" with "pop"
            res += stack.Pop();
        }
        // res = 1+2+3+...+n
        return res;
    }

    /* Tail recursion */
    int TailRecur(int n, int res) {
        // Termination condition
        if (n == 0)
            return res;
        // Tail recursive call
        return TailRecur(n - 1, res + n);
    }

    /* Fibonacci sequence: recursion */
    int Fib(int n) {
        // Termination condition f(1) = 0, f(2) = 1
        if (n == 1 || n == 2)
            return n - 1;
        // Recursive call f(n) = f(n-1) + f(n-2)
        int res = Fib(n - 1) + Fib(n - 2);
        // Return result f(n)
        return res;
    }

    /* Driver Code */
    [Test]
    public void Test() {
        int n = 5;
        int res;

        res = Recur(n);
        Console.WriteLine("\nRecursive function sum result res = " + res);

        res = ForLoopRecur(n);
        Console.WriteLine("\nUsing iteration to simulate recursive sum result res = " + res);

        res = TailRecur(n, 0);
        Console.WriteLine("\nTail recursive function sum result res = " + res);

        res = Fib(n);
        Console.WriteLine("\nThe " + n + "th term of the Fibonacci sequence is " + res);
    }
}
