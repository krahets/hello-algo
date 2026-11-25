/**
 * File: fractional_knapsack.js
 * Created Time: 2023-09-02
 * Author: Justin (xiefahit@gmail.com)
 */

/* 物品 */
class Item {
    constructor(w, v) {
        this.w = w; // 物品重量
        this.v = v; // 物品價值
    }
}

/* 分數背包：貪婪法 */
function fractionalKnapsack(wgt, val, cap) {
    // 建立物品清單，每件物品有重量與價值兩項屬性
    const items = wgt.map((w, i) => new Item(w, val[i]));
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
const wgt = [10, 20, 30, 40, 50];
const val = [50, 120, 150, 210, 240];
const cap = 50;
const n = wgt.length;

// 貪婪演算法
const res = fractionalKnapsack(wgt, val, cap);
console.log(`在背包容量限制內，物品的最大總價值為 ${res}`);
