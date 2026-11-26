/**
 * File: min_cost_climbing_stairs_dp.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Минимальная стоимость подъёма: динамическое программирование */
func minCostClimbingStairsDP(cost: [Int]) -> Int {
    let n = cost.count - 1
    if n == 1 || n == 2 {
        return cost[n]
    }
    // Создать таблицу dp для решений подзадач
    var dp = Array(repeating: 0, count: n + 1)
    // Начальные состояния: задать решения простейших подзадач
    dp[1] = cost[1]
    dp[2] = cost[2]
    // Переход: решать подзадачи от меньших к большим
    for i in 3 ... n {
        dp[i] = min(dp[i - 1], dp[i - 2]) + cost[i]
    }
    return dp[n]
}

/* Минимальная стоимость подъёма: динамическое программирование с экономией памяти */
func minCostClimbingStairsDPComp(cost: [Int]) -> Int {
    let n = cost.count - 1
    if n == 1 || n == 2 {
        return cost[n]
    }
    var (a, b) = (cost[1], cost[2])
    for i in 3 ... n {
        (a, b) = (b, min(a, b) + cost[i])
    }
    return b
}

@main
enum MinCostClimbingStairsDP {
    /* Основная программа */
    static func main() {
        let cost = [0, 1, 10, 1, 1, 1, 10, 1, 1, 10, 1]
        print("Стоимость ступеней: \(cost)")

        var res = minCostClimbingStairsDP(cost: cost)
        print("Минимальная стоимость подъёма: \(res)")

        res = minCostClimbingStairsDPComp(cost: cost)
        print("Минимальная стоимость подъёма: \(res)")
    }
}
