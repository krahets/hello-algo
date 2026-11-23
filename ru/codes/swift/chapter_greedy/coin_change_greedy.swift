/**
 * File: coin_change_greedy.swift
 * Created Time: 2023-09-03
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Размен монет: жадный алгоритм */
func coinChangeGreedy(coins: [Int], amt: Int) -> Int {
    // Предположить, что список coins упорядочен
    var i = coins.count - 1
    var count = 0
    var amt = amt
    // Циклически выполнять жадный выбор, пока не останется суммы
    while amt > 0 {
        // Найти монету, которая меньше остатка суммы и наиболее к нему близка
        while i > 0 && coins[i] > amt {
            i -= 1
        }
        // Выбрать coins[i]
        amt -= coins[i]
        count += 1
    }
    // Если допустимое решение не найдено, вернуть -1
    return amt == 0 ? count : -1
}

@main
enum CoinChangeGreedy {
    /* Driver Code */
    static func main() {
        // Жадный подход: гарантирует нахождение глобально оптимального решения
        var coins = [1, 5, 10, 20, 50, 100]
        var amt = 186
        var res = coinChangeGreedy(coins: coins, amt: amt)
        print("\ncoins = \(coins), amount = \(amt)")
        print("Минимальное число монет для набора суммы \(amt) = \(res)")

        // Жадный подход: не гарантирует нахождение глобально оптимального решения
        coins = [1, 20, 50]
        amt = 60
        res = coinChangeGreedy(coins: coins, amt: amt)
        print("\ncoins = \(coins), amount = \(amt)")
        print("Минимальное число монет для набора суммы \(amt) = \(res)")
        print("На самом деле минимум равен 3: 20 + 20 + 20")

        // Жадный подход: не гарантирует нахождение глобально оптимального решения
        coins = [1, 49, 50]
        amt = 98
        res = coinChangeGreedy(coins: coins, amt: amt)
        print("\ncoins = \(coins), amount = \(amt)")
        print("Минимальное число монет для набора суммы \(amt) = \(res)")
        print("На самом деле минимум равен 2: 49 + 49")
    }
}
