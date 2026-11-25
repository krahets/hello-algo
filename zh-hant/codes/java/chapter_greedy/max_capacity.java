/**
 * File: max_capacity.java
 * Created Time: 2023-07-21
 * Author: krahets (krahets@163.com)
 */

package chapter_greedy;

public class max_capacity {
    /* 最大容量：貪婪法 */
    static int maxCapacity(int[] ht) {
        // 將 i、j 分別設在陣列的兩端
        int i = 0, j = ht.length - 1;
        // 起始最大容量為 0
        int res = 0;
        // 反覆執行貪婪選擇，直到兩塊隔板相遇
        while (i < j) {
            // 更新最大容量
            int cap = Math.min(ht[i], ht[j]) * (j - i);
            res = Math.max(res, cap);
            // 將較矮隔板的指標往內移
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

        // 貪婪演算法
        int res = maxCapacity(ht);
        System.out.println("最大容量為 " + res);
    }
}
