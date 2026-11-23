/**
 * File: subset_sum_i.swift
 * Created Time: 2023-07-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* バックトラッキング：部分集合和 I */
func backtrack(state: inout [Int], target: Int, choices: [Int], start: Int, res: inout [[Int]]) {
    // 部分集合の和が target と等しくなったら、解を記録する
    if target == 0 {
        res.append(state)
        return
    }
    // すべての選択肢を走査する
    // 枝刈り 2：start から走査を始め、重複した部分集合の生成を避ける
    for i in choices.indices.dropFirst(start) {
        // 枝刈り 1：部分集合の和が target を超えたら、直ちにループを終了する
        // 配列はソート済みで後ろの要素ほど大きいため、部分集合の和が必ず target を超えるからである
        if target - choices[i] < 0 {
            break
        }
        // 試行：選択を行い、target, start を更新する
        state.append(choices[i])
        // 次の選択に進む
        backtrack(state: &state, target: target - choices[i], choices: choices, start: i, res: &res)
        // 復元：選択を取り消し、以前の状態に戻す
        state.removeLast()
    }
}

/* 部分集合和 I を解く */
func subsetSumI(nums: [Int], target: Int) -> [[Int]] {
    var state: [Int] = [] // 状態（部分集合）
    let nums = nums.sorted() // nums をソートする
    let start = 0 // 走査の開始位置
    var res: [[Int]] = [] // 結果リスト（部分集合のリスト）
    backtrack(state: &state, target: target, choices: nums, start: start, res: &res)
    return res
}

@main
enum SubsetSumI {
    /* 実行用コード */
    static func main() {
        let nums = [3, 4, 5]
        let target = 9

        let res = subsetSumI(nums: nums, target: target)

        print("入力配列 nums = \(nums), target = \(target)")
        print("和が \(target) になるすべての部分集合 res = \(res)")
    }
}
