/**
 * File: coin_change_greedy.swift
 * Created Time: 2023-09-03
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Greedy coin change */
func coinChangeGreedy(coins: [Int], amt: Int) -> Int {
    // Assume the coins list is sorted
    var i = coins.count - 1
    var count = 0
    var amt = amt
    // Make greedy choices until no amount remains
    while amt > 0 {
        // Find the largest denomination that does not exceed the remaining amount
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
        // Greedy choices are guaranteed to give a global optimum here
        var coins = [1, 5, 10, 20, 50, 100]
        var amt = 186
        var res = coinChangeGreedy(coins: coins, amt: amt)
        print("\ncoins = \(coins), amount = \(amt)")
        print("The minimum number of coins needed to make \(amt) is \(res)")

        // Greedy choices do not guarantee a global optimum here
        coins = [1, 20, 50]
        amt = 60
        res = coinChangeGreedy(coins: coins, amt: amt)
        print("\ncoins = \(coins), amount = \(amt)")
        print("The minimum number of coins needed to make \(amt) is \(res)")
        print("The actual minimum is 3 coins: 20 + 20 + 20")

        // Greedy choices do not guarantee a global optimum here
        coins = [1, 49, 50]
        amt = 98
        res = coinChangeGreedy(coins: coins, amt: amt)
        print("\ncoins = \(coins), amount = \(amt)")
        print("The minimum number of coins needed to make \(amt) is \(res)")
        print("The actual minimum is 2 coins: 49 + 49")
    }
}
