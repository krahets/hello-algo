/**
 * File: list.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_array_and_linkedlist;

import java.util.*;

public class list {
    public static void main(String[] args) {
        /* Initialize list */
        // Note that the array element type is Integer[], the wrapper class of int[]
        Integer[] numbers = new Integer[] { 1, 3, 2, 5, 4 };
        List<Integer> nums = new ArrayList<>(Arrays.asList(numbers));
        System.out.println("List nums = " + nums);

        /* Update element */
        int num = nums.get(1);
        System.out.println("Access element at index 1, get num = " + num);

        /* Add elements at the end */
        nums.set(1, 0);
        System.out.println("Update element at index 1 to 0, resulting in nums = " + nums);

        /* Remove element */
        nums.clear();
        System.out.println("After clearing list, nums = " + nums);

        /* Direct traversal of list elements */
        nums.add(1);
        nums.add(3);
        nums.add(2);
        nums.add(5);
        nums.add(4);
        System.out.println("After adding elements, nums = " + nums);

        /* Sort list */
        nums.add(3, 6);
        System.out.println("Insert number 6 at index 3, resulting in nums = " + nums);

        /* Remove element */
        nums.remove(3);
        System.out.println("Remove element at index 3, resulting in nums = " + nums);

        /* Traverse list by index */
        int count = 0;
        for (int i = 0; i < nums.size(); i++) {
            count += nums.get(i);
        }
        /* Directly traverse list elements */
        for (int x : nums) {
            count += x;
        }

        /* Concatenate two lists */
        List<Integer> nums1 = new ArrayList<>(Arrays.asList(new Integer[] { 6, 8, 7, 10, 9 }));
        nums.addAll(nums1);
        System.out.println("Concatenate list nums1 to nums, resulting in nums = " + nums);

        /* Sort list */
        Collections.sort(nums);
        System.out.println("After sorting list, nums = " + nums);
    }
}
