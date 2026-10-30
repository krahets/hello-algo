/**
* File: recursion.cs
* Created Time: 2023-08-28
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_computational_complexity;

public class recursion {
    /* Recursion */
    int Recur(int n) {
        // Base case
        if (n == 1)
            return 1;
        // Recurse: make a recursive call
        int res = Recur(n - 1);
        // Unwind: return the result
        return n + res;
    }

    /* Simulate recursion using iteration */
    int ForLoopRecur(int n) {
        // Use an explicit stack to simulate the system call stack
        Stack<int> stack = new();
        int res = 0;
        // Recurse: make a recursive call
        for (int i = n; i > 0; i--) {
            // Simulate recursive calls by pushing onto the stack
            stack.Push(i);
        }
        // Unwind: return the result
        while (stack.Count > 0) {
            // Simulate unwinding by popping from the stack
            res += stack.Pop();
        }
        // res = 1+2+3+...+n
        return res;
    }

    /* Tail recursion */
    int TailRecur(int n, int res) {
        // Base case
        if (n == 0)
            return res;
        // Tail-recursive call
        return TailRecur(n - 1, res + n);
    }

    /* Fibonacci sequence: recursion */
    int Fib(int n) {
        // Base cases: f(1) = 0, f(2) = 1
        if (n == 1 || n == 2)
            return n - 1;
        // Recursive calls: f(n) = f(n-1) + f(n-2)
        int res = Fib(n - 1) + Fib(n - 2);
        // Return the result f(n)
        return res;
    }

    /* Driver code */
    [Test]
    public void Test() {
        int n = 5;
        int res;

        res = Recur(n);
        Console.WriteLine("\nSum from recursion: res = " + res);

        res = ForLoopRecur(n);
        Console.WriteLine("\nSum from simulating recursion with iteration: res = " + res);

        res = TailRecur(n, 0);
        Console.WriteLine("\nSum from tail recursion: res = " + res);

        res = Fib(n);
        Console.WriteLine("\nFibonacci term " + n + " is " + res);
    }
}
