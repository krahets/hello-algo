/**
 * File: climbing_stairs_dfs_mem.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Поиск с мемоизацией */
func dfs(i: Int, mem: inout [Int]) -> Int {
    // dp[1] и dp[2] уже известны, вернуть их
    if i == 1 || i == 2 {
        return i
    }
    // Если запись dp[i] существует, сразу вернуть ее
    if mem[i] != -1 {
        return mem[i]
    }
    // dp[i] = dp[i-1] + dp[i-2]
    let count = dfs(i: i - 1, mem: &mem) + dfs(i: i - 2, mem: &mem)
    // Сохранить dp[i]
    mem[i] = count
    return count
}

/* Подъем по лестнице: поиск с мемоизацией */
func climbingStairsDFSMem(n: Int) -> Int {
    // mem[i] хранит число способов подняться на i-ю ступень, -1 означает отсутствие записи
    var mem = Array(repeating: -1, count: n + 1)
    return dfs(i: n, mem: &mem)
}

@main
enum ClimbingStairsDFSMem {
    /* Driver Code */
    static func main() {
        let n = 9

        let res = climbingStairsDFSMem(n: n)
        print("Количество способов подняться по лестнице из \(n) ступеней = \(res)")
    }
}
