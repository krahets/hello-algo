/**
 * File: array.swift
 * Created Time: 2023-01-05
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 隨機訪問元素 */
func randomAccess(nums: [Int]) -> Int {
    // 在區間 [0, nums.count) 中隨機抽取一個數字
    let randomIndex = nums.indices.randomElement()!
    // 獲取並返回隨機元素
    let randomNum = nums[randomIndex]
    return randomNum
}

/* 擴展陣列長度 */
func extend(nums: [Int], enlarge: Int) -> [Int] {
    // 初始化一個擴展長度後的陣列
    var res = Array(repeating: 0, count: nums.count + enlarge)
    // 將原陣列中的所有元素複製到新陣列
    for i in nums.indices {
        res[i] = nums[i]
    }
    // 返回擴展後的新陣列
    return res
}

/* 在陣列的索引 index 處插入元素 num */
func insert(nums: inout [Int], num: Int, index: Int) {
    // 把索引 index 以及之後的所有元素向後移動一位
    for i in nums.indices.dropFirst(index).reversed() {
        nums[i] = nums[i - 1]
    }
    // 將 num 賦給 index 處的元素
    nums[index] = num
}

/* 刪除索引 index 處的元素 */
func remove(nums: inout [Int], index: Int) {
    // 把索引 index 之後的所有元素向前移動一位
    for i in nums.indices.dropFirst(index).dropLast() {
        nums[i] = nums[i + 1]
    }
}

/* 走訪陣列 */
func traverse(nums: [Int]) {
    var count = 0
    // 透過索引走訪陣列
    for i in nums.indices {
        count += nums[i]
    }
    // 直接走訪陣列元素
    for num in nums {
        count += num
    }
    // 同時走訪資料索引和元素
    for (i, num) in nums.enumerated() {
        count += nums[i]
        count += num
    }
}

/* 在陣列中查詢指定元素 */
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
        /* 初始化陣列 */
        let arr = Array(repeating: 0, count: 5)
        print("陣列 arr = \(arr)")
        var nums = [1, 3, 2, 5, 4]
        print("陣列 nums = \(nums)")

        /* 隨機訪問 */
        let randomNum = randomAccess(nums: nums)
        print("在 nums 中獲取隨機元素 \(randomNum)")

        /* 長度擴展 */
        nums = extend(nums: nums, enlarge: 3)
        print("將陣列長度擴展至 8 ，得到 nums = \(nums)")

        /* 插入元素 */
        insert(nums: &nums, num: 6, index: 3)
        print("在索引 3 處插入數字 6 ，得到 nums = \(nums)")

        /* 刪除元素 */
        remove(nums: &nums, index: 2)
        print("刪除索引 2 處的元素，得到 nums = \(nums)")

        /* 走訪陣列 */
        traverse(nums: nums)

        /* 查詢元素 */
        let index = find(nums: nums, target: 3)
        print("在 nums 中查詢元素 3 ，得到索引 = \(index)")
    }
}
