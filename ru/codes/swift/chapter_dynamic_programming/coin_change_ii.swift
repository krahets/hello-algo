/**
 * File: coin_change_ii.swift
 * Created Time: 2023-07-16
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Размен монет II: динамическое программирование */
func coinChangeIIDP(coins: [Int], amt: Int) -> Int {
    let n = coins.count
    // Инициализация таблицы dp
    var dp = Array(repeating: Array(repeating: 0, count: amt + 1), count: n + 1)
    // Инициализация первого столбца
    for i in 0 ... n {
        dp[i][0] = 1
    }
    // Переход состояний
    for i in 1 ... n {
        for a in 1 ... amt {
            if coins[i - 1] > a {
                // Если целевая сумма превышена, монету i не выбирать
                dp[i][a] = dp[i - 1][a]
            } else {
                // Сумма двух решений: не брать или взять монету i
                dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]]
            }
        }
    }
    return dp[n][amt]
}

/* Размен монет II: динамическое программирование с оптимизацией памяти */
func coinChangeIIDPComp(coins: [Int], amt: Int) -> Int {
    let n = coins.count
    // Инициализация таблицы dp
    var dp = Array(repeating: 0, count: amt + 1)
    dp[0] = 1
    // Переход состояний
    for i in 1 ... n {
        for a in 1 ... amt {
            if coins[i - 1] > a {
                // Если целевая сумма превышена, монету i не выбирать
                dp[a] = dp[a]
            } else {
                // Сумма двух решений: не брать или взять монету i
                dp[a] = dp[a] + dp[a - coins[i - 1]]
            }
        }
    }
    return dp[amt]
}

@main
enum CoinChangeII {
    /* Driver Code */
    static func main() {
        let coins = [1, 2, 5]
        let amt = 5

        // Динамическое программирование
        var res = coinChangeIIDP(coins: coins, amt: amt)
        print("Количество комбинаций монет для набора целевой суммы = \(res)")

        // Динамическое программирование с оптимизацией памяти
        res = coinChangeIIDPComp(coins: coins, amt: amt)
        print("Количество комбинаций монет для набора целевой суммы = \(res)")
    }
}
