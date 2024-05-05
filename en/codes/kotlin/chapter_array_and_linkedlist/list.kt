/**
 * File: list.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_array_and_linkedlist

/* Driver Code */
fun main() {
    /* Initialize list */
    // Mutable set
    val nums = mutableListOf(1, 3, 2, 5, 4)
    println("List nums = $nums")

    /* Access element */
    val num = nums[1]
    println("Access the element at index 1, resulting in num = $num")

    /* Update element */
    nums[1] = 0
    println("Update the element at index 1 to 0, resulting in nums = $nums")

    /* Clear list */
    nums.clear()
    println("After clearing the list, nums = $nums")

    /* Add element at the end */
    nums.add(1)
    nums.add(3)
    nums.add(2)
    nums.add(5)
    nums.add(4)
    println("After adding elements, nums = $nums")

    /* Insert element in the middle */
    nums.add(3, 6)
    println("Insert number 6 at index 3, resulting in nums = $nums")

    /* Remove element */
    nums.removeAt(3)
    println("Remove the element at index 3, resulting in nums = $nums")

    /* Traverse the list by index */
    var count = 0
    for (i in nums.indices) {
        count += nums[i]
    }

    /* Traverse the list elements */
    for (j in nums) {
        count += j
    }

    /* Concatenate two lists*/
    val nums1 = mutableListOf(6, 8, 7, 10, 9)
    nums.addAll(nums1)
    println("Concatenate list nums1 with nums, resulting in nums = $nums")

    /* Sort list */
    nums.sort()
    println("After sorting the list, nums = $nums")
}