/**
 * File: climbing_stairs_backtrack.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* バックトラッキング */
func backtrack(choices: [Int], state: Int, n: Int, res: inout [Int]) {
    // n 段目に到達したら、方法の数を 1 増やす
    if state == n {
        res[0] += 1
    }
    // すべての選択肢を走査する
    for choice in choices {
        // 枝刈り：n 段目を越えてはならない
        if state + choice > n {
            continue
        }
        // 試行：選択を行い、状態を更新する
        backtrack(choices: choices, state: state + choice, n: n, res: &res)
        // 復元
    }
}

/* 階段の上り方：バックトラッキング */
func climbingStairsBacktrack(n: Int) -> Int {
    let choices = [1, 2] // 1 段または 2 段上ることを選択できる
    let state = 0 // 0 段目から上り始める
    var res: [Int] = []
    res.append(0) // res[0] に方法の数を記録する
    backtrack(choices: choices, state: state, n: n, res: &res)
    return res[0]
}

@main
enum ClimbingStairsBacktrack {
    /* 実行用コード */
    static func main() {
        let n = 9

        let res = climbingStairsBacktrack(n: n)
        print("\(n) 段の階段を上る方法は全部で \(res) 通り")
    }
}
