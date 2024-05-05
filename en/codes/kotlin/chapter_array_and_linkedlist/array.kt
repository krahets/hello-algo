/**
 * File: array.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_array_and_linkedlist

import java.util.concurrent.ThreadLocalRandom

/* Random access to elements */
fun randomAccess(nums: IntArray): Int {
    // Randomly select a number from the interval [0, nums.size)
    val randomIndex = ThreadLocalRandom.current().nextInt(0, nums.size)
    // Retrieve and return a random element
    val randomNum = nums[randomIndex]
    return randomNum
}

/* Extend array length */
fun extend(nums: IntArray, enlarge: Int): IntArray {
    // Initialize an extended length array
    val res = IntArray(nums.size + enlarge)
    // Copy all elements from the original array to the new array
    for (i in nums.indices) {
        res[i] = nums[i]
    }
    // Return the new array after expansion
    return res
}

/* Insert element num at `index` */
fun insert(nums: IntArray, num: Int, index: Int) {
    // Move all elements after `index` one position backward
    for (i in nums.size - 1 downTo index + 1) {
        nums[i] = nums[i - 1]
    }
    // Assign num to the element at index
    nums[index] = num
}

/* Remove the element at `index` */
fun remove(nums: IntArray, index: Int) {
    // Move all elements after `index` one position forward
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
    // Traverse array elements
    for (j in nums) {
        count += j
    }
}

/* Search for a specified element in the array */
fun find(nums: IntArray, target: Int): Int {
    for (i in nums.indices) {
        if (nums[i] == target)
            return i
    }
    return -1
}

/* Driver Code */
fun main() {
    /* Initialize an array */
    val arr = IntArray(5)
    println("Array arr = ${arr.contentToString()}")
    var nums = intArrayOf(1, 3, 2, 5, 4)
    println("Array nums = ${nums.contentToString()}")

    /* Random access */
    val randomNum: Int = randomAccess(nums)
    println("Get a random element from nums as $randomNum")

    /* Length extension */
    nums = extend(nums, 3)
    println("Extend the length of the array to 8, resulting in nums = ${nums.contentToString()}")

    /* Insert element */
    insert(nums, 6, 3)
    println("Insert the number 6 at index 3, resulting in nums = ${nums.contentToString()}")

    /* Remove element */
    remove(nums, 2)
    println("Remove the element at index 2, resulting in nums = ${nums.contentToString()}")

    /* Traverse array */
    traverse(nums)

    /* Search for elements */
    val index: Int = find(nums, 3)
    println("Find element 3 in nums, index = $index")
}