/**
 * File: coin_change.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Размен монет: динамическое программирование */
func coinChangeDP(coins: [Int], amt: Int) -> Int {
    let n = coins.count
    let MAX = amt + 1
    // Инициализировать таблицу dp
    var dp = Array(repeating: Array(repeating: 0, count: amt + 1), count: n + 1)
    // Переход состояния: первая строка и первый столбец
    for a in 1 ... amt {
        dp[0][a] = MAX
    }
    // Переход состояния: остальные строки и столбцы
    for i in 1 ... n {
        for a in 1 ... amt {
            if coins[i - 1] > a {
                // Если сумма превышает целевое значение, не брать монету i
                dp[i][a] = dp[i - 1][a]
            } else {
                // Выбрать меньшее из двух вариантов: не брать или взять монету i
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
    // Инициализировать таблицу dp
    var dp = Array(repeating: MAX, count: amt + 1)
    dp[0] = 0
    // Переход состояния
    for i in 1 ... n {
        for a in 1 ... amt {
            if coins[i - 1] > a {
                // Если сумма превышает целевое значение, не брать монету i
                dp[a] = dp[a]
            } else {
                // Выбрать меньшее из двух вариантов: не брать или взять монету i
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
        print("Минимальное число монет, необходимое для получения целевой суммы, равно \(res)")

        // Динамическое программирование с оптимизацией по памяти
        res = coinChangeDPComp(coins: coins, amt: amt)
        print("Минимальное число монет, необходимое для получения целевой суммы, равно \(res)")
    }
}
