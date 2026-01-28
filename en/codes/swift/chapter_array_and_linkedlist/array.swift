/**
 * File: array.swift
 * Created Time: 2023-01-05
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Random access to element */
func randomAccess(nums: [Int]) -> Int {
    // Randomly select a number in interval [0, nums.count)
    let randomIndex = nums.indices.randomElement()!
    // Retrieve and return the random element
    let randomNum = nums[randomIndex]
    return randomNum
}

/* Extend array length */
func extend(nums: [Int], enlarge: Int) -> [Int] {
    // Initialize an array with extended length
    var res = Array(repeating: 0, count: nums.count + enlarge)
    // Copy all elements from the original array to the new array
    for i in nums.indices {
        res[i] = nums[i]
    }
    // Return the extended new array
    return res
}

/* Insert element num at index index in the array */
func insert(nums: inout [Int], num: Int, index: Int) {
    // Move all elements at and after index index backward by one position
    for i in nums.indices.dropFirst(index).reversed() {
        nums[i] = nums[i - 1]
    }
    // Assign num to the element at index index
    nums[index] = num
}

/* Remove the element at index index */
func remove(nums: inout [Int], index: Int) {
    // Move all elements after index index forward by one position
    for i in nums.indices.dropFirst(index).dropLast() {
        nums[i] = nums[i + 1]
    }
}

/* Traverse array */
func traverse(nums: [Int]) {
    var count = 0
    // Traverse array by index
    for i in nums.indices {
        count += nums[i]
    }
    // Direct traversal of array elements
    for num in nums {
        count += num
    }
    // Traverse simultaneously data index and elements
    for (i, num) in nums.enumerated() {
        count += nums[i]
        count += num
    }
}

/* Find the specified element in the array */
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
        /* Initialize array */
        let arr = Array(repeating: 0, count: 5)
        print("Array arr = \(arr)")
        var nums = [1, 3, 2, 5, 4]
        print("Array nums = \(nums)")

        /* Insert element */
        let randomNum = randomAccess(nums: nums)
        print("Get random element \(randomNum) from nums")

        /* Traverse array */
        nums = extend(nums: nums, enlarge: 3)
        print("Extend array length to 8, get nums = \(nums)")

        /* Insert element */
        insert(nums: &nums, num: 6, index: 3)
        print("Insert number 6 at index 3, get nums = \(nums)")

        /* Remove element */
        remove(nums: &nums, index: 2)
        print("Delete element at index 2, get nums = \(nums)")

        /* Traverse array */
        traverse(nums: nums)

        /* Find element */
        let index = find(nums: nums, target: 3)
        print("Find element 3 in nums, index = \(index)")
    }
}
