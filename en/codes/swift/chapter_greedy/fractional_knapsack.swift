/**
 * File: fractional_knapsack.swift
 * Created Time: 2023-09-03
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Item */
class Item {
    var w: Int // Item weight
    var v: Int // Item value

    init(w: Int, v: Int) {
        self.w = w
        self.v = v
    }
}

/* Fractional knapsack: Greedy algorithm */
func fractionalKnapsack(wgt: [Int], val: [Int], cap: Int) -> Double {
    // Create item list with two attributes: weight, value
    var items = zip(wgt, val).map { Item(w: $0, v: $1) }
    // Sort by unit value item.v / item.w from high to low
    items.sort { -(Double($0.v) / Double($0.w)) < -(Double($1.v) / Double($1.w)) }
    // Loop for greedy selection
    var res = 0.0
    var cap = cap
    for item in items {
        if item.w <= cap {
            // If remaining capacity is sufficient, put the entire current item into the knapsack
            res += Double(item.v)
            cap -= item.w
        } else {
            // If remaining capacity is insufficient, put part of the current item into the knapsack
            res += Double(item.v) / Double(item.w) * Double(cap)
            // No remaining capacity, so break out of the loop
            break
        }
    }
    return res
}

@main
enum FractionalKnapsack {
    /* Driver Code */
    static func main() {
        // Item weight
        let wgt = [10, 20, 30, 40, 50]
        // Item value
        let val = [50, 120, 150, 210, 240]
        // Knapsack capacity
        let cap = 50

        // Greedy algorithm
        let res = fractionalKnapsack(wgt: wgt, val: val, cap: cap)
        print("Maximum item value not exceeding knapsack capacity is \(res)")
    }
}
