/**
 * File: counting_sort.swift
 * Created Time: 2023-03-22
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* カウントソート */
// 簡易版。オブジェクトのソートには使えない
func countingSortNaive(nums: inout [Int]) {
    // 1. 配列の最大値 m を求める
    let m = nums.max()!
    // 2. 各数値の出現回数を数える
    // counter[num] は num の出現回数を表す
    var counter = Array(repeating: 0, count: m + 1)
    for num in nums {
        counter[num] += 1
    }
    // 3. counter を走査し、各要素を元の配列 nums に書き込む
    var i = 0
    for num in 0 ..< m + 1 {
        for _ in 0 ..< counter[num] {
            nums[i] = num
            i += 1
        }
    }
}

/* カウントソート */
// 完全版。オブジェクトもソートでき、安定性を保つ
func countingSort(nums: inout [Int]) {
    // 1. 配列の最大値 m を求める
    let m = nums.max()!
    // 2. 各数値の出現回数を数える
    // counter[num] は num の出現回数を表す
    var counter = Array(repeating: 0, count: m + 1)
    for num in nums {
        counter[num] += 1
    }
    // 3. counter の累積和を求め、出現回数から各値の末尾位置を求められるようにする
    // つまり counter[num]-1 は res 内で num が最後に現れるインデックス
    for i in 0 ..< m {
        counter[i + 1] += counter[i]
    }
    // 4. nums を逆順に走査し、各要素を結果配列 res に書き込む
    // 結果を格納する配列 res を初期化
    var res = Array(repeating: 0, count: nums.count)
    for i in nums.indices.reversed() {
        let num = nums[i]
        res[counter[num] - 1] = num // num を対応するインデックスに配置
        counter[num] -= 1 // 累積和を 1 減らして、次に num を置く位置を求める
    }
    // 結果配列 res で元の配列 nums を上書き
    for i in nums.indices {
        nums[i] = res[i]
    }
}

@main
enum CountingSort {
    /* 実行例 */
    static func main() {
        var nums = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4]
        countingSortNaive(nums: &nums)
        print("カウントソート（オブジェクトは対象外）後の nums = \(nums)")

        var nums1 = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4]
        countingSort(nums: &nums1)
        print("カウントソート後の nums1 = \(nums1)")
    }
}
