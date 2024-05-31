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
        // Termination condition
        if (n == 1)
            return 1;
        // Recursive: recursive call
        int res = recur(n - 1);
        // Return: return result
        return n + res;
    }

    /* Simulate recursion with iteration */
    static int forLoopRecur(int n) {
        // Use an explicit stack to simulate the system call stack
        Stack<Integer> stack = new Stack<>();
        int res = 0;
        // Recursive: recursive call
        for (int i = n; i > 0; i--) {
            // Simulate "recursive" by "pushing onto the stack"
            stack.push(i);
        }
        // Return: return result
        while (!stack.isEmpty()) {
            // Simulate "return" by "popping from the stack"
            res += stack.pop();
        }
        // res = 1+2+3+...+n
        return res;
    }

    /* Tail recursion */
    static int tailRecur(int n, int res) {
        // Termination condition
        if (n == 0)
            return res;
        // Tail recursive call
        return tailRecur(n - 1, res + n);
    }

    /* Fibonacci sequence: Recursion */
    static int fib(int n) {
        // Termination condition f(1) = 0, f(2) = 1
        if (n == 1 || n == 2)
            return n - 1;
        // Recursive call f(n) = f(n-1) + f(n-2)
        int res = fib(n - 1) + fib(n - 2);
        // Return result f(n)
        return res;
    }

    /* Driver Code */
    public static void main(String[] args) {
        int n = 5;
        int res;

        res = recur(n);
        System.out.println("\nSum result of the recursive function res = " + res);

        res = forLoopRecur(n);
        System.out.println("\nSum result using iteration to simulate recursion res = " + res);

        res = tailRecur(n, 0);
        System.out.println("\nSum result of the tail-recursive function res = " + res);

        res = fib(n);
        System.out.println("\nThe " + n + "th number in the Fibonacci sequence is " + res);
    }
}
