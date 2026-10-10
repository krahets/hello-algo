/**
 * File: array.swift
 * Created Time: 2023-01-05
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 要素へランダムアクセス */
func randomAccess(nums: [Int]) -> Int {
    // 区間 [0, nums.count) からランダムに数字を 1 つ選ぶ
    let randomIndex = nums.indices.randomElement()!
    // ランダムな要素を取得して返す
    let randomNum = nums[randomIndex]
    return randomNum
}

/* 配列長を拡張する */
func extend(nums: [Int], enlarge: Int) -> [Int] {
    // 拡張後の長さを持つ配列を初期化する
    var res = Array(repeating: 0, count: nums.count + enlarge)
    // 元の配列の全要素を新しい配列にコピー
    for i in nums.indices {
        res[i] = nums[i]
    }
    // 拡張後の新しい配列を返す
    return res
}

/* 配列の index 番目に要素 num を挿入 */
func insert(nums: inout [Int], num: Int, index: Int) {
    // インデックス index 以降の全要素を 1 つ後ろへ移動する
    for i in nums.indices.dropFirst(index).reversed() {
        nums[i] = nums[i - 1]
    }
    // index の要素に num を代入する
    nums[index] = num
}

/* index の要素を削除する */
func remove(nums: inout [Int], index: Int) {
    // インデックス index より後ろの全要素を 1 つ前へ移動する
    for i in nums.indices.dropFirst(index).dropLast() {
        nums[i] = nums[i + 1]
    }
}

/* 配列を走査 */
func traverse(nums: [Int]) {
    var count = 0
    // インデックスで配列を走査
    for i in nums.indices {
        count += nums[i]
    }
    // 配列要素を直接走査
    for num in nums {
        count += num
    }
    // データのインデックスと要素を同時に走査する
    for (i, num) in nums.enumerated() {
        count += nums[i]
        count += num
    }
}

/* 配列内で指定要素を探す */
func find(nums: [Int], target: Int) -> Int {
    for i in nums.indices {
        if nums[i] == target {
            return i
        }
    }
    return -1
}

@main
enum _Array {
    /* Driver Code */
    static func main() {
        /* 配列を初期化 */
        let arr = Array(repeating: 0, count: 5)
        print("配列 arr = \(arr)")
        var nums = [1, 3, 2, 5, 4]
        print("配列 nums = \(nums)")

        /* ランダムアクセス */
        let randomNum = randomAccess(nums: nums)
        print("nums からランダムな要素を取得 \(randomNum)")

        /* 長さを拡張 */
        nums = extend(nums: nums, enlarge: 3)
        print("配列の長さを 8 に拡張すると、nums = \(nums)")

        /* 要素を挿入する */
        insert(nums: &nums, num: 6, index: 3)
        print("インデックス 3 に数値 6 を挿入すると、nums = \(nums)")

        /* 要素を削除 */
        remove(nums: &nums, index: 2)
        print("インデックス 2 の要素を削除すると、nums = \(nums)")

        /* 配列を走査 */
        traverse(nums: nums)

        /* 要素を探索する */
        let index = find(nums: nums, target: 3)
        print("nums 内で要素 3 を検索すると、インデックス = \(index)")
    }
}
