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

/* 分割可能ナップサック問題：貪欲法 */
function fractionalKnapsack(wgt, val, cap) {
    // 重さと価値の 2 つの属性を持つ品物のリストを作成する
    const items = wgt.map((w, i) => new Item(w, val[i]));
    // 単位重さ当たりの価値 item.v / item.w の降順にソートする
    items.sort((a, b) => b.v / b.w - a.v / a.w);
    // 貪欲な選択を繰り返す
    let res = 0;
    for (const item of items) {
        if (item.w <= cap) {
            // 残り容量が十分なら、現在の品物を丸ごとナップサックに入れる
            res += item.v;
            cap -= item.w;
        } else {
            // 残り容量が不足している場合、現在の品物の一部をナップサックに入れる
            res += (item.v / item.w) * cap;
            // 残り容量がないため、ループを終了する
            break;
        }
    }
    return res;
}

/* 実行用コード */
const wgt = [10, 20, 30, 40, 50];
const val = [50, 120, 150, 210, 240];
const cap = 50;
const n = wgt.length;

// 貪欲アルゴリズム
const res = fractionalKnapsack(wgt, val, cap);
console.log(`ナップサックの容量を超えない品物の最大価値は ${res}`);
