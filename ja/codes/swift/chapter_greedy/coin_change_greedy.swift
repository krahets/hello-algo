/**
 * File: coin_change_greedy.swift
 * Created Time: 2023-09-03
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 硬貨の両替（貪欲法） */
func coinChangeGreedy(coins: [Int], amt: Int) -> Int {
    // リスト coins はソート済みとする
    var i = coins.count - 1
    var count = 0
    var amt = amt
    // 残額がなくなるまで貪欲選択を繰り返す
    while amt > 0 {
        // 残額より小さく、最も近い額面の硬貨を探す
        while i > 0 && coins[i] > amt {
            i -= 1
        }
        // coins[i] を選ぶ
        amt -= coins[i]
        count += 1
    }
    // 解が見つからなければ -1 を返す
    return amt == 0 ? count : -1
}

@main
enum CoinChangeGreedy {
    /* 実行例 */
    static func main() {
        // 貪欲法で大域的最適解が必ず求まる例
        var coins = [1, 5, 10, 20, 50, 100]
        var amt = 186
        var res = coinChangeGreedy(coins: coins, amt: amt)
        print("\ncoins = \(coins), amount = \(amt)")
        print("金額 \(amt) を作るのに必要な硬貨の最少枚数は \(res)")

        // 貪欲法では大域的最適解を保証できない例
        coins = [1, 20, 50]
        amt = 60
        res = coinChangeGreedy(coins: coins, amt: amt)
        print("\ncoins = \(coins), amount = \(amt)")
        print("金額 \(amt) を作るのに必要な硬貨の最少枚数は \(res)")
        print("実際の最少枚数は 3 枚（20 + 20 + 20）")

        // 貪欲法では大域的最適解を保証できない例
        coins = [1, 49, 50]
        amt = 98
        res = coinChangeGreedy(coins: coins, amt: amt)
        print("\ncoins = \(coins), amount = \(amt)")
        print("金額 \(amt) を作るのに必要な硬貨の最少枚数は \(res)")
        print("実際の最少枚数は 2 枚（49 + 49）")
    }
}
