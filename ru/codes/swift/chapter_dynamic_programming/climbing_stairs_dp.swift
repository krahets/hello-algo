/**
 * File: climbing_stairs_dp.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Подъем по лестнице: динамическое программирование */
func climbingStairsDP(n: Int) -> Int {
    if n == 1 || n == 2 {
        return n
    }
    // Инициализировать таблицу dp для хранения решений подзадач
    var dp = Array(repeating: 0, count: n + 1)
    // Начальное состояние: заранее задать решения для наименьших подзадач
    dp[1] = 1
    dp[2] = 2
    // Переход состояния: последовательно решать более крупные подзадачи, исходя из меньших
    for i in 3 ... n {
        dp[i] = dp[i - 1] + dp[i - 2]
    }
    return dp[n]
}

/* Подъем по лестнице: динамическое программирование с оптимизацией памяти */
func climbingStairsDPComp(n: Int) -> Int {
    if n == 1 || n == 2 {
        return n
    }
    var a = 1
    var b = 2
    for _ in 3 ... n {
        (a, b) = (b, a + b)
    }
    return b
}

@main
enum ClimbingStairsDP {
    /* Driver Code */
    static func main() {
        let n = 9

        var res = climbingStairsDP(n: n)
        print("Для подъема по лестнице из \(n) ступеней существует \(res) способов")

        res = climbingStairsDPComp(n: n)
        print("Для подъема по лестнице из \(n) ступеней существует \(res) способов")
    }
}
