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

/* 分數背包：貪婪 */
function fractionalKnapsack(wgt, val, cap) {
    // 建立物品串列，包含兩個屬性：重量、價值
    const items = wgt.map((w, i) => new Item(w, val[i]));
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
const wgt = [10, 20, 30, 40, 50];
const val = [50, 120, 150, 210, 240];
const cap = 50;
const n = wgt.length;

// 貪婪演算法
const res = fractionalKnapsack(wgt, val, cap);
console.log(`不超過背包容量的最大物品價值為 ${res}`);
