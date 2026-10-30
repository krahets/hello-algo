/**
 * File: array.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_array_and_linkedlist

import java.util.concurrent.ThreadLocalRandom

/* Access an element at a random index */
fun randomAccess(nums: IntArray): Int {
    // Randomly select a number in [0, nums.size)
    val randomIndex = ThreadLocalRandom.current().nextInt(0, nums.size)
    // Get and return the randomly selected element
    val randomNum = nums[randomIndex]
    return randomNum
}

/* Extend the array length */
fun extend(nums: IntArray, enlarge: Int): IntArray {
    // Initialize an array with the extended length
    val res = IntArray(nums.size + enlarge)
    // Copy all elements from the original array to the new array
    for (i in nums.indices) {
        res[i] = nums[i]
    }
    // Return the new, extended array
    return res
}

/* Insert element num at index `index` in the array */
fun insert(nums: IntArray, num: Int, index: Int) {
    // Shift all elements at and after index `index` one position to the right
    for (i in nums.size - 1 downTo index + 1) {
        nums[i] = nums[i - 1]
    }
    // Assign num to the element at index `index`
    nums[index] = num
}

/* Remove the element at index `index` */
fun remove(nums: IntArray, index: Int) {
    // Shift all elements after index `index` one position to the left
    for (i in index..<nums.size - 1) {
        nums[i] = nums[i + 1]
    }
}

/* Traverse the array */
fun traverse(nums: IntArray) {
    var count = 0
    // Traverse the array by index
    for (i in nums.indices) {
        count += nums[i]
    }
    // Iterate directly over the array elements
    for (j in nums) {
        count += j
    }
}

/* Find a specified element in the array */
fun find(nums: IntArray, target: Int): Int {
    for (i in nums.indices) {
        if (nums[i] == target)
            return i
    }
    return -1
}

/* Driver code */
fun main() {
    /* Initialize the array */
    val arr = IntArray(5)
    println("Array arr = ${arr.contentToString()}")
    var nums = intArrayOf(1, 3, 2, 5, 4)
    println("Array nums = ${nums.contentToString()}")

    /* Random access */
    val randomNum: Int = randomAccess(nums)
    println("Random element selected from nums: $randomNum")

    /* Extend the length */
    nums = extend(nums, 3)
    println("After extending the array length to 8, nums = ${nums.contentToString()}")

    /* Insert an element */
    insert(nums, 6, 3)
    println("After inserting 6 at index 3, nums = ${nums.contentToString()}")

    /* Remove an element */
    remove(nums, 2)
    println("After removing the element at index 2, nums = ${nums.contentToString()}")

    /* Traverse the array */
    traverse(nums)

    /* Find an element */
    val index: Int = find(nums, 3)
    println("Searching nums for element 3 gives index = $index")
}