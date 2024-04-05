/**
 * File: recursion.java
 * Created Time: 2023-08-24
 * Author: krahets (krahets@163.com)
 */

package chapter_computational_complexity;

import java.util.Stack;

public class recursion {
    /* 遞迴 */
    static int recur(int n) {
        // 終止條件
        if (n == 1)
            return 1;
        // 遞：遞迴呼叫
        int res = recur(n - 1);
        // 迴：返回結果
        return n + res;
    }

    /* 使用迭代模擬遞迴 */
    static int forLoopRecur(int n) {
        // 使用一個顯式的堆疊來模擬系統呼叫堆疊
        Stack<Integer> stack = new Stack<>();
        int res = 0;
        // 遞：遞迴呼叫
        for (int i = n; i > 0; i--) {
            // 透過“入堆疊操作”模擬“遞”
            stack.push(i);
        }
        // 迴：返回結果
        while (!stack.isEmpty()) {
            // 透過“出堆疊操作”模擬“迴”
            res += stack.pop();
        }
        // res = 1+2+3+...+n
        return res;
    }

    /* 尾遞迴 */
    static int tailRecur(int n, int res) {
        // 終止條件
        if (n == 0)
            return res;
        // 尾遞迴呼叫
        return tailRecur(n - 1, res + n);
    }

    /* 費波那契數列：遞迴 */
    static int fib(int n) {
        // 終止條件 f(1) = 0, f(2) = 1
        if (n == 1 || n == 2)
            return n - 1;
        // 遞迴呼叫 f(n) = f(n-1) + f(n-2)
        int res = fib(n - 1) + fib(n - 2);
        // 返回結果 f(n)
        return res;
    }

    /* Driver Code */
    public static void main(String[] args) {
        int n = 5;
        int res;

        res = recur(n);
        System.out.println("\n遞迴函式的求和結果 res = " + res);

        res = forLoopRecur(n);
        System.out.println("\n使用迭代模擬遞迴求和結果 res = " + res);

        res = tailRecur(n, 0);
        System.out.println("\n尾遞迴函式的求和結果 res = " + res);

        res = fib(n);
        System.out.println("\n費波那契數列的第 " + n + " 項為 " + res);
    }
}
