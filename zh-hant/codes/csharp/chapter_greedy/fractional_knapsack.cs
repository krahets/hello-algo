/**
* File: fractional_knapsack.cs
* Created Time: 2023-07-21
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_greedy;

/* 物品 */
class Item(int w, int v) {
    public int w = w; // 物品重量
    public int v = v; // 物品價值
}

public class fractional_knapsack {
    /* 分數背包：貪婪法 */
    double FractionalKnapsack(int[] wgt, int[] val, int cap) {
        // 建立物品清單，每件物品有重量與價值兩項屬性
        Item[] items = new Item[wgt.Length];
        for (int i = 0; i < wgt.Length; i++) {
            items[i] = new Item(wgt[i], val[i]);
        }
        // 依單位價值 item.v / item.w 由高到低排序
        Array.Sort(items, (x, y) => ((double)y.v / y.w).CompareTo((double)x.v / x.w));
        // 反覆依貪婪策略選取物品
        double res = 0;
        foreach (Item item in items) {
            if (item.w <= cap) {
                // 若剩餘容量足夠，就將目前的物品整件裝入背包
                res += item.v;
                cap -= item.w;
            } else {
                // 若剩餘容量不足，就將目前物品的一部分裝入背包
                res += (double)item.v / item.w * cap;
                // 背包已滿，跳出迴圈
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

        // 貪婪演算法
        double res = FractionalKnapsack(wgt, val, cap);
        Console.WriteLine("在背包容量限制內，物品的最大總價值為 " + res);
    }
}