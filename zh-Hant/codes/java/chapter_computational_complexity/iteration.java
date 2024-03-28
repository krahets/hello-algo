/**
 * File: iteration.java
 * Created Time: 2023-08-24
 * Author: krahets (krahets@163.com)
 */

package chapter_computational_complexity;

public class iteration {
    /* for 迴圈 */
    static int forLoop(int n) {
        int res = 0;
        // 迴圈求和 1, 2, ..., n-1, n
        for (int i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }

    /* while 迴圈 */
    static int whileLoop(int n) {
        int res = 0;
        int i = 1; // 初始化條件變數
        // 迴圈求和 1, 2, ..., n-1, n
        while (i <= n) {
            res += i;
            i++; // 更新條件變數
        }
        return res;
    }

    /* while 迴圈（兩次更新） */
    static int whileLoopII(int n) {
        int res = 0;
        int i = 1; // 初始化條件變數
        // 迴圈求和 1, 4, 10, ...
        while (i <= n) {
            res += i;
            // 更新條件變數
            i++;
            i *= 2;
        }
        return res;
    }

    /* 雙層 for 迴圈 */
    static String nestedForLoop(int n) {
        StringBuilder res = new StringBuilder();
        // 迴圈 i = 1, 2, ..., n-1, n
        for (int i = 1; i <= n; i++) {
            // 迴圈 j = 1, 2, ..., n-1, n
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
        System.out.println("\nfor 迴圈的求和結果 res = " + res);

        res = whileLoop(n);
        System.out.println("\nwhile 迴圈的求和結果 res = " + res);

        res = whileLoopII(n);
        System.out.println("\nwhile 迴圈（兩次更新）求和結果 res = " + res);

        String resStr = nestedForLoop(n);
        System.out.println("\n雙層 for 迴圈的走訪結果 " + resStr);
    }
}
