/**
 * File: coin_change_greedy.swift
 * Created Time: 2023-09-03
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 탐욕 알고리즘으로 거스름돈 만들기 */
func coinChangeGreedy(coins: [Int], amt: Int) -> Int {
    // coins 리스트는 오름차순으로 정렬되어 있다고 가정한다
    var i = coins.count - 1
    var count = 0
    var amt = amt
    // 남은 금액이 없어질 때까지 탐욕 선택을 반복한다
    while amt > 0 {
        // 남은 금액보다 작으면서 그 금액에 가장 가까운 동전을 찾는다
        while i > 0 && coins[i] > amt {
            i -= 1
        }
        // coins[i] 선택
        amt -= coins[i]
        count += 1
    }
    // 가능한 방법을 찾지 못하면 -1을 반환한다
    return amt == 0 ? count : -1
}

@main
enum CoinChangeGreedy {
    /* 실행 예제 */
    static func main() {
        // 탐욕 선택이 전역 최적해를 보장하는 경우
        var coins = [1, 5, 10, 20, 50, 100]
        var amt = 186
        var res = coinChangeGreedy(coins: coins, amt: amt)
        print("\ncoins = \(coins), amount = \(amt)")
        print("목표 금액 \(amt), 필요한 최소 동전 수: \(res)")

        // 탐욕 선택이 전역 최적해를 보장하지 않는 경우
        coins = [1, 20, 50]
        amt = 60
        res = coinChangeGreedy(coins: coins, amt: amt)
        print("\ncoins = \(coins), amount = \(amt)")
        print("목표 금액 \(amt), 필요한 최소 동전 수: \(res)")
        print("실제로는 20 + 20 + 20으로 최소 3개가 필요하다")

        // 탐욕 선택이 전역 최적해를 보장하지 않는 경우
        coins = [1, 49, 50]
        amt = 98
        res = coinChangeGreedy(coins: coins, amt: amt)
        print("\ncoins = \(coins), amount = \(amt)")
        print("목표 금액 \(amt), 필요한 최소 동전 수: \(res)")
        print("실제로는 49 + 49로 최소 2개가 필요하다")
    }
}
