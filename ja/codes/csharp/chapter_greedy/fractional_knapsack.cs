/**
* File: fractional_knapsack.cs
* Created Time: 2023-07-21
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_greedy;

/* 品物 */
class Item(int w, int v) {
    public int w = w; // 品物の重さ
    public int v = v; // 品物の価値
}

public class fractional_knapsack {
    /* 分数ナップサック：貪欲法 */
    double FractionalKnapsack(int[] wgt, int[] val, int cap) {
        // 重さと価値の 2 属性を持つ品物リストを作成
        Item[] items = new Item[wgt.Length];
        for (int i = 0; i < wgt.Length; i++) {
            items[i] = new Item(wgt[i], val[i]);
        }
        // 単位価値 item.v / item.w の高い順にソートする
        Array.Sort(items, (x, y) => (y.v / y.w).CompareTo(x.v / x.w));
        // 貪欲選択を繰り返す
        double res = 0;
        foreach (Item item in items) {
            if (item.w <= cap) {
                // 残り容量が十分なら、現在の品物を丸ごとナップサックに入れる
                res += item.v;
                cap -= item.w;
            } else {
                // 残り容量が足りない場合は、現在の品物の一部だけをナップサックに入れる
                res += (double)item.v / item.w * cap;
                // 残り容量がないため、ループを抜ける
                break;
            }
        }
        return res;
    }

    [Test]
    public void Test() {
        int[] wgt = [10, 20, 30, 40, 50];
        int[] val = [50, 120, 150, 210, 240];
        int cap = 50;

        // 貪欲法
        double res = FractionalKnapsack(wgt, val, cap);
        Console.WriteLine("バックパック容量を超えない最大価値は " + res);
    }
}