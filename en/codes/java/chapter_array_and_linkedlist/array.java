/**
 * File: array.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_array_and_linkedlist;

import java.util.*;
import java.util.concurrent.ThreadLocalRandom;

public class array {
    /* Access a random element */
    static int randomAccess(int[] nums) {
        // Pick a random index in [0, nums.length)
        int randomIndex = ThreadLocalRandom.current().nextInt(0, nums.length);
        // Get and return the element at that index
        int randomNum = nums[randomIndex];
        return randomNum;
    }

    /* Extend the array */
    static int[] extend(int[] nums, int enlarge) {
        // Initialize an array with the new length
        int[] res = new int[nums.length + enlarge];
        // Copy all elements from the original array into the new array
        for (int i = 0; i < nums.length; i++) {
            res[i] = nums[i];
        }
        // Return the new, longer array
        return res;
    }

    /* Insert num at the specified array index */
    static void insert(int[] nums, int num, int index) {
        // Shift the elements from index onward one position to the right
        for (int i = nums.length - 1; i > index; i--) {
            nums[i] = nums[i - 1];
        }
        // Store num at the specified index
        nums[index] = num;
    }

    /* Remove the element at the specified index */
    static void remove(int[] nums, int index) {
        // Shift all elements after index one position to the left
        for (int i = index; i < nums.length - 1; i++) {
            nums[i] = nums[i + 1];
        }
    }

    /* Traverse the array */
    static void traverse(int[] nums) {
        int count = 0;
        // Traverse the array by index
        for (int i = 0; i < nums.length; i++) {
            count += nums[i];
        }
        // Iterate directly over the array elements
        for (int num : nums) {
            count += num;
        }
    }

    /* Find a given element in the array */
    static int find(int[] nums, int target) {
        for (int i = 0; i < nums.length; i++) {
            if (nums[i] == target)
                return i;
        }
        return -1;
    }

    /* Driver Code */
    public static void main(String[] args) {
        /* Initialize the array */
        int[] arr = new int[5];
        System.out.println("Array arr = " + Arrays.toString(arr));
        int[] nums = { 1, 3, 2, 5, 4 };
        System.out.println("Array nums = " + Arrays.toString(nums));

        /* Random access */
        int randomNum = randomAccess(nums);
        System.out.println("Random element from nums: " + randomNum);

        /* Extend the array */
        nums = extend(nums, 3);
        System.out.println("After extending the array to length 8, nums = " + Arrays.toString(nums));

        /* Insert an element */
        insert(nums, 6, 3);
        System.out.println("After inserting 6 at index 3, nums = " + Arrays.toString(nums));

        /* Remove an element */
        remove(nums, 2);
        System.out.println("After removing the element at index 2, nums = " + Arrays.toString(nums));

        /* Traverse the array */
        traverse(nums);

        /* Find an element */
        int index = find(nums, 3);
        System.out.println("Index of 3 in nums = " + index);
    }
}
