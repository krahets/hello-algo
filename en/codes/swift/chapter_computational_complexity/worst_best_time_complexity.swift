/**
 * File: worst_best_time_complexity.swift
 * Created Time: 2022-12-26
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Generate an array containing { 1, 2, ..., n } in shuffled order */
func randomNumbers(n: Int) -> [Int] {
    // Generate the array nums = { 1, 2, 3, ..., n }
    var nums = Array(1 ... n)
    // Randomly shuffle the array elements
    nums.shuffle()
    return nums
}

/* Find the index of the number 1 in array nums */
func findOne(nums: [Int]) -> Int {
    for i in nums.indices {
        // When 1 is at the start of the array, the best-case time complexity is O(1)
        // When 1 is at the end of the array, the worst-case time complexity is O(n)
        if nums[i] == 1 {
            return i
        }
    }
    return -1
}

@main
enum WorstBestTimeComplexity {
    /* Driver code */
    static func main() {
        for _ in 0 ..< 10 {
            let n = 100
            let nums = randomNumbers(n: n)
            let index = findOne(nums: nums)
            print("Array [1, 2, ..., n] after shuffling = \(nums)")
            print("The index of 1 is \(index)")
        }
    }
}
