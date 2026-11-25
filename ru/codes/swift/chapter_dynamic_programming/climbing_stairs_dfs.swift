/**
 * File: climbing_stairs_dfs.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Поиск */
func dfs(i: Int) -> Int {
    // Для dp[1] и dp[2] вернуть известные значения
    if i == 1 || i == 2 {
        return i
    }
    // dp[i] = dp[i-1] + dp[i-2]
    let count = dfs(i: i - 1) + dfs(i: i - 2)
    return count
}

/* Подъём по лестнице: поиск */
func climbingStairsDFS(n: Int) -> Int {
    dfs(i: n)
}

@main
enum ClimbingStairsDFS {
    /* Основная программа */
    static func main() {
        let n = 9

        let res = climbingStairsDFS(n: n)
        print("Число способов подняться на лестницу из \(n) ступеней: \(res).")
    }
}
