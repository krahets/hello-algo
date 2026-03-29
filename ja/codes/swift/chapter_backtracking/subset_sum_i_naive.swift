/**
 * File: subset_sum_i_naive.swift
 * Created Time: 2023-07-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* バックトラッキング：部分和 I */
func backtrack(state: inout [Int], target: Int, total: Int, choices: [Int], res: inout [[Int]]) {
    // 部分集合の和が target に等しければ、解を記録
    if total == target {
        res.append(state)
        return
    }
    // すべての選択肢を走査
    for i in choices.indices {
        // 枝刈り：部分和が target を超える場合はその選択をスキップする
        if total + choices[i] > target {
            continue
        }
        // 試行：選択を行い、要素と total を更新する
        state.append(choices[i])
        // 次の選択へ進む
        backtrack(state: &state, target: target, total: total + choices[i], choices: choices, res: &res)
        // バックトラック：選択を取り消し、前の状態に戻す
        state.removeLast()
    }
}

/* 部分和 I を解く（重複部分集合を含む） */
func subsetSumINaive(nums: [Int], target: Int) -> [[Int]] {
    var state: [Int] = [] // 状態（部分集合）
    let total = 0 // 部分和
    var res: [[Int]] = [] // 結果リスト（部分集合のリスト）
    backtrack(state: &state, target: target, total: total, choices: nums, res: &res)
    return res
}

@main
enum SubsetSumINaive {
    /* Driver Code */
    static func main() {
        let nums = [3, 4, 5]
        let target = 9

        let res = subsetSumINaive(nums: nums, target: target)

        print("入力配列 nums = \(nums), target = \(target)")
        print("和が \(target) に等しいすべての部分集合 res = \(res)")
        print("この方法の出力結果には重複した集合が含まれることに注意してください")
    }
}
