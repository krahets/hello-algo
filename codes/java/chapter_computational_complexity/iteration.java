/**
 * File: iteration.java
 * Created Time: 2023-08-24
 * Author: krahets (krahets@163.com)
 */

package chapter_computational_complexity;

public class iteration {
    /* for 循环 */
    static int forLoop(int n) {
        int res = 0;
        // 循环求和 1, 2, ..., n-1, n
        for (int i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }

    /* while 循环 */
    static int whileLoop(int n) {
        int res = 0;
        int i = 1; // 初始化条件变量
        // 循环求和 1, 2, ..., n-1, n
        while (i <= n) {
            res += i;
            i++; // 更新条件变量
        }
        return res;
    }

    /* while 循环（两次更新） */
    static int whileLoopII(int n) {
        int res = 0;
        int i = 1; // 初始化条件变量
        // 循环求和 1, 4, 10, ...
        while (i <= n) {
            res += i;
            // 更新条件变量
            i++;
            i *= 2;
        }
        return res;
    }

    /* 双层 for 循环 */
    static String nestedForLoop(int n) {
        StringBuilder res = new StringBuilder();
        // 循环 i = 1, 2, ..., n-1, n
        for (int i = 1; i <= n; i++) {
            // 循环 j = 1, 2, ..., n-1, n
            for (int j = 1; j <= n; j++) {
                res.append("(" + i + ", " + j + "), ");
            }
        }
        return res.toString();
    }

    /* Driver Code */
    public static void main(String[] args) {
        int n = 5;
        int res;

        res = forLoop(n);
        System.out.println("\nfor 循环的求和结果 res = " + res);

        res = whileLoop(n);
        System.out.println("\nwhile 循环的求和结果 res = " + res);

        res = whileLoopII(n);
        System.out.println("\nwhile 循环（两次更新）求和结果 res = " + res);

        String resStr = nestedForLoop(n);
        System.out.println("\n双层 for 循环的遍历结果 " + resStr);
    }
}
