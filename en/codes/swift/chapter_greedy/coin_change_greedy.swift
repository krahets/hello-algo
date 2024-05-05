/**
 * File: coin_change_greedy.swift
 * Created Time: 2023-09-03
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Coin change: Greedy */
func coinChangeGreedy(coins: [Int], amt: Int) -> Int {
    // Assume coins list is ordered
    var i = coins.count - 1
    var count = 0
    var amt = amt
    // Loop for greedy selection until no remaining amount
    while amt > 0 {
        // Find the smallest coin close to and less than the remaining amount
        while i > 0 && coins[i] > amt {
            i -= 1
        }
        // Choose coins[i]
        amt -= coins[i]
        count += 1
    }
    // If no feasible solution is found, return -1
    return amt == 0 ? count : -1
}

@main
enum CoinChangeGreedy {
    /* Driver Code */
    static func main() {
        // Greedy: can ensure finding a global optimal solution
        var coins = [1, 5, 10, 20, 50, 100]
        var amt = 186
        var res = coinChangeGreedy(coins: coins, amt: amt)
        print("\ncoins = \(coins), amount = \(amt)")
        print("Minimum number of coins required to make up \(amt) = \(res)")

        // Greedy: cannot ensure finding a global optimal solution
        coins = [1, 20, 50]
        amt = 60
        res = coinChangeGreedy(coins: coins, amt: amt)
        print("\ncoins = \(coins), amount = \(amt)")
        print("Minimum number of coins required to make up \(amt) = \(res)")
        print("In reality, the minimum number needed is 3, i.e., 20 + 20 + 20")

        // Greedy: cannot ensure finding a global optimal solution
        coins = [1, 49, 50]
        amt = 98
        res = coinChangeGreedy(coins: coins, amt: amt)
        print("\ncoins = \(coins), amount = \(amt)")
        print("Minimum number of coins required to make up \(amt) = \(res)")
        print("In reality, the minimum number needed is 2, i.e., 49 + 49")
    }
}
