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
        // 1, 2, ..., n-1, n の合計をループ計算
        for (int i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }

    /* while ループ */
    static int whileLoop(int n) {
        int res = 0;
        int i = 1; // 条件変数を初期化
        // 1, 2, ..., n-1, n の合計をループ計算
        while (i <= n) {
            res += i;
            i++; // 条件変数を更新
        }
        return res;
    }

    /* while ループ（2つの更新） */
    static int whileLoopII(int n) {
        int res = 0;
        int i = 1; // 条件変数を初期化
        // 1, 4, 10, ... の合計をループ計算
        while (i <= n) {
            res += i;
            // 条件変数を更新
            i++;
            i *= 2;
        }
        return res;
    }

    /* 2重 for ループ */
    static String nestedForLoop(int n) {
        StringBuilder res = new StringBuilder();
        // ループ i = 1, 2, ..., n-1, n
        for (int i = 1; i <= n; i++) {
            // ループ j = 1, 2, ..., n-1, n
            for (int j = 1; j <= n; j++) {
                res.append("(" + i + ", " + j + "), ");
            }
        }
        return res.toString();
    }

    /* ドライバーコード */
    public static void main(String[] args) {
        int n = 5;
        int res;

        res = forLoop(n);
        System.out.println("\nfor ループの合計結果 res = " + res);

        res = whileLoop(n);
        System.out.println("\nwhile ループの合計結果 res = " + res);

        res = whileLoopII(n);
        System.out.println("\nwhile ループ（2つの更新）の合計結果 res = " + res);

        String resStr = nestedForLoop(n);
        System.out.println("\n2重 for ループ走査の結果 = " + resStr);
    }
}