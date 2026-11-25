/**
 * File: fractional_knapsack.swift
 * Created Time: 2023-09-03
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 物品 */
class Item {
    var w: Int // 物品重量
    var v: Int // 物品價值

    init(w: Int, v: Int) {
        self.w = w
        self.v = v
    }
}

/* 分數背包：貪婪法 */
func fractionalKnapsack(wgt: [Int], val: [Int], cap: Int) -> Double {
    // 建立物品清單，每件物品有重量與價值兩項屬性
    var items = zip(wgt, val).map { Item(w: $0, v: $1) }
    // 依單位價值 item.v / item.w 由高到低排序
    items.sort { -(Double($0.v) / Double($0.w)) < -(Double($1.v) / Double($1.w)) }
    // 反覆依貪婪策略選取物品
    var res = 0.0
    var cap = cap
    for item in items {
        if item.w <= cap {
            // 若剩餘容量足夠，就將目前的物品整件裝入背包
            res += Double(item.v)
            cap -= item.w
        } else {
            // 若剩餘容量不足，就將目前物品的一部分裝入背包
            res += Double(item.v) / Double(item.w) * Double(cap)
            // 背包已滿，跳出迴圈
            break
        }
    }
    return res
}

@main
enum FractionalKnapsack {
    /* 主程式 */
    static func main() {
        // 物品重量
        let wgt = [10, 20, 30, 40, 50]
        // 物品價值
        let val = [50, 120, 150, 210, 240]
        // 背包容量
        let cap = 50

        // 貪婪演算法
        let res = fractionalKnapsack(wgt: wgt, val: val, cap: cap)
        print("在背包容量限制內，物品的最大總價值為 \(res)")
    }
}
