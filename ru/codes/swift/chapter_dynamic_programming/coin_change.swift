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
    // Переход: первая строка и первый столбец
    for a in 1 ... amt {
        dp[0][a] = MAX
    }
    // Переход: остальные строки и столбцы
    for i in 1 ... n {
        for a in 1 ... amt {
            if coins[i - 1] > a {
                // Если номинал превышает нужную сумму, не брать монету i
                dp[i][a] = dp[i - 1][a]
            } else {
                // Взять минимум из двух вариантов: без монеты i и с ней
                dp[i][a] = min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1)
            }
        }
    }
    return dp[n][amt] != MAX ? dp[n][amt] : -1
}

/* Размен монет: динамическое программирование с экономией памяти */
func coinChangeDPComp(coins: [Int], amt: Int) -> Int {
    let n = coins.count
    let MAX = amt + 1
    // Инициализировать таблицу dp
    var dp = Array(repeating: MAX, count: amt + 1)
    dp[0] = 0
    // Переход между состояниями
    for i in 1 ... n {
        for a in 1 ... amt {
            if coins[i - 1] > a {
                // Если номинал превышает нужную сумму, не брать монету i
                dp[a] = dp[a]
            } else {
                // Взять минимум из двух вариантов: без монеты i и с ней
                dp[a] = min(dp[a], dp[a - coins[i - 1]] + 1)
            }
        }
    }
    return dp[amt] != MAX ? dp[amt] : -1
}

@main
enum CoinChange {
    /* Основная программа */
    static func main() {
        let coins = [1, 2, 5]
        let amt = 4

        // Динамическое программирование
        var res = coinChangeDP(coins: coins, amt: amt)
        print("Минимальное число монет для заданной суммы: \(res)")

        // Динамическое программирование с экономией памяти
        res = coinChangeDPComp(coins: coins, amt: amt)
        print("Минимальное число монет для заданной суммы: \(res)")
    }
}
