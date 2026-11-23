/**
 * File: recursion.java
 * Created Time: 2023-08-24
 * Author: krahets (krahets@163.com)
 */

package chapter_computational_complexity;

import java.util.Stack;

public class recursion {
    /* Recursion */
    static int recur(int n) {
        // Base case
        if (n == 1)
            return 1;
        // Recurse: make a recursive call
        int res = recur(n - 1);
        // Unwind: return the result
        return n + res;
    }

    /* Simulate recursion using iteration */
    static int forLoopRecur(int n) {
        // Use an explicit stack to simulate the system call stack
        Stack<Integer> stack = new Stack<>();
        int res = 0;
        // Recurse: make a recursive call
        for (int i = n; i > 0; i--) {
            // Simulate recursive calls by pushing onto the stack
            stack.push(i);
        }
        // Unwind: return the result
        while (!stack.isEmpty()) {
            // Simulate unwinding by popping from the stack
            res += stack.pop();
        }
        // res = 1+2+3+...+n
        return res;
    }

    /* Tail recursion */
    static int tailRecur(int n, int res) {
        // Base case
        if (n == 0)
            return res;
        // Tail-recursive call
        return tailRecur(n - 1, res + n);
    }

    /* Fibonacci sequence: recursion */
    static int fib(int n) {
        // Base cases: f(1) = 0, f(2) = 1
        if (n == 1 || n == 2)
            return n - 1;
        // Recursive calls: f(n) = f(n-1) + f(n-2)
        int res = fib(n - 1) + fib(n - 2);
        // Return the result f(n)
        return res;
    }

    /* Driver code */
    public static void main(String[] args) {
        int n = 5;
        int res;

        res = recur(n);
        System.out.println("\nSum from recursion: res = " + res);

        res = forLoopRecur(n);
        System.out.println("\nSum from simulating recursion with iteration: res = " + res);

        res = tailRecur(n, 0);
        System.out.println("\nSum from tail recursion: res = " + res);

        res = fib(n);
        System.out.println("\nFibonacci term " + n + " is " + res);
    }
}
