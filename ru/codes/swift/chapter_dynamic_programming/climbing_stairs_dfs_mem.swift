/**
 * File: climbing_stairs_dfs_mem.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Поиск с мемоизацией */
func dfs(i: Int, mem: inout [Int]) -> Int {
    // Для dp[1] и dp[2] вернуть известные значения
    if i == 1 || i == 2 {
        return i
    }
    // Если dp[i] уже вычислено, вернуть сохранённое значение
    if mem[i] != -1 {
        return mem[i]
    }
    // dp[i] = dp[i-1] + dp[i-2]
    let count = dfs(i: i - 1, mem: &mem) + dfs(i: i - 2, mem: &mem)
    // Сохранить dp[i]
    mem[i] = count
    return count
}

/* Подъём по лестнице: поиск с мемоизацией */
func climbingStairsDFSMem(n: Int) -> Int {
    // mem[i] хранит число способов достичь ступени i, а -1 означает отсутствие записи
    var mem = Array(repeating: -1, count: n + 1)
    return dfs(i: n, mem: &mem)
}

@main
enum ClimbingStairsDFSMem {
    /* Основная программа */
    static func main() {
        let n = 9

        let res = climbingStairsDFSMem(n: n)
        print("Число способов подняться на лестницу из \(n) ступеней: \(res).")
    }
}
