/**
 * File: worst_best_time_complexity.swift
 * Created Time: 2022-12-26
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Generate an array with elements {1, 2, ..., n} in a randomly shuffled order */
func randomNumbers(n: Int) -> [Int] {
    // Generate array nums = { 1, 2, 3, ..., n }
    var nums = Array(1 ... n)
    // Randomly shuffle array elements
    nums.shuffle()
    return nums
}

/* Find the index of number 1 in array nums */
func findOne(nums: [Int]) -> Int {
    for i in nums.indices {
        // When element 1 is at the start of the array, achieve best time complexity O(1)
        // When element 1 is at the end of the array, achieve worst time complexity O(n)
        if nums[i] == 1 {
            return i
        }
    }
    return -1
}

@main
enum WorstBestTimeComplexity {
    /* Driver Code */
    static func main() {
        for _ in 0 ..< 10 {
            let n = 100
            let nums = randomNumbers(n: n)
            let index = findOne(nums: nums)
            print("Array [ 1, 2, ..., n ] after shuffling = \(nums)")
            print("Index of number 1 = \(index)")
        }
    }
}
