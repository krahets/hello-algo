/**
 * File: list.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_array_and_linkedlist;

import java.util.*;

public class list {
    public static void main(String[] args) {
        // [region]{init_list}
        /* Initialize the list */
        // Without initial values
        List<Integer> emptyNums = new ArrayList<>();
        // With initial values (note that the array type must be Integer[] rather than int[], because list elements must use Integer, the wrapper class for int)
        Integer[] numbers = new Integer[] { 1, 3, 2, 5, 4 };
        List<Integer> nums = new ArrayList<>(Arrays.asList(numbers));
        // [endregion]{init_list}
        System.out.println("List nums = " + nums);
        System.out.println("List emptyNums = " + emptyNums);

        // [region]{access_element}
        /* Access an element */
        int num = nums.get(1); // Access the element at index 1
        // [endregion]{access_element}
        System.out.println("Access the element at index 1, giving num = " + num);

        // [region]{update_element}
        /* Update an element */
        nums.set(1, 0); // Update the element at index 1 to 0
        // [endregion]{update_element}
        System.out.println("Update the element at index 1 to 0, giving nums = " + nums);

        // [region]{clear_list}
        /* Clear the list */
        nums.clear();
        // [endregion]{clear_list}
        System.out.println("After clearing the list, nums = " + nums);

        // [region]{append_element}
        /* Append at the end */
        nums.add(1);
        nums.add(3);
        nums.add(2);
        nums.add(5);
        nums.add(4);
        // [endregion]{append_element}
        System.out.println("After adding elements, nums = " + nums);

        // [region]{insert_element}
        /* Insert an element in the middle */
        nums.add(3, 6); // Insert the number 6 at index 3
        // [endregion]{insert_element}
        System.out.println("Insert the number 6 at index 3, giving nums = " + nums);

        // [region]{remove_element}
        /* Remove an element */
        nums.remove(3); // Remove the element at index 3
        // [endregion]{remove_element}
        System.out.println("Remove the element at index 3, giving nums = " + nums);

        // [region]{iterate_list}
        /* Traverse the list by index */
        int count = 0;
        for (int i = 0; i < nums.size(); i++) {
            count += nums.get(i);
        }

        /* Iterate directly over the list elements */
        for (int x : nums) {
            count += x;
        }
        // [endregion]{iterate_list}

        // [region]{concat_list}
        /* Concatenate two lists */
        List<Integer> nums1 = new ArrayList<>(Arrays.asList(new Integer[] { 6, 8, 7, 10, 9 }));
        nums.addAll(nums1); // Append list nums1 to nums
        // [endregion]{concat_list}
        System.out.println("After appending list nums1 to nums, nums = " + nums);

        // [region]{sort_list}
        /* Sort the list */
        Collections.sort(nums); // After sorting, the list elements are in ascending order
        // [endregion]{sort_list}
        System.out.println("After sorting the list, nums = " + nums);
    }
}
