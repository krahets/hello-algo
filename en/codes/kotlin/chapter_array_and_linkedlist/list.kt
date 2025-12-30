/**
 * File: list.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_array_and_linkedlist

/* Driver Code */
fun main() {
    /* Initialize list */
    // Mutable collection
    val nums = mutableListOf(1, 3, 2, 5, 4)
    println("List nums = $nums")

    /* Update element */
    val num = nums[1]
    println("Access element at index 1, get num = $num")

    /* Add elements at the end */
    nums[1] = 0
    println("Update element at index 1 to 0, get nums = $nums")

    /* Remove element */
    nums.clear()
    println("After clearing list, nums = $nums")

    /* Direct traversal of list elements */
    nums.add(1)
    nums.add(3)
    nums.add(2)
    nums.add(5)
    nums.add(4)
    println("After adding elements, nums = $nums")

    /* Sort list */
    nums.add(3, 6)
    println("Insert number 6 at index 3, get nums = $nums")

    /* Remove element */
    nums.removeAt(3)
    println("Delete element at index 3, get nums = $nums")

    /* Traverse list by index */
    var count = 0
    for (i in nums.indices) {
        count += nums[i]
    }

    /* Directly traverse list elements */
    for (j in nums) {
        count += j
    }

    /* Concatenate two lists */
    val nums1 = mutableListOf(6, 8, 7, 10, 9)
    nums.addAll(nums1)
    println("After concatenating list nums1 to nums, get nums = $nums")

    /* Sort list */
    nums.sort()
    println("After sorting list, nums = $nums")
}