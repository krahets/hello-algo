/**
 * File: array.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_array_and_linkedlist

import java.util.concurrent.ThreadLocalRandom

/* Random access to element */
fun randomAccess(nums: IntArray): Int {
    // Randomly select a number in interval [0, nums.size)
    val randomIndex = ThreadLocalRandom.current().nextInt(0, nums.size)
    // Retrieve and return the random element
    val randomNum = nums[randomIndex]
    return randomNum
}

/* Extend array length */
fun extend(nums: IntArray, enlarge: Int): IntArray {
    // Initialize an array with extended length
    val res = IntArray(nums.size + enlarge)
    // Copy all elements from the original array to the new array
    for (i in nums.indices) {
        res[i] = nums[i]
    }
    // Return the extended new array
    return res
}

/* Insert element num at index index in the array */
fun insert(nums: IntArray, num: Int, index: Int) {
    // Move all elements at and after index index backward by one position
    for (i in nums.size - 1 downTo index + 1) {
        nums[i] = nums[i - 1]
    }
    // Assign num to the element at index index
    nums[index] = num
}

/* Remove the element at index index */
fun remove(nums: IntArray, index: Int) {
    // Move all elements after index index forward by one position
    for (i in index..<nums.size - 1) {
        nums[i] = nums[i + 1]
    }
}

/* Traverse array */
fun traverse(nums: IntArray) {
    var count = 0
    // Traverse array by index
    for (i in nums.indices) {
        count += nums[i]
    }
    // Direct traversal of array elements
    for (j in nums) {
        count += j
    }
}

/* Find the specified element in the array */
fun find(nums: IntArray, target: Int): Int {
    for (i in nums.indices) {
        if (nums[i] == target)
            return i
    }
    return -1
}

/* Driver Code */
fun main() {
    /* Initialize array */
    val arr = IntArray(5)
    println("Array arr = ${arr.contentToString()}")
    var nums = intArrayOf(1, 3, 2, 5, 4)
    println("Array nums = ${nums.contentToString()}")

    /* Insert element */
    val randomNum: Int = randomAccess(nums)
    println("Get random element $randomNum from nums")

    /* Traverse array */
    nums = extend(nums, 3)
    println("Extend array length to 8, get nums = ${nums.contentToString()}")

    /* Insert element */
    insert(nums, 6, 3)
    println("Insert number 6 at index 3, get nums = ${nums.contentToString()}")

    /* Remove element */
    remove(nums, 2)
    println("Delete element at index 2, get nums = ${nums.contentToString()}")

    /* Traverse array */
    traverse(nums)

    /* Find element */
    val index: Int = find(nums, 3)
    println("Find element 3 in nums, index = $index")
}