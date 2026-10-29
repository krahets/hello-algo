/**
 * File: fractional_knapsack.ts
 * Created Time: 2023-09-02
 * Author: Justin (xiefahit@gmail.com)
 */

/* 品物 */
class Item {
    w: number; // 品物の重さ
    v: number; // 品物の価値

    constructor(w: number, v: number) {
        this.w = w;
        this.v = v;
    }
}

/* 分割可能ナップサック問題：貪欲法 */
function fractionalKnapsack(wgt: number[], val: number[], cap: number): number {
    // 重さと価値の 2 つの属性を持つ品物のリストを作成する
    const items: Item[] = wgt.map((w, i) => new Item(w, val[i]));
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
const wgt: number[] = [10, 20, 30, 40, 50];
const val: number[] = [50, 120, 150, 210, 240];
const cap: number = 50;

// 貪欲アルゴリズム
const res: number = fractionalKnapsack(wgt, val, cap);
console.log(`ナップサックの容量を超えない品物の最大価値は ${res}`);

export {};
