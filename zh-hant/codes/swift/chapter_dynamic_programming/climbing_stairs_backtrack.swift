/**
 * File: climbing_stairs_backtrack.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 回溯 */
func backtrack(choices: [Int], state: Int, n: Int, res: inout [Int]) {
    // 爬到第 n 階時，將走法數加 1
    if state == n {
        res[0] += 1
    }
    // 走訪所有選項
    for choice in choices {
        // 剪枝：不能越過第 n 階
        if state + choice > n {
            continue
        }
        // 嘗試：做出選擇，更新狀態
        backtrack(choices: choices, state: state + choice, n: n, res: &res)
        // 撤銷選擇
    }
}

/* 爬樓梯：回溯法 */
func climbingStairsBacktrack(n: Int) -> Int {
    let choices = [1, 2] // 每次可以往上爬 1 階或 2 階
    let state = 0 // 從第 0 階開始爬
    var res: [Int] = []
    res.append(0) // 用 res[0] 記錄走法數
    backtrack(choices: choices, state: state, n: n, res: &res)
    return res[0]
}

@main
enum ClimbingStairsBacktrack {
    /* 主程式 */
    static func main() {
        let n = 9

        let res = climbingStairsBacktrack(n: n)
        print("爬 \(n) 階樓梯共有 \(res) 種走法")
    }
}
