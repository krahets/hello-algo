/**
 * File: array.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_array_and_linkedlist;

import java.util.*;
import java.util.concurrent.ThreadLocalRandom;

public class array {
    /* Random access to elements */
    static int randomAccess(int[] nums) {
        // Randomly select a number in the interval [0, nums.length)
        int randomIndex = ThreadLocalRandom.current().nextInt(0, nums.length);
        // Retrieve and return a random element
        int randomNum = nums[randomIndex];
        return randomNum;
    }

    /* Extend array length */
    static int[] extend(int[] nums, int enlarge) {
        // Initialize an extended length array
        int[] res = new int[nums.length + enlarge];
        // Copy all elements from the original array to the new array
        for (int i = 0; i < nums.length; i++) {
            res[i] = nums[i];
        }
        // Return the new array after expansion
        return res;
    }

    /* Insert element num at `index` */
    static void insert(int[] nums, int num, int index) {
        // Move all elements after `index` one position backward
        for (int i = nums.length - 1; i > index; i--) {
            nums[i] = nums[i - 1];
        }
        // Assign num to the element at index
        nums[index] = num;
    }

    /* Remove the element at `index` */
    static void remove(int[] nums, int index) {
        // Move all elements after `index` one position forward
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
        // Traverse array elements
        for (int num : nums) {
            count += num;
        }
    }

    /* Search for a specified element in the array */
    static int find(int[] nums, int target) {
        for (int i = 0; i < nums.length; i++) {
            if (nums[i] == target)
                return i;
        }
        return -1;
    }

    /* Driver Code */
    public static void main(String[] args) {
        /* Initialize an array */
        int[] arr = new int[5];
        System.out.println("Array arr = " + Arrays.toString(arr));
        int[] nums = { 1, 3, 2, 5, 4 };
        System.out.println("Array nums = " + Arrays.toString(nums));

        /* Random access */
        int randomNum = randomAccess(nums);
        System.out.println("Get a random element from nums = " + randomNum);

        /* Length extension */
        nums = extend(nums, 3);
        System.out.println("Extend the array length to 8, resulting in nums = " + Arrays.toString(nums));

        /* Insert element */
        insert(nums, 6, 3);
        System.out.println("Insert the number 6 at index 3, resulting in nums = " + Arrays.toString(nums));

        /* Remove element */
        remove(nums, 2);
        System.out.println("Remove the element at index 2, resulting in nums = " + Arrays.toString(nums));

        /* Traverse array */
        traverse(nums);

        /* Search for elements */
        int index = find(nums, 3);
        System.out.println("Find element 3 in nums, index = " + index);
    }
}
