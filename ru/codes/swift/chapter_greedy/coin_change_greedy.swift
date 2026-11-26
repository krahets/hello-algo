/**
 * File: coin_change_greedy.swift
 * Created Time: 2023-09-03
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Размен монет: жадный алгоритм */
func coinChangeGreedy(coins: [Int], amt: Int) -> Int {
    // Список coins предполагается отсортированным
    var i = coins.count - 1
    var count = 0
    var amt = amt
    // Повторяем жадный выбор, пока остаток суммы не обнулится
    while amt > 0 {
        // Ищем наибольший номинал, не превышающий остаток
        while i > 0 && coins[i] > amt {
            i -= 1
        }
        // Берём coins[i]
        amt -= coins[i]
        count += 1
    }
    // Если решения не нашлось, возвращаем -1
    return amt == 0 ? count : -1
}

@main
enum CoinChangeGreedy {
    /* Пример запуска */
    static func main() {
        // Для этих номиналов жадный алгоритм гарантирует глобальный оптимум
        var coins = [1, 5, 10, 20, 50, 100]
        var amt = 186
        var res = coinChangeGreedy(coins: coins, amt: amt)
        print("\ncoins = \(coins), amount = \(amt)")
        print("Для суммы \(amt) минимальное число монет: \(res)")

        // Для этих номиналов жадный алгоритм не гарантирует глобального оптимума
        coins = [1, 20, 50]
        amt = 60
        res = coinChangeGreedy(coins: coins, amt: amt)
        print("\ncoins = \(coins), amount = \(amt)")
        print("Для суммы \(amt) минимальное число монет: \(res)")
        print("На самом деле минимум — 3 монеты: 20 + 20 + 20")

        // Для этих номиналов жадный алгоритм не гарантирует глобального оптимума
        coins = [1, 49, 50]
        amt = 98
        res = coinChangeGreedy(coins: coins, amt: amt)
        print("\ncoins = \(coins), amount = \(amt)")
        print("Для суммы \(amt) минимальное число монет: \(res)")
        print("На самом деле минимум — 2 монеты: 49 + 49")
    }
}
