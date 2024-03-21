/**
 * File: fractional_knapsack.ts
 * Created Time: 2023-09-02
 * Author: Justin (xiefahit@gmail.com)
 */

/* 物品 */
class Item {
    w: number; // 物品重量
    v: number; // 物品价值

    constructor(w: number, v: number) {
        this.w = w;
        this.v = v;
    }
}

/* 分数背包：贪心 */
function fractionalKnapsack(wgt: number[], val: number[], cap: number): number {
    // 创建物品列表，包含两个属性：重量、价值
    const items: Item[] = wgt.map((w, i) => new Item(w, val[i]));
    // 按照单位价值 item.v / item.w 从高到低进行排序
    items.sort((a, b) => b.v / b.w - a.v / a.w);
    // 循环贪心选择
    let res = 0;
    for (const item of items) {
        if (item.w <= cap) {
            // 若剩余容量充足，则将当前物品整个装进背包
            res += item.v;
            cap -= item.w;
        } else {
            // 若剩余容量不足，则将当前物品的一部分装进背包
            res += (item.v / item.w) * cap;
            // 已无剩余容量，因此跳出循环
            break;
        }
    }
    return res;
}

/* Driver Code */
const wgt: number[] = [10, 20, 30, 40, 50];
const val: number[] = [50, 120, 150, 210, 240];
const cap: number = 50;

// 贪心算法
const res: number = fractionalKnapsack(wgt, val, cap);
console.log(`不超过背包容量的最大物品价值为 ${res}`);

export {};
