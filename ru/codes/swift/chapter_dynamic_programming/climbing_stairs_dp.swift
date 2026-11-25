/**
 * File: climbing_stairs_dp.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Подъём по лестнице: динамическое программирование */
func climbingStairsDP(n: Int) -> Int {
    if n == 1 || n == 2 {
        return n
    }
    // Создать таблицу dp для решений подзадач
    var dp = Array(repeating: 0, count: n + 1)
    // Начальные состояния: задать решения простейших подзадач
    dp[1] = 1
    dp[2] = 2
    // Переход: решать подзадачи от меньших к большим
    for i in 3 ... n {
        dp[i] = dp[i - 1] + dp[i - 2]
    }
    return dp[n]
}

/* Подъём по лестнице: динамическое программирование с экономией памяти */
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
    /* Основная программа */
    static func main() {
        let n = 9

        var res = climbingStairsDP(n: n)
        print("Число способов подняться на лестницу из \(n) ступеней: \(res).")

        res = climbingStairsDPComp(n: n)
        print("Число способов подняться на лестницу из \(n) ступеней: \(res).")
    }
}
