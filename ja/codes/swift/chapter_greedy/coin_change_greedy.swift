/**
 * File: coin_change_greedy.swift
 * Created Time: 2023-09-03
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 硬貨の両替：貪欲法 */
func coinChangeGreedy(coins: [Int], amt: Int) -> Int {
    // coins リストはソート済みと仮定する
    var i = coins.count - 1
    var count = 0
    var amt = amt
    // 残額がなくなるまで貪欲な選択を繰り返す
    while amt > 0 {
        // 残額より小さく、残額に最も近い硬貨を探す
        while i > 0 && coins[i] > amt {
            i -= 1
        }
        // coins[i] を選ぶ
        amt -= coins[i]
        count += 1
    }
    // 実行可能な方法が見つからなかった場合、-1 を返す
    return amt == 0 ? count : -1
}

@main
enum CoinChangeGreedy {
    /* 実行用コード */
    static func main() {
        // 貪欲法：大域的最適解が得られることを保証できる
        var coins = [1, 5, 10, 20, 50, 100]
        var amt = 186
        var res = coinChangeGreedy(coins: coins, amt: amt)
        print("\ncoins = \(coins), amount = \(amt)")
        print("\(amt) にするために必要な硬貨の最小枚数は \(res)")

        // 貪欲法：大域的最適解が得られることを保証できない
        coins = [1, 20, 50]
        amt = 60
        res = coinChangeGreedy(coins: coins, amt: amt)
        print("\ncoins = \(coins), amount = \(amt)")
        print("\(amt) にするために必要な硬貨の最小枚数は \(res)")
        print("実際に必要な最小枚数は 3 、すなわち 20 + 20 + 20")

        // 貪欲法：大域的最適解が得られることを保証できない
        coins = [1, 49, 50]
        amt = 98
        res = coinChangeGreedy(coins: coins, amt: amt)
        print("\ncoins = \(coins), amount = \(amt)")
        print("\(amt) にするために必要な硬貨の最小枚数は \(res)")
        print("実際に必要な最小枚数は 2 、すなわち 49 + 49")
    }
}
