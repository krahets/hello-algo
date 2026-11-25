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
        // 1, 2, ..., n-1, n の和をループで求める
        for (int i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }

    /* while ループ */
    static int whileLoop(int n) {
        int res = 0;
        int i = 1; // 条件判定用の変数を初期化
        // 1, 2, ..., n-1, n の和をループで求める
        while (i <= n) {
            res += i;
            i++; // 条件判定用の変数を更新
        }
        return res;
    }

    /* while ループ（2 回更新） */
    static int whileLoopII(int n) {
        int res = 0;
        int i = 1; // 条件判定用の変数を初期化
        // 1, 4, 10, ... の和をループで求める
        while (i <= n) {
            res += i;
            // 条件判定用の変数を更新
            i++;
            i *= 2;
        }
        return res;
    }

    /* 二重の for ループ */
    static String nestedForLoop(int n) {
        StringBuilder res = new StringBuilder();
        // i = 1, 2, ..., n-1, n の順に繰り返す
        for (int i = 1; i <= n; i++) {
            // j = 1, 2, ..., n-1, n の順に繰り返す
            for (int j = 1; j <= n; j++) {
                res.append("(" + i + ", " + j + "), ");
            }
        }
        return res.toString();
    }

    /* 実行例 */
    public static void main(String[] args) {
        int n = 5;
        int res;

        res = forLoop(n);
        System.out.println("\nfor ループによる総和 res = " + res);

        res = whileLoop(n);
        System.out.println("\nwhile ループによる総和 res = " + res);

        res = whileLoopII(n);
        System.out.println("\nwhile ループ（2 回更新）による総和 res = " + res);

        String resStr = nestedForLoop(n);
        System.out.println("\n二重の for ループの走査結果 " + resStr);
    }
}
