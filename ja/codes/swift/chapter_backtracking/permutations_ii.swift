/**
 * File: permutations_ii.swift
 * Created Time: 2023-04-30
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* バックトラッキングによる全順列 II */
func backtrack(state: inout [Int], choices: [Int], selected: inout [Bool], res: inout [[Int]]) {
    // 状態の長さが要素数に達したら解を記録する
    if state.count == choices.count {
        res.append(state)
        return
    }
    // すべての選択肢を調べる
    var duplicated: Set<Int> = []
    for (i, choice) in choices.enumerated() {
        // 枝刈り：同じ要素は二度選ばず、この段階で同じ値の要素も繰り返し試さない
        if !selected[i], !duplicated.contains(choice) {
            // 試行：選択して状態を更新する
            duplicated.insert(choice) // 選んだ要素の値を記録する
            selected[i] = true
            state.append(choice)
            // 次の選択に進む
            backtrack(state: &state, choices: choices, selected: &selected, res: &res)
            // 後戻り：選択を取り消し、元の状態に戻す
            selected[i] = false
            state.removeLast()
        }
    }
}

/* 全順列 II */
func permutationsII(nums: [Int]) -> [[Int]] {
    var state: [Int] = []
    var selected = Array(repeating: false, count: nums.count)
    var res: [[Int]] = []
    backtrack(state: &state, choices: nums, selected: &selected, res: &res)
    return res
}

@main
enum PermutationsII {
    /* 実行例 */
    static func main() {
        let nums = [1, 2, 3]

        let res = permutationsII(nums: nums)

        print("入力配列 nums = \(nums)")
        print("すべての順列 res = \(res)")
    }
}
