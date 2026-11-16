/**
 * File: list.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_array_and_linkedlist

/* Driver code */
fun main() {
    // [region]{init_list}
    /* Initialize the list */
    // Without initial values
    val emptyNums = mutableListOf<Int>()
    // With initial values
    val nums = mutableListOf(1, 3, 2, 5, 4)
    // [endregion]{init_list}
    println("List nums = $nums")
    println("List emptyNums = $emptyNums")

    // [region]{access_element}
    /* Access an element */
    val num = nums[1] // Access the element at index 1
    // [endregion]{access_element}
    println("Accessing the element at index 1 gives num = $num")

    // [region]{update_element}
    /* Update an element */
    nums[1] = 0 // Update the element at index 1 to 0
    // [endregion]{update_element}
    println("After updating the element at index 1 to 0, nums = $nums")

    // [region]{clear_list}
    /* Clear the list */
    nums.clear()
    // [endregion]{clear_list}
    println("After clearing the list, nums = $nums")

    // [region]{append_element}
    /* Append at the end */
    nums.add(1)
    nums.add(3)
    nums.add(2)
    nums.add(5)
    nums.add(4)
    // [endregion]{append_element}
    println("After adding elements, nums = $nums")

    // [region]{insert_element}
    /* Insert an element in the middle */
    nums.add(3, 6) // Insert the number 6 at index 3
    // [endregion]{insert_element}
    println("After inserting 6 at index 3, nums = $nums")

    // [region]{remove_element}
    /* Remove an element */
    nums.removeAt(3) // Remove the element at index 3
    // [endregion]{remove_element}
    println("After removing the element at index 3, nums = $nums")

    // [region]{iterate_list}
    /* Traverse the list by index */
    var count = 0
    for (i in nums.indices) {
        count += nums[i]
    }

    /* Iterate directly over the list elements */
    for (j in nums) {
        count += j
    }
    // [endregion]{iterate_list}

    // [region]{concat_list}
    /* Concatenate two lists */
    val nums1 = mutableListOf(6, 8, 7, 10, 9)
    nums.addAll(nums1) // Append list nums1 to nums
    // [endregion]{concat_list}
    println("After appending list nums1 to nums, nums = $nums")

    // [region]{sort_list}
    /* Sort the list */
    nums.sort() // After sorting, the list elements are in ascending order
    // [endregion]{sort_list}
    println("After sorting the list, nums = $nums")
}