/**
 * File: knapsack.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 0-1 ナップサック：総当たり探索 */
func knapsackDFS(wgt: [Int], val: [Int], i: Int, c: Int) -> Int {
    // すべての品物を選び終えたか、ナップサックに残り容量がなければ、価値 0 を返す
    if i == 0 || c == 0 {
        return 0
    }
    // ナップサック容量を超える場合は、入れない選択しかできない
    if wgt[i - 1] > c {
        return knapsackDFS(wgt: wgt, val: val, i: i - 1, c: c)
    }
    // 品物 i を入れない場合と入れる場合の最大価値を計算する
    let no = knapsackDFS(wgt: wgt, val: val, i: i - 1, c: c)
    let yes = knapsackDFS(wgt: wgt, val: val, i: i - 1, c: c - wgt[i - 1]) + val[i - 1]
    // 2つの案のうち価値が大きいほうを返す
    return max(no, yes)
}

/* 0-1 ナップサック：メモ化探索 */
func knapsackDFSMem(wgt: [Int], val: [Int], mem: inout [[Int]], i: Int, c: Int) -> Int {
    // すべての品物を選び終えたか、ナップサックに残り容量がなければ、価値 0 を返す
    if i == 0 || c == 0 {
        return 0
    }
    // 既に記録があればそのまま返す
    if mem[i][c] != -1 {
        return mem[i][c]
    }
    // ナップサック容量を超える場合は、入れない選択しかできない
    if wgt[i - 1] > c {
        return knapsackDFSMem(wgt: wgt, val: val, mem: &mem, i: i - 1, c: c)
    }
    // 品物 i を入れない場合と入れる場合の最大価値を計算する
    let no = knapsackDFSMem(wgt: wgt, val: val, mem: &mem, i: i - 1, c: c)
    let yes = knapsackDFSMem(wgt: wgt, val: val, mem: &mem, i: i - 1, c: c - wgt[i - 1]) + val[i - 1]
    // 2 つの案のうち価値が大きい方を記録して返す
    mem[i][c] = max(no, yes)
    return mem[i][c]
}

/* 0-1 ナップサック：動的計画法 */
func knapsackDP(wgt: [Int], val: [Int], cap: Int) -> Int {
    let n = wgt.count
    // dp テーブルを初期化
    var dp = Array(repeating: Array(repeating: 0, count: cap + 1), count: n + 1)
    // 状態遷移
    for i in 1 ... n {
        for c in 1 ... cap {
            if wgt[i - 1] > c {
                // ナップサック容量を超えるなら品物 i は選ばない
                dp[i][c] = dp[i - 1][c]
            } else {
                // 品物 i を選ばない場合と選ぶ場合の大きい方
                dp[i][c] = max(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1])
            }
        }
    }
    return dp[n][cap]
}

/* 0-1 ナップサック：空間最適化後の動的計画法 */
func knapsackDPComp(wgt: [Int], val: [Int], cap: Int) -> Int {
    let n = wgt.count
    // dp テーブルを初期化
    var dp = Array(repeating: 0, count: cap + 1)
    // 状態遷移
    for i in 1 ... n {
        // 逆順に走査する
        for c in (1 ... cap).reversed() {
            if wgt[i - 1] <= c {
                // 品物 i を選ばない場合と選ぶ場合の大きい方
                dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1])
            }
        }
    }
    return dp[cap]
}

@main
enum Knapsack {
    /* Driver Code */
    static func main() {
        let wgt = [10, 20, 30, 40, 50]
        let val = [50, 120, 150, 210, 240]
        let cap = 50
        let n = wgt.count

        // 全探索
        var res = knapsackDFS(wgt: wgt, val: val, i: n, c: cap)
        print("ナップサック容量を超えない最大価値は \(res)")

        // メモ化探索
        var mem = Array(repeating: Array(repeating: -1, count: cap + 1), count: n + 1)
        res = knapsackDFSMem(wgt: wgt, val: val, mem: &mem, i: n, c: cap)
        print("ナップサック容量を超えない最大価値は \(res)")

        // 動的計画法
        res = knapsackDP(wgt: wgt, val: val, cap: cap)
        print("ナップサック容量を超えない最大価値は \(res)")

        // 空間最適化後の動的計画法
        res = knapsackDPComp(wgt: wgt, val: val, cap: cap)
        print("ナップサック容量を超えない最大価値は \(res)")
    }
}
