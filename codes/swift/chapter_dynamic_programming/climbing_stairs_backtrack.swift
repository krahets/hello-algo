/**
 * File: climbing_stairs_backtrack.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 回溯 */
func backtrack(choices: [Int], state: Int, n: Int, res: inout [Int]) {
    // 当爬到第 n 阶时，方案数量加 1
    if state == n {
        res[0] += 1
    }
    // 遍历所有选择
    for choice in choices {
        // 剪枝：不允许越过第 n 阶
        if state + choice > n {
            continue
        }
        // 尝试：做出选择，更新状态
        backtrack(choices: choices, state: state + choice, n: n, res: &res)
        // 回退
    }
}

/* 爬楼梯：回溯 */
func climbingStairsBacktrack(n: Int) -> Int {
    let choices = [1, 2] // 可选择向上爬 1 阶或 2 阶
    let state = 0 // 从第 0 阶开始爬
    var res: [Int] = []
    res.append(0) // 使用 res[0] 记录方案数量
    backtrack(choices: choices, state: state, n: n, res: &res)
    return res[0]
}

@main
enum ClimbingStairsBacktrack {
    /* Driver Code */
    static func main() {
        let n = 9

        let res = climbingStairsBacktrack(n: n)
        print("爬 \(n) 阶楼梯共有 \(res) 种方案")
    }
}
