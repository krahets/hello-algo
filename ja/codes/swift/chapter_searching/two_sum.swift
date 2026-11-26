/**
 * File: two_sum.swift
 * Created Time: 2023-01-03
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 方法 1：総当たり */
func twoSumBruteForce(nums: [Int], target: Int) -> [Int] {
    // 二重ループの時間計算量は O(n^2)
    for i in nums.indices.dropLast() {
        for j in nums.indices.dropFirst(i + 1) {
            if nums[i] + nums[j] == target {
                return [i, j]
            }
        }
    }
    return [0]
}

/* 方法 2：補助のハッシュテーブルを使う */
func twoSumHashTable(nums: [Int], target: Int) -> [Int] {
    // 補助のハッシュテーブルの空間計算量は O(n)
    var dic: [Int: Int] = [:]
    // 一重ループの時間計算量は O(n)
    for i in nums.indices {
        if let j = dic[target - nums[i]] {
            return [j, i]
        }
        dic[nums[i]] = i
    }
    return [0]
}

@main
enum LeetcodeTwoSum {
    /* 実行例 */
    static func main() {
        // ======= テストケース =======
        let nums = [2, 7, 11, 15]
        let target = 13
        // ====== 実行例 ======
        // 方法 1
        var res = twoSumBruteForce(nums: nums, target: target)
        print("方法 1 の res = \(res)")
        // 方法 2
        res = twoSumHashTable(nums: nums, target: target)
        print("方法 2 の res = \(res)")
    }
}
