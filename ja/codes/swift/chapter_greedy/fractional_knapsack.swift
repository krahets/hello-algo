/**
 * File: fractional_knapsack.swift
 * Created Time: 2023-09-03
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 品物 */
class Item {
    var w: Int // 品物の重さ
    var v: Int // 品物の価値

    init(w: Int, v: Int) {
        self.w = w
        self.v = v
    }
}

/* 分割可能ナップサック問題：貪欲法 */
func fractionalKnapsack(wgt: [Int], val: [Int], cap: Int) -> Double {
    // 重さと価値の 2 つの属性を持つ品物のリストを作成する
    var items = zip(wgt, val).map { Item(w: $0, v: $1) }
    // 単位重さ当たりの価値 item.v / item.w の降順にソートする
    items.sort { -(Double($0.v) / Double($0.w)) < -(Double($1.v) / Double($1.w)) }
    // 貪欲な選択を繰り返す
    var res = 0.0
    var cap = cap
    for item in items {
        if item.w <= cap {
            // 残り容量が十分なら、現在の品物を丸ごとナップサックに入れる
            res += Double(item.v)
            cap -= item.w
        } else {
            // 残り容量が不足している場合、現在の品物の一部をナップサックに入れる
            res += Double(item.v) / Double(item.w) * Double(cap)
            // 残り容量がないため、ループを終了する
            break
        }
    }
    return res
}

@main
enum FractionalKnapsack {
    /* 実行用コード */
    static func main() {
        // 品物の重さ
        let wgt = [10, 20, 30, 40, 50]
        // 品物の価値
        let val = [50, 120, 150, 210, 240]
        // ナップサックの容量
        let cap = 50

        // 貪欲アルゴリズム
        let res = fractionalKnapsack(wgt: wgt, val: val, cap: cap)
        print("ナップサックの容量を超えない品物の最大価値は \(res)")
    }
}
