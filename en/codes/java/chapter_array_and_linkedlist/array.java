/**
 * File: array.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_array_and_linkedlist;

import java.util.*;
import java.util.concurrent.ThreadLocalRandom;

public class array {
    /* Random access to element */
    static int randomAccess(int[] nums) {
        // Randomly select a number in the interval [0, nums.length)
        int randomIndex = ThreadLocalRandom.current().nextInt(0, nums.length);
        // Retrieve and return the random element
        int randomNum = nums[randomIndex];
        return randomNum;
    }

    /* Extend array length */
    static int[] extend(int[] nums, int enlarge) {
        // Initialize an array with extended length
        int[] res = new int[nums.length + enlarge];
        // Copy all elements from the original array to the new array
        for (int i = 0; i < nums.length; i++) {
            res[i] = nums[i];
        }
        // Return the extended new array
        return res;
    }

    /* Insert element num at index index in the array */
    static void insert(int[] nums, int num, int index) {
        // Move all elements at and after index index backward by one position
        for (int i = nums.length - 1; i > index; i--) {
            nums[i] = nums[i - 1];
        }
        // Assign num to the element at index index
        nums[index] = num;
    }

    /* Remove the element at index index */
    static void remove(int[] nums, int index) {
        // Move all elements after index index forward by one position
        for (int i = index; i < nums.length - 1; i++) {
            nums[i] = nums[i + 1];
        }
    }

    /* Traverse array */
    static void traverse(int[] nums) {
        int count = 0;
        // Traverse array by index
        for (int i = 0; i < nums.length; i++) {
            count += nums[i];
        }
        // Direct traversal of array elements
        for (int num : nums) {
            count += num;
        }
    }

    /* Find the specified element in the array */
    static int find(int[] nums, int target) {
        for (int i = 0; i < nums.length; i++) {
            if (nums[i] == target)
                return i;
        }
        return -1;
    }

    /* Driver Code */
    public static void main(String[] args) {
        /* Initialize array */
        int[] arr = new int[5];
        System.out.println("Array arr = " + Arrays.toString(arr));
        int[] nums = { 1, 3, 2, 5, 4 };
        System.out.println("Array nums = " + Arrays.toString(nums));

        /* Insert element */
        int randomNum = randomAccess(nums);
        System.out.println("Get random element in nums " + randomNum);

        /* Traverse array */
        nums = extend(nums, 3);
        System.out.println("Extend array length to 8, resulting in nums = " + Arrays.toString(nums));

        /* Insert element */
        insert(nums, 6, 3);
        System.out.println("Insert number 6 at index 3, resulting in nums = " + Arrays.toString(nums));

        /* Remove element */
        remove(nums, 2);
        System.out.println("Remove element at index 2, resulting in nums = " + Arrays.toString(nums));

        /* Traverse array */
        traverse(nums);

        /* Find element */
        int index = find(nums, 3);
        System.out.println("Find element 3 in nums, get index = " + index);
    }
}
