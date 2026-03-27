/**
 * File: two_sum.swift
 * Created Time: 2023-01-03
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Метод 1: полный перебор */
func twoSumBruteForce(nums: [Int], target: Int) -> [Int] {
    // Два вложенных цикла, временная сложность O(n^2)
    for i in nums.indices.dropLast() {
        for j in nums.indices.dropFirst(i + 1) {
            if nums[i] + nums[j] == target {
                return [i, j]
            }
        }
    }
    return [0]
}

/* Метод 2: вспомогательная хеш-таблица */
func twoSumHashTable(nums: [Int], target: Int) -> [Int] {
    // Вспомогательная хеш-таблица, пространственная сложность O(n)
    var dic: [Int: Int] = [:]
    // Один цикл, временная сложность O(n)
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
    /* Driver Code */
    static func main() {
        // ======= Test Case =======
        let nums = [2, 7, 11, 15]
        let target = 13
        // ====== Основной код ======
        // Метод 1
        var res = twoSumBruteForce(nums: nums, target: target)
        print("Результат метода 1 res = \(res)")
        // Метод 2
        res = twoSumHashTable(nums: nums, target: target)
        print("Результат метода 2 res = \(res)")
    }
}
