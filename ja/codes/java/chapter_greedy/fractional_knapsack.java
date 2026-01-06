/**
 * File: fractional_knapsack.java
 * Created Time: 2023-07-20
 * Author: krahets (krahets@163.com)
 */

package chapter_greedy;

import java.util.Arrays;
import java.util.Comparator;

/* アイテム */
class Item {
    int w; // アイテムの重量
    int v; // アイテムの価値

    public Item(int w, int v) {
        this.w = w;
        this.v = v;
    }
}

public class fractional_knapsack {
    /* 分数ナップサック：貪欲法 */
    static double fractionalKnapsack(int[] wgt, int[] val, int cap) {
        // アイテムリストを作成、2つの属性を含む：重量、価値
        Item[] items = new Item[wgt.length];
        for (int i = 0; i < wgt.length; i++) {
            items[i] = new Item(wgt[i], val[i]);
        }
        // 単位価値 item.v / item.w で高い順にソート
        Arrays.sort(items, Comparator.comparingDouble(item -> -((double) item.v / item.w)));
        // 貪欲選択をループ
        double res = 0;
        for (Item item : items) {
            if (item.w <= cap) {
                // 残り容量が十分な場合、アイテム全体をナップサックに入れる
                res += item.v;
                cap -= item.w;
            } else {
                // 残り容量が不十分な場合、アイテムの一部をナップサックに入れる
                res += (double) item.v / item.w * cap;
                // 残り容量がなくなったため、ループを中断
                break;
            }
        }
        return res;
    }

    public static void main(String[] args) {
        int[] wgt = { 10, 20, 30, 40, 50 };
        int[] val = { 50, 120, 150, 210, 240 };
        int cap = 50;

        // 貪欲アルゴリズム
        double res = fractionalKnapsack(wgt, val, cap);
        System.out.println("ナップサック容量内での最大値は " + res + " です");
    }
}