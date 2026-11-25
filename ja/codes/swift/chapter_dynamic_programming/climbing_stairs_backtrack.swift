/**
 * File: climbing_stairs_backtrack.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* バックトラック */
func backtrack(choices: [Int], state: Int, n: Int, res: inout [Int]) {
    // n 段目に着いたら、登り方の数を 1 増やす
    if state == n {
        res[0] += 1
    }
    // すべての選択肢を調べる
    for choice in choices {
        // 枝刈り：n 段目を越えないようにする
        if state + choice > n {
            continue
        }
        // 選択肢を試し、状態を更新する
        backtrack(choices: choices, state: state + choice, n: n, res: &res)
        // 選択を取り消す
    }
}

/* 階段の登り方：バックトラック */
func climbingStairsBacktrack(n: Int) -> Int {
    let choices = [1, 2] // 1 段または 2 段登れる
    let state = 0 // 0 段目から登り始める
    var res: [Int] = []
    res.append(0) // res[0] に登り方の数を記録する
    backtrack(choices: choices, state: state, n: n, res: &res)
    return res[0]
}

@main
enum ClimbingStairsBacktrack {
    /* 実行例 */
    static func main() {
        let n = 9

        let res = climbingStairsBacktrack(n: n)
        print("全 \(n) 段の階段の登り方は \(res) 通り")
    }
}
