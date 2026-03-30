/**
 * File: edit_distance.swift
 * Created Time: 2023-07-16
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 編集距離：総当たり探索 */
func editDistanceDFS(s: String, t: String, i: Int, j: Int) -> Int {
    // s と t がともに空なら 0 を返す
    if i == 0, j == 0 {
        return 0
    }
    // s が空なら t の長さを返す
    if i == 0 {
        return j
    }
    // t が空なら s の長さを返す
    if j == 0 {
        return i
    }
    // 2 つの文字が等しければ、その 2 文字をそのままスキップする
    if s.utf8CString[i - 1] == t.utf8CString[j - 1] {
        return editDistanceDFS(s: s, t: t, i: i - 1, j: j - 1)
    }
    // 最小編集回数 = 挿入・削除・置換の 3 操作における最小編集回数 + 1
    let insert = editDistanceDFS(s: s, t: t, i: i, j: j - 1)
    let delete = editDistanceDFS(s: s, t: t, i: i - 1, j: j)
    let replace = editDistanceDFS(s: s, t: t, i: i - 1, j: j - 1)
    // 最小編集回数を返す
    return min(min(insert, delete), replace) + 1
}

/* 編集距離：メモ化探索 */
func editDistanceDFSMem(s: String, t: String, mem: inout [[Int]], i: Int, j: Int) -> Int {
    // s と t がともに空なら 0 を返す
    if i == 0, j == 0 {
        return 0
    }
    // s が空なら t の長さを返す
    if i == 0 {
        return j
    }
    // t が空なら s の長さを返す
    if j == 0 {
        return i
    }
    // 記録済みなら、それをそのまま返す
    if mem[i][j] != -1 {
        return mem[i][j]
    }
    // 2 つの文字が等しければ、その 2 文字をそのままスキップする
    if s.utf8CString[i - 1] == t.utf8CString[j - 1] {
        return editDistanceDFS(s: s, t: t, i: i - 1, j: j - 1)
    }
    // 最小編集回数 = 挿入・削除・置換の 3 操作における最小編集回数 + 1
    let insert = editDistanceDFS(s: s, t: t, i: i, j: j - 1)
    let delete = editDistanceDFS(s: s, t: t, i: i - 1, j: j)
    let replace = editDistanceDFS(s: s, t: t, i: i - 1, j: j - 1)
    // 最小編集回数を記録して返す
    mem[i][j] = min(min(insert, delete), replace) + 1
    return mem[i][j]
}

/* 編集距離：動的計画法 */
func editDistanceDP(s: String, t: String) -> Int {
    let n = s.utf8CString.count
    let m = t.utf8CString.count
    var dp = Array(repeating: Array(repeating: 0, count: m + 1), count: n + 1)
    // 状態遷移：先頭行と先頭列
    for i in 1 ... n {
        dp[i][0] = i
    }
    for j in 1 ... m {
        dp[0][j] = j
    }
    // 状態遷移: 残りの行と列
    for i in 1 ... n {
        for j in 1 ... m {
            if s.utf8CString[i - 1] == t.utf8CString[j - 1] {
                // 2 つの文字が等しければ、その 2 文字をそのままスキップする
                dp[i][j] = dp[i - 1][j - 1]
            } else {
                // 最小編集回数 = 挿入・削除・置換の 3 操作における最小編集回数 + 1
                dp[i][j] = min(min(dp[i][j - 1], dp[i - 1][j]), dp[i - 1][j - 1]) + 1
            }
        }
    }
    return dp[n][m]
}

/* 編集距離：空間最適化した動的計画法 */
func editDistanceDPComp(s: String, t: String) -> Int {
    let n = s.utf8CString.count
    let m = t.utf8CString.count
    var dp = Array(repeating: 0, count: m + 1)
    // 状態遷移：先頭行
    for j in 1 ... m {
        dp[j] = j
    }
    // 状態遷移：残りの行
    for i in 1 ... n {
        // 状態遷移：先頭列
        var leftup = dp[0] // dp[i-1, j-1] を一時保存する
        dp[0] = i
        // 状態遷移：残りの列
        for j in 1 ... m {
            let temp = dp[j]
            if s.utf8CString[i - 1] == t.utf8CString[j - 1] {
                // 2 つの文字が等しければ、その 2 文字をそのままスキップする
                dp[j] = leftup
            } else {
                // 最小編集回数 = 挿入・削除・置換の 3 操作における最小編集回数 + 1
                dp[j] = min(min(dp[j - 1], dp[j]), leftup) + 1
            }
            leftup = temp // 次の反復の dp[i-1, j-1] に更新する
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

        // 全探索
        var res = editDistanceDFS(s: s, t: t, i: n, j: m)
        print("\(s) を \(t) に変更するには最小で \(res) 回の編集が必要")

        // メモ化探索
        var mem = Array(repeating: Array(repeating: -1, count: m + 1), count: n + 1)
        res = editDistanceDFSMem(s: s, t: t, mem: &mem, i: n, j: m)
        print("\(s) を \(t) に変更するには最小で \(res) 回の編集が必要")

        // 動的計画法
        res = editDistanceDP(s: s, t: t)
        print("\(s) を \(t) に変更するには最小で \(res) 回の編集が必要")

        // 空間最適化後の動的計画法
        res = editDistanceDPComp(s: s, t: t)
        print("\(s) を \(t) に変更するには最小で \(res) 回の編集が必要")
    }
}
