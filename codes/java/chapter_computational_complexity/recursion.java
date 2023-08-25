/**
 * File: recursion.java
 * Created Time: 2023-08-24
 * Author: Krahets (krahets@163.com)
 */

package chapter_computational_complexity;

public class recursion {
    /* 递归 */
    public static int recur(int n) {
        // 终止条件
        if (n == 1)
            return 1;
        // 递：递归调用
        int res = recur(n - 1);
        // 归：返回结果
        return n + res;
    }

    /* 尾递归 */
    public static int tailRecur(int n, int res) {
        // 终止条件
        if (n == 0)
            return res;
        // 尾递归调用
        return tailRecur(n - 1, res + n);
    }

    /* 斐波那契数列：递归 */
    public static int fib(int n) {
        // 终止条件 f(1) = 0, f(2) = 1
        if (n == 1 || n == 2)
            return n - 1;
        // 递归调用 f(n) = f(n-1) + f(n-2)
        int res = fib(n - 1) + fib(n - 2);
        // 返回结果 f(n)
        return res;
    }

    /* Driver Code */
    public static void main(String[] args) {
        int n = 5;
        int res;

        res = recur(n);
        System.out.println("\n递归函数的求和结果 res = " + res);

        res = tailRecur(n, 0);
        System.out.println("\n尾递归函数的求和结果 res = " + res);

        res = fib(n);
        System.out.println("\n斐波那契数列的第 " + n + " 项为 " + res);
    }
}
