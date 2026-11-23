/**
 * File: list.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_array_and_linkedlist;

public class list {
    [Test]
    public void Test() {

        /* Initialize the list */
        int[] numbers = [1, 3, 2, 5, 4];
        List<int> nums = [.. numbers];
        Console.WriteLine("List nums = " + string.Join(",", nums));

        /* Access an element */
        int num = nums[1];
        Console.WriteLine("Access the element at index 1, giving num = " + num);

        /* Update an element */
        nums[1] = 0;
        Console.WriteLine("Update the element at index 1 to 0, giving nums = " + string.Join(",", nums));

        /* Clear the list */
        nums.Clear();
        Console.WriteLine("After clearing the list, nums = " + string.Join(",", nums));

        /* Append at the end */
        nums.Add(1);
        nums.Add(3);
        nums.Add(2);
        nums.Add(5);
        nums.Add(4);
        Console.WriteLine("After adding elements, nums = " + string.Join(",", nums));

        /* Insert an element in the middle */
        nums.Insert(3, 6);
        Console.WriteLine("Insert the number 6 at index 3, giving nums = " + string.Join(",", nums));

        /* Remove an element */
        nums.RemoveAt(3);
        Console.WriteLine("Remove the element at index 3, giving nums = " + string.Join(",", nums));

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

        /* Concatenate two lists */
        List<int> nums1 = [6, 8, 7, 10, 9];
        nums.AddRange(nums1);
        Console.WriteLine("After appending list nums1 to nums, nums = " + string.Join(",", nums));

        /* Sort the list */
        nums.Sort(); // After sorting, the list elements are in ascending order
        Console.WriteLine("After sorting the list, nums = " + string.Join(",", nums));
    }
}
