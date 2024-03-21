/**
 * File: fractional_knapsack.ts
 * Created Time: 2023-09-02
 * Author: Justin (xiefahit@gmail.com)
 */

/* 物品 */
class Item {
    w: number; // 物品重量
    v: number; // 物品價值

    constructor(w: number, v: number) {
        this.w = w;
        this.v = v;
    }
}

/* 分數背包：貪婪 */
function fractionalKnapsack(wgt: number[], val: number[], cap: number): number {
    // 建立物品串列，包含兩個屬性：重量、價值
    const items: Item[] = wgt.map((w, i) => new Item(w, val[i]));
    // 按照單位價值 item.v / item.w 從高到低進行排序
    items.sort((a, b) => b.v / b.w - a.v / a.w);
    // 迴圈貪婪選擇
    let res = 0;
    for (const item of items) {
        if (item.w <= cap) {
            // 若剩餘容量充足，則將當前物品整個裝進背包
            res += item.v;
            cap -= item.w;
        } else {
            // 若剩餘容量不足，則將當前物品的一部分裝進背包
            res += (item.v / item.w) * cap;
            // 已無剩餘容量，因此跳出迴圈
            break;
        }
    }
    return res;
}

/* Driver Code */
const wgt: number[] = [10, 20, 30, 40, 50];
const val: number[] = [50, 120, 150, 210, 240];
const cap: number = 50;

// 貪婪演算法
const res: number = fractionalKnapsack(wgt, val, cap);
console.log(`不超過背包容量的最大物品價值為 ${res}`);

export {};
