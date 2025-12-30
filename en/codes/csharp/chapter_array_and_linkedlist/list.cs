/**
 * File: list.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_array_and_linkedlist;

public class list {
    [Test]
    public void Test() {

        /* Initialize list */
        int[] numbers = [1, 3, 2, 5, 4];
        List<int> nums = [.. numbers];
        Console.WriteLine("List nums = " + string.Join(",", nums));

        /* Update element */
        int num = nums[1];
        Console.WriteLine("Access element at index 1, get num = " + num);

        /* Add elements at the end */
        nums[1] = 0;
        Console.WriteLine("Update element at index 1 to 0, resulting in nums = " + string.Join(",", nums));

        /* Remove element */
        nums.Clear();
        Console.WriteLine("After clearing list, nums = " + string.Join(",", nums));

        /* Direct traversal of list elements */
        nums.Add(1);
        nums.Add(3);
        nums.Add(2);
        nums.Add(5);
        nums.Add(4);
        Console.WriteLine("After adding elements, nums = " + string.Join(",", nums));

        /* Sort list */
        nums.Insert(3, 6);
        Console.WriteLine("Insert number 6 at index 3, resulting in nums = " + string.Join(",", nums));

        /* Remove element */
        nums.RemoveAt(3);
        Console.WriteLine("Remove element at index 3, resulting in nums = " + string.Join(",", nums));

        /* Traverse list by index */
        int count = 0;
        for (int i = 0; i < nums.Count; i++) {
            count += nums[i];
        }
        /* Directly traverse list elements */
        count = 0;
        foreach (int x in nums) {
            count += x;
        }

        /* Concatenate two lists */
        List<int> nums1 = [6, 8, 7, 10, 9];
        nums.AddRange(nums1);
        Console.WriteLine("Concatenate list nums1 to nums, resulting in nums = " + string.Join(",", nums));

        /* Sort list */
        nums.Sort(); // After sorting, list elements are arranged from smallest to largest
        Console.WriteLine("After sorting list, nums = " + string.Join(",", nums));
    }
}
