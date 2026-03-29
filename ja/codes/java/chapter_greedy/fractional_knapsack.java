/**
 * File: fractional_knapsack.java
 * Created Time: 2023-07-20
 * Author: krahets (krahets@163.com)
 */

package chapter_greedy;

import java.util.Arrays;
import java.util.Comparator;

/* 品物 */
class Item {
    int w; // 品物の重さ
    int v; // 品物の価値

    public Item(int w, int v) {
        this.w = w;
        this.v = v;
    }
}

public class fractional_knapsack {
    /* 分数ナップサック：貪欲法 */
    static double fractionalKnapsack(int[] wgt, int[] val, int cap) {
        // 重さと価値の 2 属性を持つ品物リストを作成
        Item[] items = new Item[wgt.length];
        for (int i = 0; i < wgt.length; i++) {
            items[i] = new Item(wgt[i], val[i]);
        }
        // 単位価値 item.v / item.w の高い順にソートする
        Arrays.sort(items, Comparator.comparingDouble(item -> -((double) item.v / item.w)));
        // 貪欲選択を繰り返す
        double res = 0;
        for (Item item : items) {
            if (item.w <= cap) {
                // 残り容量が十分なら、現在の品物を丸ごとナップサックに入れる
                res += item.v;
                cap -= item.w;
            } else {
                // 残り容量が足りない場合は、現在の品物の一部だけをナップサックに入れる
                res += (double) item.v / item.w * cap;
                // 残り容量がないため、ループを抜ける
                break;
            }
        }
        return res;
    }

    public static void main(String[] args) {
        int[] wgt = { 10, 20, 30, 40, 50 };
        int[] val = { 50, 120, 150, 210, 240 };
        int cap = 50;

        // 貪欲法
        double res = fractionalKnapsack(wgt, val, cap);
        System.out.println("ナップサック容量を超えない最大価値は " + res);
    }
}
