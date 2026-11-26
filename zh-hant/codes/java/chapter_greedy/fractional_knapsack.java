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
    /* 分數背包：貪婪法 */
    static double fractionalKnapsack(int[] wgt, int[] val, int cap) {
        // 建立物品清單，每件物品有重量與價值兩項屬性
        Item[] items = new Item[wgt.length];
        for (int i = 0; i < wgt.length; i++) {
            items[i] = new Item(wgt[i], val[i]);
        }
        // 依單位價值 item.v / item.w 由高到低排序
        Arrays.sort(items, Comparator.comparingDouble(item -> -((double) item.v / item.w)));
        // 反覆依貪婪策略選取物品
        double res = 0;
        for (Item item : items) {
            if (item.w <= cap) {
                // 若剩餘容量足夠，就將目前的物品整件裝入背包
                res += item.v;
                cap -= item.w;
            } else {
                // 若剩餘容量不足，就將目前物品的一部分裝入背包
                res += (double) item.v / item.w * cap;
                // 背包已滿，跳出迴圈
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
        System.out.println("在背包容量限制內，物品的最大總價值為 " + res);
    }
}
