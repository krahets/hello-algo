/**
 * File: array.swift
 * Created Time: 2023-01-05
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 要素にランダムにアクセスする */
func randomAccess(nums: [Int]) -> Int {
    // 区間 [0, nums.count) から数をランダムに選ぶ
    let randomIndex = nums.indices.randomElement()!
    // ランダムに選んだ要素を取得して返す
    let randomNum = nums[randomIndex]
    return randomNum
}

/* 配列の長さを増やす */
func extend(nums: [Int], enlarge: Int) -> [Int] {
    // 長さを増やした配列を初期化する
    var res = Array(repeating: 0, count: nums.count + enlarge)
    // 元の配列の全要素を新しい配列にコピーする
    for i in nums.indices {
        res[i] = nums[i]
    }
    // 長さを増やした新しい配列を返す
    return res
}

/* 配列のインデックス index に要素 num を挿入する */
func insert(nums: inout [Int], num: Int, index: Int) {
    // インデックス index 以降の全要素を後ろに 1 つずらす
    for i in stride(from: nums.count - 1, to: index, by: -1) {
        nums[i] = nums[i - 1]
    }
    // インデックス index の要素に num を代入する
    nums[index] = num
}

/* インデックス index の要素を削除する */
func remove(nums: inout [Int], index: Int) {
    // インデックス index より後ろの全要素を前に 1 つずらす
    for i in nums.indices.dropFirst(index).dropLast() {
        nums[i] = nums[i + 1]
    }
}

/* 配列を走査する */
func traverse(nums: [Int]) {
    var count = 0
    // インデックスを使って配列を走査する
    for i in nums.indices {
        count += nums[i]
    }
    // 配列の要素を直接走査する
    for num in nums {
        count += num
    }
    // インデックスと要素を同時にたどる
    for (i, num) in nums.enumerated() {
        count += nums[i]
        count += num
    }
}

/* 配列から指定した要素を探す */
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
    /* ドライバコード */
    static func main() {
        /* 配列を初期化する */
        let arr = Array(repeating: 0, count: 5)
        print("配列 arr = \(arr)")
        var nums = [1, 3, 2, 5, 4]
        print("配列 nums = \(nums)")

        /* ランダムアクセス */
        let randomNum = randomAccess(nums: nums)
        print("nums からランダムに選んだ要素：\(randomNum)")

        /* 配列の長さを増やす */
        nums = extend(nums: nums, enlarge: 3)
        print("配列の長さを 8 に増やした後の nums = \(nums)")

        /* 要素を挿入する */
        insert(nums: &nums, num: 6, index: 3)
        print("インデックス 3 に 6 を挿入した後の nums = \(nums)")

        /* 要素を削除する */
        remove(nums: &nums, index: 2)
        print("インデックス 2 の要素を削除した後の nums = \(nums)")

        /* 配列を走査する */
        traverse(nums: nums)

        /* 要素を探す */
        let index = find(nums: nums, target: 3)
        print("nums で要素 3 が見つかったインデックス = \(index)")
    }
}
