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
    int v; // 物品价值

    public Item(int w, int v) {
        this.w = w;
        this.v = v;
    }
}

public class fractional_knapsack {
    /* 分数背包：贪心 */
    static double fractionalKnapsack(int[] wgt, int[] val, int cap) {
        // 创建物品列表，包含两个属性：重量、价值
        Item[] items = new Item[wgt.length];
        for (int i = 0; i < wgt.length; i++) {
            items[i] = new Item(wgt[i], val[i]);
        }
        // 按照单位价值 item.v / item.w 从高到低进行排序
        Arrays.sort(items, Comparator.comparingDouble(item -> -((double) item.v / item.w)));
        // 循环贪心选择
        double res = 0;
        for (Item item : items) {
            if (item.w <= cap) {
                // 若剩余容量充足，则将当前物品整个装进背包
                res += item.v;
                cap -= item.w;
            } else {
                // 若剩余容量不足，则将当前物品的一部分装进背包
                res += (double) item.v / item.w * cap;
                // 已无剩余容量，因此跳出循环
                break;
            }
        }
        return res;
    }

    public static void main(String[] args) {
        int[] wgt = { 10, 20, 30, 40, 50 };
        int[] val = { 50, 120, 150, 210, 240 };
        int cap = 50;

        // 贪心算法
        double res = fractionalKnapsack(wgt, val, cap);
        System.out.println("不超过背包容量的最大物品价值为 " + res);
    }
}
