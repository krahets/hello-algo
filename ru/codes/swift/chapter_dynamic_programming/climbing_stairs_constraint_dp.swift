/**
 * File: climbing_stairs_constraint_dp.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Подъем по лестнице с ограничениями: динамическое программирование */
func climbingStairsConstraintDP(n: Int) -> Int {
    if n == 1 || n == 2 {
        return 1
    }
    // Инициализировать таблицу dp для хранения решений подзадач
    var dp = Array(repeating: Array(repeating: 0, count: 3), count: n + 1)
    // Начальное состояние: заранее задать решения для наименьших подзадач
    dp[1][1] = 1
    dp[1][2] = 0
    dp[2][1] = 0
    dp[2][2] = 1
    // Переход состояния: последовательно решать более крупные подзадачи, исходя из меньших
    for i in 3 ... n {
        dp[i][1] = dp[i - 1][2]
        dp[i][2] = dp[i - 2][1] + dp[i - 2][2]
    }
    return dp[n][1] + dp[n][2]
}

@main
enum ClimbingStairsConstraintDP {
    /* Driver Code */
    static func main() {
        let n = 9

        let res = climbingStairsConstraintDP(n: n)
        print("Для подъема по лестнице из \(n) ступеней существует \(res) способов")
    }
}
