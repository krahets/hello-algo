/**
 * File: bucket_sort.swift
 * Created Time: 2023-03-27
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* バケットソート */
func bucketSort(nums: inout [Double]) {
    // k = n/2 個のバケットを初期化。各バケットには平均 2 要素が入る想定
    let k = nums.count / 2
    var buckets = (0 ..< k).map { _ in [Double]() }
    // 1. 配列の要素を各バケットに振り分ける
    for num in nums {
        // 入力範囲は [0, 1)。num * k でインデックスの範囲 [0, k-1] に写す
        let i = Int(num * Double(k))
        // num をバケット i に追加
        buckets[i].append(num)
    }
    // 2. 各バケットをソートする
    for i in buckets.indices {
        // 組み込みのソート関数を使用。他のソートアルゴリズムでもよい
        buckets[i].sort()
    }
    // 3. バケットを順に連結
    var i = nums.startIndex
    for bucket in buckets {
        for num in bucket {
            nums[i] = num
            i += 1
        }
    }
}

@main
enum BucketSort {
    /* 実行例 */
    static func main() {
        // 入力は [0, 1) の範囲の浮動小数点数とする
        var nums = [0.49, 0.96, 0.82, 0.09, 0.57, 0.43, 0.91, 0.75, 0.15, 0.37]
        bucketSort(nums: &nums)
        print("バケットソート後の nums = \(nums)")
    }
}
