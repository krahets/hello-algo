/**
 * File: radix_sort.swift
 * Created Time: 2023-01-29
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 要素 num の下から k 桁目を取得（exp = 10^(k-1)） */
func digit(num: Int, exp: Int) -> Int {
    // ここで高コストな累乗計算を繰り返さないよう、k ではなく exp を渡す
    (num / exp) % 10
}

/* 計数ソート（nums の k 桁目でソート） */
func countingSortDigit(nums: inout [Int], exp: Int) {
    // 10 進数の各桁は 0~9 の範囲なので、長さ 10 のバケット配列が必要
    var counter = Array(repeating: 0, count: 10)
    // 0~9 の各数字の出現回数を集計する
    for i in nums.indices {
        let d = digit(num: nums[i], exp: exp) // nums[i] の第 k 位を取得し、d とする
        counter[d] += 1 // 数字 d の出現回数を数える
    }
    // 累積和を求め、「出現回数」を「配列インデックス」に変換する
    for i in 1 ..< 10 {
        counter[i] += counter[i - 1]
    }
    // 逆順に走査し、バケット内の集計結果に従って各要素を res に格納する
    var res = Array(repeating: 0, count: nums.count)
    for i in nums.indices.reversed() {
        let d = digit(num: nums[i], exp: exp)
        let j = counter[d] - 1 // d の配列内インデックス j を取得する
        res[j] = nums[i] // 現在の要素をインデックス j に格納する
        counter[d] -= 1 // d の個数を 1 減らす
    }
    // 結果で元の配列 nums を上書きする
    for i in nums.indices {
        nums[i] = res[i]
    }
}

/* 基数ソート */
func radixSort(nums: inout [Int]) {
    // 最大桁数の判定用に配列の最大要素を取得
    var m = Int.min
    for num in nums {
        if num > m {
            m = num
        }
    }
    // 下位桁から上位桁の順に走査する
    for exp in sequence(first: 1, next: { m >= ($0 * 10) ? $0 * 10 : nil }) {
        // 配列要素の k 桁目に対して計数ソートを行う
        // k = 1 -> exp = 1
        // k = 2 -> exp = 10
        // つまり exp = 10^(k-1)
        countingSortDigit(nums: &nums, exp: exp)
    }
}

@main
enum RadixSort {
    /* Driver Code */
    static func main() {
        // 基数ソート
        var nums = [
            10_546_151,
            35_663_510,
            42_865_989,
            34_862_445,
            81_883_077,
            88_906_420,
            72_429_244,
            30_524_779,
            82_060_337,
            63_832_996,
        ]
        radixSort(nums: &nums)
        print("基数ソート完了後 nums = \(nums)")
    }
}
