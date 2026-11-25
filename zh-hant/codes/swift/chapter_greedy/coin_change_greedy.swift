/**
 * File: coin_change_greedy.swift
 * Created Time: 2023-09-03
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 零錢兌換：貪婪法 */
func coinChangeGreedy(coins: [Int], amt: Int) -> Int {
    // 假設硬幣清單 coins 已依面額遞增排序
    var i = coins.count - 1
    var count = 0
    var amt = amt
    // 反覆依貪婪策略選取硬幣，直到剩餘金額為零
    while amt > 0 {
        // 找出面額小於且最接近剩餘金額的硬幣
        while i > 0 && coins[i] > amt {
            i -= 1
        }
        // 選取 coins[i]
        amt -= coins[i]
        count += 1
    }
    // 若找不到可行解，則回傳 -1
    return amt == 0 ? count : -1
}

@main
enum CoinChangeGreedy {
    /* 主程式 */
    static func main() {
        // 貪婪法：保證能找到全域最佳解
        var coins = [1, 5, 10, 20, 50, 100]
        var amt = 186
        var res = coinChangeGreedy(coins: coins, amt: amt)
        print("\ncoins = \(coins), amount = \(amt)")
        print("湊出 \(amt) 所需的最少硬幣數為 \(res)")

        // 貪婪法：無法保證找到全域最佳解
        coins = [1, 20, 50]
        amt = 60
        res = coinChangeGreedy(coins: coins, amt: amt)
        print("\ncoins = \(coins), amount = \(amt)")
        print("湊出 \(amt) 所需的最少硬幣數為 \(res)")
        print("實際上最少只需 3 枚，即 20 + 20 + 20")

        // 貪婪法：無法保證找到全域最佳解
        coins = [1, 49, 50]
        amt = 98
        res = coinChangeGreedy(coins: coins, amt: amt)
        print("\ncoins = \(coins), amount = \(amt)")
        print("湊出 \(amt) 所需的最少硬幣數為 \(res)")
        print("實際上最少只需 2 枚，即 49 + 49")
    }
}
