/**
 * File: iteration.java
 * Created Time: 2023-08-24
 * Author: krahets (krahets@163.com)
 */

package chapter_computational_complexity;

public class iteration {
    /* for ループ */
    static int forLoop(int n) {
        int res = 0;
        // 1, 2, ..., n-1, n を順に加算する
        for (int i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }

    /* while ループ */
    static int whileLoop(int n) {
        int res = 0;
        int i = 1; // 条件変数を初期化する
        // 1, 2, ..., n-1, n を順に加算する
        while (i <= n) {
            res += i;
            i++; // 条件変数を更新する
        }
        return res;
    }

    /* while ループ（2回更新） */
    static int whileLoopII(int n) {
        int res = 0;
        int i = 1; // 条件変数を初期化する
        // 1, 4, 10, ... を順に加算する
        while (i <= n) {
            res += i;
            // 条件変数を更新する
            i++;
            i *= 2;
        }
        return res;
    }

    /* 二重 for ループ */
    static String nestedForLoop(int n) {
        StringBuilder res = new StringBuilder();
        // i = 1, 2, ..., n-1, n とループする
        for (int i = 1; i <= n; i++) {
            // j = 1, 2, ..., n-1, n とループする
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
        System.out.println("\nfor ループの合計結果 res = " + res);

        res = whileLoop(n);
        System.out.println("\nwhile ループの合計結果 res = " + res);

        res = whileLoopII(n);
        System.out.println("\nwhile ループ（2 回更新）の合計結果 res = " + res);

        String resStr = nestedForLoop(n);
        System.out.println("\n二重 for ループの走査結果 " + resStr);
    }
}
