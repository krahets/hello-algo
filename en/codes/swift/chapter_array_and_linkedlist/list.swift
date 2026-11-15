/**
 * File: list.swift
 * Created Time: 2023-01-08
 * Author: nuomi1 (nuomi1@qq.com)
 */

@main
enum List {
    /* Driver code */
    static func main() {
        /* Initialize the list */
        var nums = [1, 3, 2, 5, 4]
        print("List nums = \(nums)")

        // [region]{access_element}
        /* Access an element */
        let num = nums[1] // Access the element at index 1
        // [endregion]{access_element}
        print("Access the element at index 1; num = \(num)")

        // [region]{update_element}
        /* Update an element */
        nums[1] = 0 // Update the element at index 1 to 0
        // [endregion]{update_element}
        print("After updating the element at index 1 to 0, nums = \(nums)")

        // [region]{clear_list}
        /* Clear the list */
        nums.removeAll()
        // [endregion]{clear_list}
        print("After clearing the list, nums = \(nums)")

        // [region]{append_element}
        /* Append at the end */
        nums.append(1)
        nums.append(3)
        nums.append(2)
        nums.append(5)
        nums.append(4)
        // [endregion]{append_element}
        print("After appending elements, nums = \(nums)")

        // [region]{insert_element}
        /* Insert an element in the middle */
        nums.insert(6, at: 3) // Insert the number 6 at index 3
        // [endregion]{insert_element}
        print("After inserting 6 at index 3, nums = \(nums)")

        // [region]{remove_element}
        /* Remove an element */
        nums.remove(at: 3) // Remove the element at index 3
        // [endregion]{remove_element}
        print("After removing the element at index 3, nums = \(nums)")

        // [region]{iterate_list}
        /* Traverse the list by index */
        var count = 0
        for i in nums.indices {
            count += nums[i]
        }

        /* Iterate directly over the list elements */
        count = 0
        for x in nums {
            count += x
        }
        // [endregion]{iterate_list}

        // [region]{concat_list}
        /* Concatenate two lists */
        let nums1 = [6, 8, 7, 10, 9]
        nums.append(contentsOf: nums1) // Append list nums1 to nums
        // [endregion]{concat_list}
        print("After appending list nums1 to nums, nums = \(nums)")

        // [region]{sort_list}
        /* Sort the list */
        nums.sort() // After sorting, the list elements are in ascending order
        // [endregion]{sort_list}
        print("After sorting the list, nums = \(nums)")
    }
}
