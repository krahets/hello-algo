/**
 * File: list.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_array_and_linkedlist;

public class list {
    [Test]
    public void Test() {

        // [region]{init_list}
        /* Initialize the list */
        // Without initial values
        List<int> emptyNums = [];
        // With initial values
        int[] numbers = [1, 3, 2, 5, 4];
        List<int> nums = [.. numbers];
        // [endregion]{init_list}
        Console.WriteLine("List nums = " + string.Join(",", nums));
        Console.WriteLine("List emptyNums = " + string.Join(",", emptyNums));

        // [region]{access_element}
        /* Access an element */
        int num = nums[1]; // Access the element at index 1
        // [endregion]{access_element}
        Console.WriteLine("Access the element at index 1, giving num = " + num);

        // [region]{update_element}
        /* Update an element */
        nums[1] = 0; // Update the element at index 1 to 0
        // [endregion]{update_element}
        Console.WriteLine("Update the element at index 1 to 0, giving nums = " + string.Join(",", nums));

        // [region]{clear_list}
        /* Clear the list */
        nums.Clear();
        // [endregion]{clear_list}
        Console.WriteLine("After clearing the list, nums = " + string.Join(",", nums));

        // [region]{append_element}
        /* Append at the end */
        nums.Add(1);
        nums.Add(3);
        nums.Add(2);
        nums.Add(5);
        nums.Add(4);
        // [endregion]{append_element}
        Console.WriteLine("After adding elements, nums = " + string.Join(",", nums));

        // [region]{insert_element}
        /* Insert an element in the middle */
        nums.Insert(3, 6); // Insert the number 6 at index 3
        // [endregion]{insert_element}
        Console.WriteLine("Insert the number 6 at index 3, giving nums = " + string.Join(",", nums));

        // [region]{remove_element}
        /* Remove an element */
        nums.RemoveAt(3); // Remove the element at index 3
        // [endregion]{remove_element}
        Console.WriteLine("Remove the element at index 3, giving nums = " + string.Join(",", nums));

        // [region]{iterate_list}
        /* Traverse the list by index */
        int count = 0;
        for (int i = 0; i < nums.Count; i++) {
            count += nums[i];
        }

        /* Iterate directly over the list elements */
        count = 0;
        foreach (int x in nums) {
            count += x;
        }
        // [endregion]{iterate_list}

        // [region]{concat_list}
        /* Concatenate two lists */
        List<int> nums1 = [6, 8, 7, 10, 9];
        nums.AddRange(nums1); // Append list nums1 to nums
        // [endregion]{concat_list}
        Console.WriteLine("After appending list nums1 to nums, nums = " + string.Join(",", nums));

        // [region]{sort_list}
        /* Sort the list */
        nums.Sort(); // After sorting, the list elements are in ascending order
        // [endregion]{sort_list}
        Console.WriteLine("After sorting the list, nums = " + string.Join(",", nums));
    }
}
