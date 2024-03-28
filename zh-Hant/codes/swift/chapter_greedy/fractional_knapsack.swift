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

/* 分數背包：貪婪 */
func fractionalKnapsack(wgt: [Int], val: [Int], cap: Int) -> Double {
    // 建立物品串列，包含兩個屬性：重量、價值
    var items = zip(wgt, val).map { Item(w: $0, v: $1) }
    // 按照單位價值 item.v / item.w 從高到低進行排序
    items.sort { -(Double($0.v) / Double($0.w)) < -(Double($1.v) / Double($1.w)) }
    // 迴圈貪婪選擇
    var res = 0.0
    var cap = cap
    for item in items {
        if item.w <= cap {
            // 若剩餘容量充足，則將當前物品整個裝進背包
            res += Double(item.v)
            cap -= item.w
        } else {
            // 若剩餘容量不足，則將當前物品的一部分裝進背包
            res += Double(item.v) / Double(item.w) * Double(cap)
            // 已無剩餘容量，因此跳出迴圈
            break
        }
    }
    return res
}

@main
enum FractionalKnapsack {
    /* Driver Code */
    static func main() {
        // 物品重量
        let wgt = [10, 20, 30, 40, 50]
        // 物品價值
        let val = [50, 120, 150, 210, 240]
        // 背包容量
        let cap = 50

        // 貪婪演算法
        let res = fractionalKnapsack(wgt: wgt, val: val, cap: cap)
        print("不超過背包容量的最大物品價值為 \(res)")
    }
}
