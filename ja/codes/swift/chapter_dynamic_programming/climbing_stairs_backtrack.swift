/**
 * File: climbing_stairs_backtrack.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* バックトラッキング */
func backtrack(choices: [Int], state: Int, n: Int, res: inout [Int]) {
    // 第 n 段に到達したら、方法数を 1 増やす
    if state == n {
        res[0] += 1
    }
    // すべての選択肢を走査
    for choice in choices {
        // 枝刈り: 第 n 段を超えないようにする
        if state + choice > n {
            continue
        }
        // 試行: 選択を行い、状態を更新
        backtrack(choices: choices, state: state + choice, n: n, res: &res)
        // バックトラック
    }
}

/* 階段登り：バックトラッキング */
func climbingStairsBacktrack(n: Int) -> Int {
    let choices = [1, 2] // 1 段または 2 段上ることを選べる
    let state = 0 // 第 0 段から上り始める
    var res: [Int] = []
    res.append(0) // res[0] を使って方法数を記録する
    backtrack(choices: choices, state: state, n: n, res: &res)
    return res[0]
}

@main
enum ClimbingStairsBacktrack {
    /* Driver Code */
    static func main() {
        let n = 9

        let res = climbingStairsBacktrack(n: n)
        print("\(n) 段の階段を上る方法は全部で \(res) 通り")
    }
}
