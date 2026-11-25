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

/* 分數背包：貪婪法 */
function fractionalKnapsack(wgt: number[], val: number[], cap: number): number {
    // 建立物品清單，每件物品有重量與價值兩項屬性
    const items: Item[] = wgt.map((w, i) => new Item(w, val[i]));
    // 依單位價值 item.v / item.w 由高到低排序
    items.sort((a, b) => b.v / b.w - a.v / a.w);
    // 反覆依貪婪策略選取物品
    let res = 0;
    for (const item of items) {
        if (item.w <= cap) {
            // 若剩餘容量足夠，就將目前的物品整件裝入背包
            res += item.v;
            cap -= item.w;
        } else {
            // 若剩餘容量不足，就將目前物品的一部分裝入背包
            res += (item.v / item.w) * cap;
            // 背包已滿，跳出迴圈
            break;
        }
    }
    return res;
}

/* 主程式 */
const wgt: number[] = [10, 20, 30, 40, 50];
const val: number[] = [50, 120, 150, 210, 240];
const cap: number = 50;

// 貪婪演算法
const res: number = fractionalKnapsack(wgt, val, cap);
console.log(`在背包容量限制內，物品的最大總價值為 ${res}`);

export {};
