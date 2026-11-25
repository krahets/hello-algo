/**
 * File: subset_sum_i_naive.swift
 * Created Time: 2023-07-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* バックトラッキングによる部分和問題 I */
func backtrack(state: inout [Int], target: Int, total: Int, choices: [Int], res: inout [[Int]]) {
    // 部分集合の要素の和が target に等しくなったら解を記録する
    if total == target {
        res.append(state)
        return
    }
    // すべての選択肢を調べる
    for i in choices.indices {
        // 枝刈り：部分集合の要素の和が target を超えるなら、その選択を飛ばす
        if total + choices[i] > target {
            continue
        }
        // 試行：選択して要素の和 total を更新する
        state.append(choices[i])
        // 次の選択に進む
        backtrack(state: &state, target: target, total: total + choices[i], choices: choices, res: &res)
        // 後戻り：選択を取り消し、元の状態に戻す
        state.removeLast()
    }
}

/* 部分和問題 I を解く（重複する部分集合を含む） */
func subsetSumINaive(nums: [Int], target: Int) -> [[Int]] {
    var state: [Int] = [] // 状態（部分集合）
    let total = 0 // 部分和
    var res: [[Int]] = [] // 結果のリスト（部分集合のリスト）
    backtrack(state: &state, target: target, total: total, choices: nums, res: &res)
    return res
}

@main
enum SubsetSumINaive {
    /* 実行例 */
    static func main() {
        let nums = [3, 4, 5]
        let target = 9

        let res = subsetSumINaive(nums: nums, target: target)

        print("入力配列 nums = \(nums), target = \(target)")
        print("要素の和が \(target) となるすべての部分集合 res = \(res)")
        print("この方法の出力には重複する集合が含まれる点に注意")
    }
}
