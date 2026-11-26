/**
 * File: worst_best_time_complexity.swift
 * Created Time: 2022-12-26
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Generate a shuffled array containing { 1, 2, ..., n } */
func randomNumbers(n: Int) -> [Int] {
    // Generate the array nums = { 1, 2, 3, ..., n }
    var nums = Array(1 ... n)
    // Shuffle the array elements at random
    nums.shuffle()
    return nums
}

/* Find the index of 1 in the array nums */
func findOne(nums: [Int]) -> Int {
    for i in nums.indices {
        // Best case: 1 is the first element, so the search takes O(1) time
        // Worst case: 1 is the last element, so the search takes O(n) time
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
            print("Shuffled array [ 1, 2, ..., n ] = \(nums)")
            print("Index of 1 = \(index)")
        }
    }
}
