/**
 * File: array.swift
 * Created Time: 2023-01-05
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Random access to elements */
func randomAccess(nums: [Int]) -> Int {
    // Randomly draw a number from the interval [0, nums.count)
    let randomIndex = nums.indices.randomElement()!
    // Retrieve and return a random element
    let randomNum = nums[randomIndex]
    return randomNum
}

/* Extend array length */
func extend(nums: [Int], enlarge: Int) -> [Int] {
    // Initialize an extended length array
    var res = Array(repeating: 0, count: nums.count + enlarge)
    // Copy all elements from the original array to the new array
    for i in nums.indices {
        res[i] = nums[i]
    }
    // Return the new array after expansion
    return res
}

/* Insert element num at `index` */
func insert(nums: inout [Int], num: Int, index: Int) {
    // Move all elements after `index` one position backward
    for i in nums.indices.dropFirst(index).reversed() {
        nums[i] = nums[i - 1]
    }
    // Assign num to the element at index
    nums[index] = num
}

/* Remove the element at `index` */
func remove(nums: inout [Int], index: Int) {
    // Move all elements after `index` one position forward
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
    // Traverse array elements
    for num in nums {
        count += num
    }
    // Traverse both data index and elements
    for (i, num) in nums.enumerated() {
        count += nums[i]
        count += num
    }
}

/* Search for a specified element in the array */
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
        /* Initialize an array */
        let arr = Array(repeating: 0, count: 5)
        print("Array arr = \(arr)")
        var nums = [1, 3, 2, 5, 4]
        print("Array nums = \(nums)")

        /* Random access */
        let randomNum = randomAccess(nums: nums)
        print("Retrieve a random element in nums \(randomNum)")

        /* Length extension */
        nums = extend(nums: nums, enlarge: 3)
        print("Extend the array length to 8, resulting in nums = \(nums)")

        /* Insert element */
        insert(nums: &nums, num: 6, index: 3)
        print("Insert number 6 at index 3, resulting in nums = \(nums)")

        /* Remove element */
        remove(nums: &nums, index: 2)
        print("Remove the element at index 2, resulting in nums = \(nums)")

        /* Traverse array */
        traverse(nums: nums)

        /* Search for elements */
        let index = find(nums: nums, target: 3)
        print("Search for element 3 in nums, resulting in index = \(index)")
    }
}
