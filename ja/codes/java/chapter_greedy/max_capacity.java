/**
 * File: max_capacity.java
 * Created Time: 2023-07-21
 * Author: krahets (krahets@163.com)
 */

package chapter_greedy;

public class max_capacity {
    /* 最大容量：貪欲法 */
    static int maxCapacity(int[] ht) {
        // i、j を初期化し、配列の両端で分割させる
        int i = 0, j = ht.length - 1;
        // 初期最大容量は 0
        int res = 0;
        // 2つの板が出会うまで貪欲選択をループ
        while (i < j) {
            // 最大容量を更新
            int cap = Math.min(ht[i], ht[j]) * (j - i);
            res = Math.max(res, cap);
            // より短い板を内側に移動
            if (ht[i] < ht[j]) {
                i++;
            } else {
                j--;
            }
        }
        return res;
    }

    public static void main(String[] args) {
        int[] ht = { 3, 8, 5, 2, 7, 7, 3, 4 };

        // 貪欲アルゴリズム
        int res = maxCapacity(ht);
        System.out.println("最大容量は " + res + " です");
    }
}