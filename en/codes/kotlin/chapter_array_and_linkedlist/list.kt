/**
 * File: list.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_array_and_linkedlist

/* Driver code */
fun main() {
    /* Initialize the list */
    // Mutable collection
    val nums = mutableListOf(1, 3, 2, 5, 4)
    println("List nums = $nums")

    /* Access an element */
    val num = nums[1]
    println("Accessing the element at index 1 gives num = $num")

    /* Update an element */
    nums[1] = 0
    println("After updating the element at index 1 to 0, nums = $nums")

    /* Clear the list */
    nums.clear()
    println("After clearing the list, nums = $nums")

    /* Append at the end */
    nums.add(1)
    nums.add(3)
    nums.add(2)
    nums.add(5)
    nums.add(4)
    println("After adding elements, nums = $nums")

    /* Insert an element in the middle */
    nums.add(3, 6)
    println("After inserting 6 at index 3, nums = $nums")

    /* Remove an element */
    nums.removeAt(3)
    println("After removing the element at index 3, nums = $nums")

    /* Traverse the list by index */
    var count = 0
    for (i in nums.indices) {
        count += nums[i]
    }

    /* Iterate directly over the list elements */
    for (j in nums) {
        count += j
    }

    /* Concatenate two lists*/
    val nums1 = mutableListOf(6, 8, 7, 10, 9)
    nums.addAll(nums1)
    println("After appending list nums1 to nums, nums = $nums")

    /* Sort the list */
    nums.sort()
    println("After sorting the list, nums = $nums")
}