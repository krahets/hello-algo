/**
 * File: edit_distance.swift
 * Created Time: 2023-07-16
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 編輯距離：暴力搜尋 */
func editDistanceDFS(s: String, t: String, i: Int, j: Int) -> Int {
    // 若 s 和 t 都為空，則返回 0
    if i == 0, j == 0 {
        return 0
    }
    // 若 s 為空，則返回 t 長度
    if i == 0 {
        return j
    }
    // 若 t 為空，則返回 s 長度
    if j == 0 {
        return i
    }
    // 若兩字元相等，則直接跳過此兩字元
    if s.utf8CString[i - 1] == t.utf8CString[j - 1] {
        return editDistanceDFS(s: s, t: t, i: i - 1, j: j - 1)
    }
    // 最少編輯步數 = 插入、刪除、替換這三種操作的最少編輯步數 + 1
    let insert = editDistanceDFS(s: s, t: t, i: i, j: j - 1)
    let delete = editDistanceDFS(s: s, t: t, i: i - 1, j: j)
    let replace = editDistanceDFS(s: s, t: t, i: i - 1, j: j - 1)
    // 返回最少編輯步數
    return min(min(insert, delete), replace) + 1
}

/* 編輯距離：記憶化搜尋 */
func editDistanceDFSMem(s: String, t: String, mem: inout [[Int]], i: Int, j: Int) -> Int {
    // 若 s 和 t 都為空，則返回 0
    if i == 0, j == 0 {
        return 0
    }
    // 若 s 為空，則返回 t 長度
    if i == 0 {
        return j
    }
    // 若 t 為空，則返回 s 長度
    if j == 0 {
        return i
    }
    // 若已有記錄，則直接返回之
    if mem[i][j] != -1 {
        return mem[i][j]
    }
    // 若兩字元相等，則直接跳過此兩字元
    if s.utf8CString[i - 1] == t.utf8CString[j - 1] {
        return editDistanceDFS(s: s, t: t, i: i - 1, j: j - 1)
    }
    // 最少編輯步數 = 插入、刪除、替換這三種操作的最少編輯步數 + 1
    let insert = editDistanceDFS(s: s, t: t, i: i, j: j - 1)
    let delete = editDistanceDFS(s: s, t: t, i: i - 1, j: j)
    let replace = editDistanceDFS(s: s, t: t, i: i - 1, j: j - 1)
    // 記錄並返回最少編輯步數
    mem[i][j] = min(min(insert, delete), replace) + 1
    return mem[i][j]
}

/* 編輯距離：動態規劃 */
func editDistanceDP(s: String, t: String) -> Int {
    let n = s.utf8CString.count
    let m = t.utf8CString.count
    var dp = Array(repeating: Array(repeating: 0, count: m + 1), count: n + 1)
    // 狀態轉移：首行首列
    for i in 1 ... n {
        dp[i][0] = i
    }
    for j in 1 ... m {
        dp[0][j] = j
    }
    // 狀態轉移：其餘行和列
    for i in 1 ... n {
        for j in 1 ... m {
            if s.utf8CString[i - 1] == t.utf8CString[j - 1] {
                // 若兩字元相等，則直接跳過此兩字元
                dp[i][j] = dp[i - 1][j - 1]
            } else {
                // 最少編輯步數 = 插入、刪除、替換這三種操作的最少編輯步數 + 1
                dp[i][j] = min(min(dp[i][j - 1], dp[i - 1][j]), dp[i - 1][j - 1]) + 1
            }
        }
    }
    return dp[n][m]
}

/* 編輯距離：空間最佳化後的動態規劃 */
func editDistanceDPComp(s: String, t: String) -> Int {
    let n = s.utf8CString.count
    let m = t.utf8CString.count
    var dp = Array(repeating: 0, count: m + 1)
    // 狀態轉移：首行
    for j in 1 ... m {
        dp[j] = j
    }
    // 狀態轉移：其餘行
    for i in 1 ... n {
        // 狀態轉移：首列
        var leftup = dp[0] // 暫存 dp[i-1, j-1]
        dp[0] = i
        // 狀態轉移：其餘列
        for j in 1 ... m {
            let temp = dp[j]
            if s.utf8CString[i - 1] == t.utf8CString[j - 1] {
                // 若兩字元相等，則直接跳過此兩字元
                dp[j] = leftup
            } else {
                // 最少編輯步數 = 插入、刪除、替換這三種操作的最少編輯步數 + 1
                dp[j] = min(min(dp[j - 1], dp[j]), leftup) + 1
            }
            leftup = temp // 更新為下一輪的 dp[i-1, j-1]
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

        // 暴力搜尋
        var res = editDistanceDFS(s: s, t: t, i: n, j: m)
        print("將 \(s) 更改為 \(t) 最少需要編輯 \(res) 步")

        // 記憶化搜尋
        var mem = Array(repeating: Array(repeating: -1, count: m + 1), count: n + 1)
        res = editDistanceDFSMem(s: s, t: t, mem: &mem, i: n, j: m)
        print("將 \(s) 更改為 \(t) 最少需要編輯 \(res) 步")

        // 動態規劃
        res = editDistanceDP(s: s, t: t)
        print("將 \(s) 更改為 \(t) 最少需要編輯 \(res) 步")

        // 空間最佳化後的動態規劃
        res = editDistanceDPComp(s: s, t: t)
        print("將 \(s) 更改為 \(t) 最少需要編輯 \(res) 步")
    }
}
