/**
 * File: max_capacity.java
 * Created Time: 2023-07-21
 * Author: krahets (krahets@163.com)
 */

package chapter_greedy;

public class max_capacity {
    /* 最大容量（貪欲法） */
    static int maxCapacity(int[] ht) {
        // i と j を配列の両端に置く
        int i = 0, j = ht.length - 1;
        // 最大容量の初期値は 0
        int res = 0;
        // 両方の板が同じ位置に来るまで貪欲選択を繰り返す
        while (i < j) {
            // 最大容量を更新する
            int cap = Math.min(ht[i], ht[j]) * (j - i);
            res = Math.max(res, cap);
            // 低い板のポインタを内側へ動かす
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

        // 貪欲法
        int res = maxCapacity(ht);
        System.out.println("最大容量は " + res);
    }
}
