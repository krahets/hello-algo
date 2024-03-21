/**
 * File: fractional_knapsack.java
 * Created Time: 2023-07-20
 * Author: krahets (krahets@163.com)
 */

package chapter_greedy;

import java.util.Arrays;
import java.util.Comparator;

/* 物品 */
class Item {
    int w; // 物品重量
    int v; // 物品價值

    public Item(int w, int v) {
        this.w = w;
        this.v = v;
    }
}

public class fractional_knapsack {
    /* 分數背包：貪婪 */
    static double fractionalKnapsack(int[] wgt, int[] val, int cap) {
        // 建立物品串列，包含兩個屬性：重量、價值
        Item[] items = new Item[wgt.length];
        for (int i = 0; i < wgt.length; i++) {
            items[i] = new Item(wgt[i], val[i]);
        }
        // 按照單位價值 item.v / item.w 從高到低進行排序
        Arrays.sort(items, Comparator.comparingDouble(item -> -((double) item.v / item.w)));
        // 迴圈貪婪選擇
        double res = 0;
        for (Item item : items) {
            if (item.w <= cap) {
                // 若剩餘容量充足，則將當前物品整個裝進背包
                res += item.v;
                cap -= item.w;
            } else {
                // 若剩餘容量不足，則將當前物品的一部分裝進背包
                res += (double) item.v / item.w * cap;
                // 已無剩餘容量，因此跳出迴圈
                break;
            }
        }
        return res;
    }

    public static void main(String[] args) {
        int[] wgt = { 10, 20, 30, 40, 50 };
        int[] val = { 50, 120, 150, 210, 240 };
        int cap = 50;

        // 貪婪演算法
        double res = fractionalKnapsack(wgt, val, cap);
        System.out.println("不超過背包容量的最大物品價值為 " + res);
    }
}
