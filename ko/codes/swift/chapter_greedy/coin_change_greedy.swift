/**
 * File: coin_change_greedy.swift
 * Created Time: 2023-09-03
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 동전 교환: 탐욕 */
func coinChangeGreedy(coins: [Int], amt: Int) -> Int {
    // coins 리스트가 정렬되어 있다고 가정한다
    var i = coins.count - 1
    var count = 0
    var amt = amt
    // 남은 금액이 없을 때까지 탐욕적 선택을 반복한다
    while amt > 0 {
        // 남은 금액보다 작으면서 가장 가까운 금액의 동전을 찾는다
        while i > 0 && coins[i] > amt {
            i -= 1
        }
        // coins[i]를 선택한다
        amt -= coins[i]
        count += 1
    }
    // 가능한 방법을 찾지 못하면 -1을 반환한다
    return amt == 0 ? count : -1
}

@main
enum CoinChangeGreedy {
    /* 실행 코드 */
    static func main() {
        // 탐욕: 전역 최적해를 찾는 것이 보장된다
        var coins = [1, 5, 10, 20, 50, 100]
        var amt = 186
        var res = coinChangeGreedy(coins: coins, amt: amt)
        print("\ncoins = \(coins), amount = \(amt)")
        print("목표 금액 = \(amt), 필요한 최소 동전 개수 = \(res)")

        // 탐욕: 전역 최적해를 찾는 것이 보장되지 않는다
        coins = [1, 20, 50]
        amt = 60
        res = coinChangeGreedy(coins: coins, amt: amt)
        print("\ncoins = \(coins), amount = \(amt)")
        print("목표 금액 = \(amt), 필요한 최소 동전 개수 = \(res)")
        print("실제로 필요한 최소 개수는 3개이며, 20 + 20 + 20이다")

        // 탐욕: 전역 최적해를 찾는 것이 보장되지 않는다
        coins = [1, 49, 50]
        amt = 98
        res = coinChangeGreedy(coins: coins, amt: amt)
        print("\ncoins = \(coins), amount = \(amt)")
        print("목표 금액 = \(amt), 필요한 최소 동전 개수 = \(res)")
        print("실제로 필요한 최소 개수는 2개이며, 49 + 49이다")
    }
}
