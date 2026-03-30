/**
 * File: fractional_knapsack.js
 * Created Time: 2023-09-02
 * Author: Justin (xiefahit@gmail.com)
 */

/* 品物 */
class Item {
    constructor(w, v) {
        this.w = w; // 品物の重さ
        this.v = v; // 品物の価値
    }
}

/* 分数ナップサック：貪欲法 */
function fractionalKnapsack(wgt, val, cap) {
    // 重さと価値の 2 属性を持つ品物リストを作成
    const items = wgt.map((w, i) => new Item(w, val[i]));
    // 単位価値 item.v / item.w の高い順にソートする
    items.sort((a, b) => b.v / b.w - a.v / a.w);
    // 貪欲選択を繰り返す
    let res = 0;
    for (const item of items) {
        if (item.w <= cap) {
            // 残り容量が十分なら、現在の品物を丸ごとナップサックに入れる
            res += item.v;
            cap -= item.w;
        } else {
            // 残り容量が足りない場合は、現在の品物の一部だけをナップサックに入れる
            res += (item.v / item.w) * cap;
            // 残り容量がないため、ループを抜ける
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

// 貪欲法
const res = fractionalKnapsack(wgt, val, cap);
console.log(`ナップサック容量を超えない最大価値は ${res}`);
