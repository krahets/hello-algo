/**
 * File: coin_change_greedy.swift
 * Created Time: 2023-09-03
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Coin change: greedy algorithm */
func coinChangeGreedy(coins: [Int], amt: Int) -> Int {
    // Assume the coins list is sorted in ascending order
    var i = coins.count - 1
    var count = 0
    var amt = amt
    // Repeatedly make greedy choices until no amount remains
    while amt > 0 {
        // Find the largest coin no greater than the remaining amount
        while i > 0 && coins[i] > amt {
            i -= 1
        }
        // Choose coins[i]
        amt -= coins[i]
        count += 1
    }
    // Return -1 if no feasible solution was found
    return amt == 0 ? count : -1
}

@main
enum CoinChangeGreedy {
    /* Driver code */
    static func main() {
        // Greedy algorithm: guaranteed to find a globally optimal solution
        var coins = [1, 5, 10, 20, 50, 100]
        var amt = 186
        var res = coinChangeGreedy(coins: coins, amt: amt)
        print("\ncoins = \(coins), amount = \(amt)")
        print("Greedy coin count for amount \(amt): \(res)")

        // Greedy algorithm: not guaranteed to find a globally optimal solution
        coins = [1, 20, 50]
        amt = 60
        res = coinChangeGreedy(coins: coins, amt: amt)
        print("\ncoins = \(coins), amount = \(amt)")
        print("Greedy coin count for amount \(amt): \(res)")
        print("The actual minimum is 3 coins: 20 + 20 + 20")

        // Greedy algorithm: not guaranteed to find a globally optimal solution
        coins = [1, 49, 50]
        amt = 98
        res = coinChangeGreedy(coins: coins, amt: amt)
        print("\ncoins = \(coins), amount = \(amt)")
        print("Greedy coin count for amount \(amt): \(res)")
        print("The actual minimum is 2 coins: 49 + 49")
    }
}
