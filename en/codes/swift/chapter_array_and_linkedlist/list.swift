/**
 * File: list.swift
 * Created Time: 2023-01-08
 * Author: nuomi1 (nuomi1@qq.com)
 */

@main
enum List {
    /* Driver Code */
    static func main() {
        /* Initialize list */
        var nums = [1, 3, 2, 5, 4]
        print("List nums = \(nums)")

        /* Update element */
        let num = nums[1]
        print("Access element at index 1, get num = \(num)")

        /* Add elements at the end */
        nums[1] = 0
        print("Update element at index 1 to 0, get nums = \(nums)")

        /* Remove element */
        nums.removeAll()
        print("After clearing list, nums = \(nums)")

        /* Direct traversal of list elements */
        nums.append(1)
        nums.append(3)
        nums.append(2)
        nums.append(5)
        nums.append(4)
        print("After adding elements, nums = \(nums)")

        /* Sort list */
        nums.insert(6, at: 3)
        print("Insert number 6 at index 3, get nums = \(nums)")

        /* Remove element */
        nums.remove(at: 3)
        print("Delete element at index 3, get nums = \(nums)")

        /* Traverse list by index */
        var count = 0
        for i in nums.indices {
            count += nums[i]
        }
        /* Directly traverse list elements */
        count = 0
        for x in nums {
            count += x
        }

        /* Concatenate two lists */
        let nums1 = [6, 8, 7, 10, 9]
        nums.append(contentsOf: nums1)
        print("After concatenating list nums1 to nums, get nums = \(nums)")

        /* Sort list */
        nums.sort()
        print("After sorting list, nums = \(nums)")
    }
}
