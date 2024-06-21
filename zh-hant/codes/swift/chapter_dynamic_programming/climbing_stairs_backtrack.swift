/**
 * File: climbing_stairs_backtrack.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 回溯 */
func backtrack(choices: [Int], state: Int, n: Int, res: inout [Int]) {
    // 當爬到第 n 階時，方案數量加 1
    if state == n {
        res[0] += 1
    }
    // 走訪所有選擇
    for choice in choices {
        // 剪枝：不允許越過第 n 階
        if state + choice > n {
            continue
        }
        // 嘗試：做出選擇，更新狀態
        backtrack(choices: choices, state: state + choice, n: n, res: &res)
        // 回退
    }
}

/* 爬樓梯：回溯 */
func climbingStairsBacktrack(n: Int) -> Int {
    let choices = [1, 2] // 可選擇向上爬 1 階或 2 階
    let state = 0 // 從第 0 階開始爬
    var res: [Int] = []
    res.append(0) // 使用 res[0] 記錄方案數量
    backtrack(choices: choices, state: state, n: n, res: &res)
    return res[0]
}

@main
enum ClimbingStairsBacktrack {
    /* Driver Code */
    static func main() {
        let n = 9

        let res = climbingStairsBacktrack(n: n)
        print("爬 \(n) 階樓梯共有 \(res) 種方案")
    }
}
