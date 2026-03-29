/**
 * File: subset_sum_ii.swift
 * Created Time: 2023-07-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* バックトラッキング：部分和 II */
func backtrack(state: inout [Int], target: Int, choices: [Int], start: Int, res: inout [[Int]]) {
    // 部分集合の和が target に等しければ、解を記録
    if target == 0 {
        res.append(state)
        return
    }
    // すべての選択肢を走査
    // 枝刈り 2: start から走査し、重複する部分集合の生成を避ける
    // 枝刈り 3: start から走査し、同じ要素の重複選択を避ける
    for i in choices.indices.dropFirst(start) {
        // 枝刈り1：部分集合の和が target を超えたら、直ちにループを終了する
        // 配列はソート済みで後続要素のほうが大きく、部分集合の和は必ず target を超えるため
        if target - choices[i] < 0 {
            break
        }
        // 枝刈り4：この要素が左隣の要素と等しければ、その探索分岐は重複しているためスキップする
        if i > start, choices[i] == choices[i - 1] {
            continue
        }
        // 試す：選択を行い、target と start を更新
        state.append(choices[i])
        // 次の選択へ進む
        backtrack(state: &state, target: target - choices[i], choices: choices, start: i + 1, res: &res)
        // バックトラック：選択を取り消し、前の状態に戻す
        state.removeLast()
    }
}

/* 部分和 II を解く */
func subsetSumII(nums: [Int], target: Int) -> [[Int]] {
    var state: [Int] = [] // 状態（部分集合）
    let nums = nums.sorted() // nums をソート
    let start = 0 // 開始点を走査
    var res: [[Int]] = [] // 結果リスト（部分集合のリスト）
    backtrack(state: &state, target: target, choices: nums, start: start, res: &res)
    return res
}

@main
enum SubsetSumII {
    /* Driver Code */
    static func main() {
        let nums = [4, 4, 5]
        let target = 9

        let res = subsetSumII(nums: nums, target: target)

        print("入力配列 nums = \(nums), target = \(target)")
        print("和が \(target) に等しいすべての部分集合 res = \(res)")
    }
}
