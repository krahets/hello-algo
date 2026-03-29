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

/* 分数ナップサック：貪欲法 */
func fractionalKnapsack(wgt: [Int], val: [Int], cap: Int) -> Double {
    // 重さと価値の 2 属性を持つ品物リストを作成
    var items = zip(wgt, val).map { Item(w: $0, v: $1) }
    // 単位価値 item.v / item.w の高い順にソートする
    items.sort { -(Double($0.v) / Double($0.w)) < -(Double($1.v) / Double($1.w)) }
    // 貪欲選択を繰り返す
    var res = 0.0
    var cap = cap
    for item in items {
        if item.w <= cap {
            // 残り容量が十分なら、現在の品物を丸ごとナップサックに入れる
            res += Double(item.v)
            cap -= item.w
        } else {
            // 残り容量が足りない場合は、現在の品物の一部だけをナップサックに入れる
            res += Double(item.v) / Double(item.w) * Double(cap)
            // 残り容量がないため、ループを抜ける
            break
        }
    }
    return res
}

@main
enum FractionalKnapsack {
    /* Driver Code */
    static func main() {
        // 品物の重さ
        let wgt = [10, 20, 30, 40, 50]
        // 品物の価値
        let val = [50, 120, 150, 210, 240]
        // ナップサック容量
        let cap = 50

        // 貪欲法
        let res = fractionalKnapsack(wgt: wgt, val: val, cap: cap)
        print("ナップサック容量を超えない最大価値は \(res)")
    }
}
