/**
 * File: coin_change_greedy.swift
 * Created Time: 2023-09-03
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* コイン交換：貪欲法 */
func coinChangeGreedy(coins: [Int], amt: Int) -> Int {
    // coins リストはソート済みと仮定する
    var i = coins.count - 1
    var count = 0
    var amt = amt
    // 残額がなくなるまで貪欲選択を繰り返す
    while amt > 0 {
        // 残額以下で最も近い硬貨を見つける
        while i > 0 && coins[i] > amt {
            i -= 1
        }
        // coins[i] を選択する
        amt -= coins[i]
        count += 1
    }
    // 実行可能な解が見つからなければ -1 を返す
    return amt == 0 ? count : -1
}

@main
enum CoinChangeGreedy {
    /* Driver Code */
    static func main() {
        // 貪欲法：大域最適解を保証できる
        var coins = [1, 5, 10, 20, 50, 100]
        var amt = 186
        var res = coinChangeGreedy(coins: coins, amt: amt)
        print("\ncoins = \(coins), amount = \(amt)")
        print("\(amt) を作るのに必要な最小硬貨枚数は \(res)")

        // 貪欲法：大域最適解を保証できない
        coins = [1, 20, 50]
        amt = 60
        res = coinChangeGreedy(coins: coins, amt: amt)
        print("\ncoins = \(coins), amount = \(amt)")
        print("\(amt) を作るのに必要な最小硬貨枚数は \(res)")
        print("実際に必要な最小枚数は 3、つまり 20 + 20 + 20")

        // 貪欲法：大域最適解を保証できない
        coins = [1, 49, 50]
        amt = 98
        res = coinChangeGreedy(coins: coins, amt: amt)
        print("\ncoins = \(coins), amount = \(amt)")
        print("\(amt) を作るのに必要な最小硬貨枚数は \(res)")
        print("実際に必要な最小枚数は 2、つまり 49 + 49")
    }
}
