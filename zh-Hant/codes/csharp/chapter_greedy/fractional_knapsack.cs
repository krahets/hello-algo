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
    /* 分數背包：貪婪 */
    double FractionalKnapsack(int[] wgt, int[] val, int cap) {
        // 建立物品串列，包含兩個屬性：重量、價值
        Item[] items = new Item[wgt.Length];
        for (int i = 0; i < wgt.Length; i++) {
            items[i] = new Item(wgt[i], val[i]);
        }
        // 按照單位價值 item.v / item.w 從高到低進行排序
        Array.Sort(items, (x, y) => (y.v / y.w).CompareTo(x.v / x.w));
        // 迴圈貪婪選擇
        double res = 0;
        foreach (Item item in items) {
            if (item.w <= cap) {
                // 若剩餘容量充足，則將當前物品整個裝進背包
                res += item.v;
                cap -= item.w;
            } else {
                // 若剩餘容量不足，則將當前物品的一部分裝進背包
                res += (double)item.v / item.w * cap;
                // 已無剩餘容量，因此跳出迴圈
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
        Console.WriteLine("不超過背包容量的最大物品價值為 " + res);
    }
}