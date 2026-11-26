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

/* 分割可能ナップサック（貪欲法） */
function fractionalKnapsack(wgt: number[], val: number[], cap: number): number {
    // 重さと価値の 2 つの属性を持つ品物のリストを作る
    const items: Item[] = wgt.map((w, i) => new Item(w, val[i]));
    // 単位重量あたりの価値 item.v / item.w の降順にソートする
    items.sort((a, b) => b.v / b.w - a.v / a.w);
    // 貪欲選択を繰り返す
    let res = 0;
    for (const item of items) {
        if (item.w <= cap) {
            // 残り容量が十分なら、現在の品物を丸ごと入れる
            res += item.v;
            cap -= item.w;
        } else {
            // 残り容量が足りなければ、現在の品物の一部を入れる
            res += (item.v / item.w) * cap;
            // 残り容量がないためループを抜ける
            break;
        }
    }
    return res;
}

/* 実行例 */
const wgt: number[] = [10, 20, 30, 40, 50];
const val: number[] = [50, 120, 150, 210, 240];
const cap: number = 50;

// 貪欲法
const res: number = fractionalKnapsack(wgt, val, cap);
console.log(`容量内で得られる品物の合計価値の最大値は ${res}`);

export {};
