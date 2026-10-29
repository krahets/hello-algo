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
        // ループで 1, 2, ..., n-1, n の和を求める
        for (int i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }

    /* while ループ */
    static int whileLoop(int n) {
        int res = 0;
        int i = 1; // 条件変数を初期化する
        // ループで 1, 2, ..., n-1, n の和を求める
        while (i <= n) {
            res += i;
            i++; // 条件変数を更新する
        }
        return res;
    }

    /* while ループ（2 回の更新） */
    static int whileLoopII(int n) {
        int res = 0;
        int i = 1; // 条件変数を初期化する
        // ループで 1, 4, 10, ... の和を求める
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
        // i = 1, 2, ..., n-1, n のループ
        for (int i = 1; i <= n; i++) {
            // j = 1, 2, ..., n-1, n のループ
            for (int j = 1; j <= n; j++) {
                res.append("(" + i + ", " + j + "), ");
            }
        }
        return res.toString();
    }

    /* 実行用コード */
    public static void main(String[] args) {
        int n = 5;
        int res;

        res = forLoop(n);
        System.out.println("\nfor ループで求めた和 res = " + res);

        res = whileLoop(n);
        System.out.println("\nwhile ループで求めた和 res = " + res);

        res = whileLoopII(n);
        System.out.println("\nwhile ループ（2 回の更新）で求めた和 res = " + res);

        String resStr = nestedForLoop(n);
        System.out.println("\n二重 for ループの走査結果 " + resStr);
    }
}
