/**
 * File: fractional_knapsack.swift
 * Created Time: 2023-09-03
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 物品 */
class Item {
    var w: Int // 物品重量
    var v: Int // 物品价值

    init(w: Int, v: Int) {
        self.w = w
        self.v = v
    }
}

/* 分数背包：贪心 */
func fractionalKnapsack(wgt: [Int], val: [Int], cap: Int) -> Double {
    // 创建物品列表，包含两个属性：重量、价值
    var items = zip(wgt, val).map { Item(w: $0, v: $1) }
    // 按照单位价值 item.v / item.w 从高到低进行排序
    items.sort { -(Double($0.v) / Double($0.w)) < -(Double($1.v) / Double($1.w)) }
    // 循环贪心选择
    var res = 0.0
    var cap = cap
    for item in items {
        if item.w <= cap {
            // 若剩余容量充足，则将当前物品整个装进背包
            res += Double(item.v)
            cap -= item.w
        } else {
            // 若剩余容量不足，则将当前物品的一部分装进背包
            res += Double(item.v) / Double(item.w) * Double(cap)
            // 已无剩余容量，因此跳出循环
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
        // 物品价值
        let val = [50, 120, 150, 210, 240]
        // 背包容量
        let cap = 50

        // 贪心算法
        let res = fractionalKnapsack(wgt: wgt, val: val, cap: cap)
        print("不超过背包容量的最大物品价值为 \(res)")
    }
}
