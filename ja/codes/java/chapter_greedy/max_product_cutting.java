/**
 * File: max_product_cutting.java
 * Created Time: 2023-07-21
 * Author: krahets (krahets@163.com)
 */

package chapter_greedy;

import java.lang.Math;

public class max_product_cutting {
    /* 最大積切断：貪欲法 */
    public static int maxProductCutting(int n) {
        // n <= 3 の場合、1 を切り出す必要がある
        if (n <= 3) {
            return 1 * (n - 1);
        }
        // 貪欲に 3 を切り出す。a は 3 の個数、b は余り
        int a = n / 3;
        int b = n % 3;
        if (b == 1) {
            // 余りが 1 の場合、1 * 3 のペアを 2 * 2 に変換
            return (int) Math.pow(3, a - 1) * 2 * 2;
        }
        if (b == 2) {
            // 余りが 2 の場合、何もしない
            return (int) Math.pow(3, a) * 2;
        }
        // 余りが 0 の場合、何もしない
        return (int) Math.pow(3, a);
    }

    public static void main(String[] args) {
        int n = 58;

        // 貪欲アルゴリズム
        int res = maxProductCutting(n);
        System.out.println("分割の最大積は " + res + " です");
    }
}