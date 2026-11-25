/**
 * File: array.swift
 * Created Time: 2023-01-05
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 隨機存取元素 */
func randomAccess(nums: [Int]) -> Int {
    // 從區間 [0, nums.count) 隨機選取一個數
    let randomIndex = nums.indices.randomElement()!
    // 取得並回傳隨機選出的元素
    let randomNum = nums[randomIndex]
    return randomNum
}

/* 增加陣列長度 */
func extend(nums: [Int], enlarge: Int) -> [Int] {
    // 初始化加長後的陣列
    var res = Array(repeating: 0, count: nums.count + enlarge)
    // 將原陣列的所有元素複製到新陣列
    for i in nums.indices {
        res[i] = nums[i]
    }
    // 回傳加長後的新陣列
    return res
}

/* 在陣列的索引 index 處插入元素 num */
func insert(nums: inout [Int], num: Int, index: Int) {
    // 將索引 index 起的所有元素往後移一格
    for i in stride(from: nums.count - 1, to: index, by: -1) {
        nums[i] = nums[i - 1]
    }
    // 將 num 指派給索引 index 處的元素
    nums[index] = num
}

/* 刪除索引 index 處的元素 */
func remove(nums: inout [Int], index: Int) {
    // 將索引 index 之後的所有元素往前移一格
    for i in nums.indices.dropFirst(index).dropLast() {
        nums[i] = nums[i + 1]
    }
}

/* 走訪陣列 */
func traverse(nums: [Int]) {
    var count = 0
    // 依索引走訪陣列
    for i in nums.indices {
        count += nums[i]
    }
    // 直接走訪陣列中的元素
    for num in nums {
        count += num
    }
    // 同時走訪資料的索引和元素
    for (i, num) in nums.enumerated() {
        count += nums[i]
        count += num
    }
}

/* 在陣列中尋找指定元素 */
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
    /* 範例主程式 */
    static func main() {
        /* 初始化陣列 */
        let arr = Array(repeating: 0, count: 5)
        print("陣列 arr = \(arr)")
        var nums = [1, 3, 2, 5, 4]
        print("陣列 nums = \(nums)")

        /* 隨機存取 */
        let randomNum = randomAccess(nums: nums)
        print("從 nums 隨機取得的元素為 \(randomNum)")

        /* 增加長度 */
        nums = extend(nums: nums, enlarge: 3)
        print("將陣列長度增加至 8，得到 nums = \(nums)")

        /* 插入元素 */
        insert(nums: &nums, num: 6, index: 3)
        print("在索引 3 處插入數字 6，得到 nums = \(nums)")

        /* 刪除元素 */
        remove(nums: &nums, index: 2)
        print("刪除索引 2 處的元素，得到 nums = \(nums)")

        /* 走訪陣列 */
        traverse(nums: nums)

        /* 尋找元素 */
        let index = find(nums: nums, target: 3)
        print("在 nums 中尋找元素 3，得到索引 = \(index)")
    }
}
