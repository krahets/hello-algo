/**
 * File: array.swift
 * Created Time: 2023-01-05
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Access an element at a random index */
func randomAccess(nums: [Int]) -> Int {
    // Pick a random number in the interval [0, nums.count)
    let randomIndex = nums.indices.randomElement()!
    // Get and return the randomly selected element
    let randomNum = nums[randomIndex]
    return randomNum
}

/* Extend the array length */
func extend(nums: [Int], enlarge: Int) -> [Int] {
    // Initialize an array with the extended length
    var res = Array(repeating: 0, count: nums.count + enlarge)
    // Copy all elements from the original array to the new array
    for i in nums.indices {
        res[i] = nums[i]
    }
    // Return the new, extended array
    return res
}

/* Insert element num at index `index` in the array */
func insert(nums: inout [Int], num: Int, index: Int) {
    // Shift all elements at and after index `index` one position to the right
    for i in stride(from: nums.count - 1, to: index, by: -1) {
        nums[i] = nums[i - 1]
    }
    // Assign num to the element at index `index`
    nums[index] = num
}

/* Remove the element at index `index` */
func remove(nums: inout [Int], index: Int) {
    // Shift all elements after index `index` one position to the left
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
    // Iterate over both the indices and the elements
    for (i, num) in nums.enumerated() {
        count += nums[i]
        count += num
    }
}

/* Find a specified element in the array */
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
    /* Driver code */
    static func main() {
        /* Initialize the array */
        let arr = Array(repeating: 0, count: 5)
        print("Array arr = \(arr)")
        var nums = [1, 3, 2, 5, 4]
        print("Array nums = \(nums)")

        /* Random access */
        let randomNum = randomAccess(nums: nums)
        print("Randomly selected element from nums: \(randomNum)")

        /* Extend the length */
        nums = extend(nums: nums, enlarge: 3)
        print("After extending the array length to 8, nums = \(nums)")

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
        print("Find element 3 in nums; index = \(index)")
    }
}
