/**
 * File: array.swift
 * Created Time: 2023-01-05
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Access a random element */
func randomAccess(nums: [Int]) -> Int {
    // Pick a random index in [0, nums.count)
    let randomIndex = nums.indices.randomElement()!
    // Get and return the element at that index
    let randomNum = nums[randomIndex]
    return randomNum
}

/* Extend the array */
func extend(nums: [Int], enlarge: Int) -> [Int] {
    // Initialize an array with the new length
    var res = Array(repeating: 0, count: nums.count + enlarge)
    // Copy all elements from the original array into the new array
    for i in nums.indices {
        res[i] = nums[i]
    }
    // Return the new, longer array
    return res
}

/* Insert num at the specified array index */
func insert(nums: inout [Int], num: Int, index: Int) {
    // Shift the elements from index onward one position to the right
    for i in stride(from: nums.count - 1, to: index, by: -1) {
        nums[i] = nums[i - 1]
    }
    // Store num at the specified index
    nums[index] = num
}

/* Remove the element at the specified index */
func remove(nums: inout [Int], index: Int) {
    // Shift all elements after index one position to the left
    for i in nums.indices.dropFirst(index).dropLast() {
        nums[i] = nums[i + 1]
    }
}

/* Traverse the array */
func traverse(nums: [Int]) {
    var count = 0
    // Traverse the array by index
    for i in nums.indices {
        count += nums[i]
    }
    // Iterate directly over the array elements
    for num in nums {
        count += num
    }
    // Iterate over indices and elements together
    for (i, num) in nums.enumerated() {
        count += nums[i]
        count += num
    }
}

/* Find a given element in the array */
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
        /* Initialize the array */
        let arr = Array(repeating: 0, count: 5)
        print("Array arr = \(arr)")
        var nums = [1, 3, 2, 5, 4]
        print("Array nums = \(nums)")

        /* Random access */
        let randomNum = randomAccess(nums: nums)
        print("Random element from nums: \(randomNum)")

        /* Extend the array */
        nums = extend(nums: nums, enlarge: 3)
        print("After extending the array to length 8, nums = \(nums)")

        /* Insert an element */
        insert(nums: &nums, num: 6, index: 3)
        print("After inserting 6 at index 3, nums = \(nums)")

        /* Remove an element */
        remove(nums: &nums, index: 2)
        print("After removing the element at index 2, nums = \(nums)")

        /* Traverse the array */
        traverse(nums: nums)

        /* Find an element */
        let index = find(nums: nums, target: 3)
        print("Index of 3 in nums = \(index)")
    }
}
