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

        /* Access element */
        let num = nums[1]
        print("Access the element at index 1, resulting in num = \(num)")

        /* Update element */
        nums[1] = 0
        print("Update the element at index 1 to 0, resulting in nums = \(nums)")

        /* Clear list */
        nums.removeAll()
        print("After clearing the list, nums = \(nums)")

        /* Add element at the end */
        nums.append(1)
        nums.append(3)
        nums.append(2)
        nums.append(5)
        nums.append(4)
        print("After adding elements, nums = \(nums)")

        /* Insert element in the middle */
        nums.insert(6, at: 3)
        print("Insert number 6 at index 3, resulting in nums = \(nums)")

        /* Remove element */
        nums.remove(at: 3)
        print("Remove the element at index 3, resulting in nums = \(nums)")

        /* Traverse the list by index */
        var count = 0
        for i in nums.indices {
            count += nums[i]
        }
        /* Traverse the list elements */
        count = 0
        for x in nums {
            count += x
        }

        /* Concatenate two lists */
        let nums1 = [6, 8, 7, 10, 9]
        nums.append(contentsOf: nums1)
        print("Concatenate list nums1 to nums, resulting in nums = \(nums)")

        /* Sort list */
        nums.sort()
        print("After sorting the list, nums = \(nums)")
    }
}
