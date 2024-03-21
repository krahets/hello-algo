/**
 * File: edit_distance.swift
 * Created Time: 2023-07-16
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 编辑距离：暴力搜索 */
func editDistanceDFS(s: String, t: String, i: Int, j: Int) -> Int {
    // 若 s 和 t 都为空，则返回 0
    if i == 0, j == 0 {
        return 0
    }
    // 若 s 为空，则返回 t 长度
    if i == 0 {
        return j
    }
    // 若 t 为空，则返回 s 长度
    if j == 0 {
        return i
    }
    // 若两字符相等，则直接跳过此两字符
    if s.utf8CString[i - 1] == t.utf8CString[j - 1] {
        return editDistanceDFS(s: s, t: t, i: i - 1, j: j - 1)
    }
    // 最少编辑步数 = 插入、删除、替换这三种操作的最少编辑步数 + 1
    let insert = editDistanceDFS(s: s, t: t, i: i, j: j - 1)
    let delete = editDistanceDFS(s: s, t: t, i: i - 1, j: j)
    let replace = editDistanceDFS(s: s, t: t, i: i - 1, j: j - 1)
    // 返回最少编辑步数
    return min(min(insert, delete), replace) + 1
}

/* 编辑距离：记忆化搜索 */
func editDistanceDFSMem(s: String, t: String, mem: inout [[Int]], i: Int, j: Int) -> Int {
    // 若 s 和 t 都为空，则返回 0
    if i == 0, j == 0 {
        return 0
    }
    // 若 s 为空，则返回 t 长度
    if i == 0 {
        return j
    }
    // 若 t 为空，则返回 s 长度
    if j == 0 {
        return i
    }
    // 若已有记录，则直接返回之
    if mem[i][j] != -1 {
        return mem[i][j]
    }
    // 若两字符相等，则直接跳过此两字符
    if s.utf8CString[i - 1] == t.utf8CString[j - 1] {
        return editDistanceDFS(s: s, t: t, i: i - 1, j: j - 1)
    }
    // 最少编辑步数 = 插入、删除、替换这三种操作的最少编辑步数 + 1
    let insert = editDistanceDFS(s: s, t: t, i: i, j: j - 1)
    let delete = editDistanceDFS(s: s, t: t, i: i - 1, j: j)
    let replace = editDistanceDFS(s: s, t: t, i: i - 1, j: j - 1)
    // 记录并返回最少编辑步数
    mem[i][j] = min(min(insert, delete), replace) + 1
    return mem[i][j]
}

/* 编辑距离：动态规划 */
func editDistanceDP(s: String, t: String) -> Int {
    let n = s.utf8CString.count
    let m = t.utf8CString.count
    var dp = Array(repeating: Array(repeating: 0, count: m + 1), count: n + 1)
    // 状态转移：首行首列
    for i in 1 ... n {
        dp[i][0] = i
    }
    for j in 1 ... m {
        dp[0][j] = j
    }
    // 状态转移：其余行和列
    for i in 1 ... n {
        for j in 1 ... m {
            if s.utf8CString[i - 1] == t.utf8CString[j - 1] {
                // 若两字符相等，则直接跳过此两字符
                dp[i][j] = dp[i - 1][j - 1]
            } else {
                // 最少编辑步数 = 插入、删除、替换这三种操作的最少编辑步数 + 1
                dp[i][j] = min(min(dp[i][j - 1], dp[i - 1][j]), dp[i - 1][j - 1]) + 1
            }
        }
    }
    return dp[n][m]
}

/* 编辑距离：空间优化后的动态规划 */
func editDistanceDPComp(s: String, t: String) -> Int {
    let n = s.utf8CString.count
    let m = t.utf8CString.count
    var dp = Array(repeating: 0, count: m + 1)
    // 状态转移：首行
    for j in 1 ... m {
        dp[j] = j
    }
    // 状态转移：其余行
    for i in 1 ... n {
        // 状态转移：首列
        var leftup = dp[0] // 暂存 dp[i-1, j-1]
        dp[0] = i
        // 状态转移：其余列
        for j in 1 ... m {
            let temp = dp[j]
            if s.utf8CString[i - 1] == t.utf8CString[j - 1] {
                // 若两字符相等，则直接跳过此两字符
                dp[j] = leftup
            } else {
                // 最少编辑步数 = 插入、删除、替换这三种操作的最少编辑步数 + 1
                dp[j] = min(min(dp[j - 1], dp[j]), leftup) + 1
            }
            leftup = temp // 更新为下一轮的 dp[i-1, j-1]
        }
    }
    return dp[m]
}

@main
enum EditDistance {
    /* Driver Code */
    static func main() {
        let s = "bag"
        let t = "pack"
        let n = s.utf8CString.count
        let m = t.utf8CString.count

        // 暴力搜索
        var res = editDistanceDFS(s: s, t: t, i: n, j: m)
        print("将 \(s) 更改为 \(t) 最少需要编辑 \(res) 步")

        // 记忆化搜索
        var mem = Array(repeating: Array(repeating: -1, count: m + 1), count: n + 1)
        res = editDistanceDFSMem(s: s, t: t, mem: &mem, i: n, j: m)
        print("将 \(s) 更改为 \(t) 最少需要编辑 \(res) 步")

        // 动态规划
        res = editDistanceDP(s: s, t: t)
        print("将 \(s) 更改为 \(t) 最少需要编辑 \(res) 步")

        // 空间优化后的动态规划
        res = editDistanceDPComp(s: s, t: t)
        print("将 \(s) 更改为 \(t) 最少需要编辑 \(res) 步")
    }
}
