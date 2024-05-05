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
        // The array's element type is Integer[], a wrapper class for int
        Integer[] numbers = new Integer[] { 1, 3, 2, 5, 4 };
        List<Integer> nums = new ArrayList<>(Arrays.asList(numbers));
        System.out.println("List nums = " + nums);

        /* Access element */
        int num = nums.get(1);
        System.out.println("Access the element at index 1, obtained num = " + num);

        /* Update element */
        nums.set(1, 0);
        System.out.println("Update the element at index 1 to 0, resulting in nums = " + nums);

        /* Clear list */
        nums.clear();
        System.out.println("After clearing the list, nums = " + nums);

        /* Add element at the end */
        nums.add(1);
        nums.add(3);
        nums.add(2);
        nums.add(5);
        nums.add(4);
        System.out.println("After adding elements, nums = " + nums);

        /* Insert element in the middle */
        nums.add(3, 6);
        System.out.println("Insert the number 6 at index 3, resulting in nums = " + nums);

        /* Remove element */
        nums.remove(3);
        System.out.println("Remove the element at index 3, resulting in nums = " + nums);

        /* Traverse the list by index */
        int count = 0;
        for (int i = 0; i < nums.size(); i++) {
            count += nums.get(i);
        }
        /* Traverse the list elements */
        for (int x : nums) {
            count += x;
        }

        /* Concatenate two lists */
        List<Integer> nums1 = new ArrayList<>(Arrays.asList(new Integer[] { 6, 8, 7, 10, 9 }));
        nums.addAll(nums1);
        System.out.println("Concatenate list nums1 to nums, resulting in nums = " + nums);

        /* Sort list */
        Collections.sort(nums);
        System.out.println("After sorting the list, nums = " + nums);
    }
}
