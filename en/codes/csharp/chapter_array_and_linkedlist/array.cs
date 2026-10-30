// File: array.cs
// Created Time: 2022-12-14
// Author: mingXta (1195669834@qq.com)

namespace hello_algo.chapter_array_and_linkedlist;

public class array {
    /* Access an element at a random index */
    int RandomAccess(int[] nums) {
        Random random = new();
        // Randomly select a number from [0, nums.Length)
        int randomIndex = random.Next(nums.Length);
        // Get and return the randomly selected element
        int randomNum = nums[randomIndex];
        return randomNum;
    }

    /* Extend the array length */
    int[] Extend(int[] nums, int enlarge) {
        // Initialize an array with the extended length
        int[] res = new int[nums.Length + enlarge];
        // Copy all elements from the original array to the new array
        for (int i = 0; i < nums.Length; i++) {
            res[i] = nums[i];
        }
        // Return the new, extended array
        return res;
    }

    /* Insert element num at index `index` in the array */
    void Insert(int[] nums, int num, int index) {
        // Shift all elements at and after index `index` one position to the right
        for (int i = nums.Length - 1; i > index; i--) {
            nums[i] = nums[i - 1];
        }
        // Assign num to the element at index `index`
        nums[index] = num;
    }

    /* Remove the element at index `index` */
    void Remove(int[] nums, int index) {
        // Shift all elements after index `index` one position to the left
        for (int i = index; i < nums.Length - 1; i++) {
            nums[i] = nums[i + 1];
        }
    }

    /* Traverse the array */
    void Traverse(int[] nums) {
        int count = 0;
        // Traverse the array by index
        for (int i = 0; i < nums.Length; i++) {
            count += nums[i];
        }
        // Iterate directly over the array elements
        foreach (int num in nums) {
            count += num;
        }
    }

    /* Find a specified element in the array */
    int Find(int[] nums, int target) {
        for (int i = 0; i < nums.Length; i++) {
            if (nums[i] == target)
                return i;
        }
        return -1;
    }

    /* Helper function: convert an array to a string */
    string ToString(int[] nums) {
        return string.Join(",", nums);
    }


    [Test]
    public void Test() {
        // Initialize the array
        int[] arr = new int[5];
        Console.WriteLine("Array arr = " + ToString(arr));
        int[] nums = [1, 3, 2, 5, 4];
        Console.WriteLine("Array nums = " + ToString(nums));

        // Random access
        int randomNum = RandomAccess(nums);
        Console.WriteLine("Randomly selected element from nums: " + randomNum);

        // Extend the length
        nums = Extend(nums, 3);
        Console.WriteLine("Extend the array length to 8, giving nums = " + ToString(nums));

        // Insert an element
        Insert(nums, 6, 3);
        Console.WriteLine("Insert the number 6 at index 3, giving nums = " + ToString(nums));

        // Remove an element
        Remove(nums, 2);
        Console.WriteLine("Remove the element at index 2, giving nums = " + ToString(nums));

        // Traverse the array
        Traverse(nums);

        // Find an element 
        int index = Find(nums, 3);
        Console.WriteLine("Find element 3 in nums, giving index = " + index);
    }
}
