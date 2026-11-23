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

        /* Access an element */
        let num = nums[1]
        print("Access the element at index 1; num = \(num)")

        /* Update an element */
        nums[1] = 0
        print("After updating the element at index 1 to 0, nums = \(nums)")

        /* Clear the list */
        nums.removeAll()
        print("After clearing the list, nums = \(nums)")

        /* Append at the end */
        nums.append(1)
        nums.append(3)
        nums.append(2)
        nums.append(5)
        nums.append(4)
        print("After appending elements, nums = \(nums)")

        /* Insert an element in the middle */
        nums.insert(6, at: 3)
        print("After inserting 6 at index 3, nums = \(nums)")

        /* Remove an element */
        nums.remove(at: 3)
        print("After removing the element at index 3, nums = \(nums)")

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

        /* Concatenate two lists */
        let nums1 = [6, 8, 7, 10, 9]
        nums.append(contentsOf: nums1)
        print("After appending list nums1 to nums, nums = \(nums)")

        /* Sort the list */
        nums.sort()
        print("After sorting the list, nums = \(nums)")
    }
}
