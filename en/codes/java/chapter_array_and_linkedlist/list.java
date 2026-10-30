/**
 * File: list.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_array_and_linkedlist;

import java.util.*;

public class list {
    public static void main(String[] args) {
        /* Initialize the list */
        // Use Integer[]: Integer is the wrapper type for int
        Integer[] numbers = new Integer[] { 1, 3, 2, 5, 4 };
        List<Integer> nums = new ArrayList<>(Arrays.asList(numbers));
        System.out.println("List nums = " + nums);

        /* Access an element */
        int num = nums.get(1);
        System.out.println("Access the element at index 1, giving num = " + num);

        /* Update an element */
        nums.set(1, 0);
        System.out.println("Update the element at index 1 to 0, giving nums = " + nums);

        /* Clear the list */
        nums.clear();
        System.out.println("After clearing the list, nums = " + nums);

        /* Append at the end */
        nums.add(1);
        nums.add(3);
        nums.add(2);
        nums.add(5);
        nums.add(4);
        System.out.println("After adding elements, nums = " + nums);

        /* Insert an element in the middle */
        nums.add(3, 6);
        System.out.println("Insert the number 6 at index 3, giving nums = " + nums);

        /* Remove an element */
        nums.remove(3);
        System.out.println("Remove the element at index 3, giving nums = " + nums);

        /* Traverse the list by index */
        int count = 0;
        for (int i = 0; i < nums.size(); i++) {
            count += nums.get(i);
        }
        /* Iterate directly over the list elements */
        for (int x : nums) {
            count += x;
        }

        /* Concatenate two lists */
        List<Integer> nums1 = new ArrayList<>(Arrays.asList(new Integer[] { 6, 8, 7, 10, 9 }));
        nums.addAll(nums1);
        System.out.println("After appending list nums1 to nums, nums = " + nums);

        /* Sort the list */
        Collections.sort(nums);
        System.out.println("After sorting the list, nums = " + nums);
    }
}
