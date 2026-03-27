/**
 * File: coin_change.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Размен монет: динамическое программирование */
func coinChangeDP(coins: [Int], amt: Int) -> Int {
    let n = coins.count
    let MAX = amt + 1
    // Инициализация таблицы dp
    var dp = Array(repeating: Array(repeating: 0, count: amt + 1), count: n + 1)
    // Переход состояний: первая строка и первый столбец
    for a in 1 ... amt {
        dp[0][a] = MAX
    }
    // Переход состояний: остальные строки и столбцы
    for i in 1 ... n {
        for a in 1 ... amt {
            if coins[i - 1] > a {
                // Если целевая сумма превышена, монету i не выбирать
                dp[i][a] = dp[i - 1][a]
            } else {
                // Меньшее из двух решений: не брать или взять монету i
                dp[i][a] = min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1)
            }
        }
    }
    return dp[n][amt] != MAX ? dp[n][amt] : -1
}

/* Размен монет: динамическое программирование с оптимизацией памяти */
func coinChangeDPComp(coins: [Int], amt: Int) -> Int {
    let n = coins.count
    let MAX = amt + 1
    // Инициализация таблицы dp
    var dp = Array(repeating: MAX, count: amt + 1)
    dp[0] = 0
    // Переход состояний
    for i in 1 ... n {
        for a in 1 ... amt {
            if coins[i - 1] > a {
                // Если целевая сумма превышена, монету i не выбирать
                dp[a] = dp[a]
            } else {
                // Меньшее из двух решений: не брать или взять монету i
                dp[a] = min(dp[a], dp[a - coins[i - 1]] + 1)
            }
        }
    }
    return dp[amt] != MAX ? dp[amt] : -1
}

@main
enum CoinChange {
    /* Driver Code */
    static func main() {
        let coins = [1, 2, 5]
        let amt = 4

        // Динамическое программирование
        var res = coinChangeDP(coins: coins, amt: amt)
        print("Минимальное число монет для набора целевой суммы = \(res)")

        // Динамическое программирование с оптимизацией памяти
        res = coinChangeDPComp(coins: coins, amt: amt)
        print("Минимальное число монет для набора целевой суммы = \(res)")
    }
}
