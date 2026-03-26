/**
 * File: coin_change_greedy.swift
 * Created Time: 2023-09-03
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Размен монет: жадный алгоритм */
func coinChangeGreedy(coins: [Int], amt: Int) -> Int {
    // Предположим, что список coins упорядочен
    var i = coins.count - 1
    var count = 0
    var amt = amt
    // Повторять жадный выбор, пока не останется суммы
    while amt > 0 {
        // Найти монету, которая меньше оставшейся суммы и ближе всего к ней
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
        // Жадный подход: позволяет гарантированно найти глобально оптимальное решение
        var coins = [1, 5, 10, 20, 50, 100]
        var amt = 186
        var res = coinChangeGreedy(coins: coins, amt: amt)
        print("\ncoins = \(coins), amount = \(amt)")
        print("Для получения \(amt) минимальное число монет равно \(res)")

        // Жадный подход: не гарантирует нахождение глобально оптимального решения
        coins = [1, 20, 50]
        amt = 60
        res = coinChangeGreedy(coins: coins, amt: amt)
        print("\ncoins = \(coins), amount = \(amt)")
        print("Для получения \(amt) минимальное число монет равно \(res)")
        print("Фактически минимальное необходимое количество равно 3, то есть 20 + 20 + 20")

        // Жадный подход: не гарантирует нахождение глобально оптимального решения
        coins = [1, 49, 50]
        amt = 98
        res = coinChangeGreedy(coins: coins, amt: amt)
        print("\ncoins = \(coins), amount = \(amt)")
        print("Для получения \(amt) минимальное число монет равно \(res)")
        print("Фактически минимальное необходимое количество равно 2, то есть 49 + 49")
    }
}
