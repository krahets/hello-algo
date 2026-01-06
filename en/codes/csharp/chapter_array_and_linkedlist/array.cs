// File: array.cs
// Created Time: 2022-12-14
// Author: mingXta (1195669834@qq.com)

namespace hello_algo.chapter_array_and_linkedlist;

public class array {
    /* Random access to element */
    int RandomAccess(int[] nums) {
        Random random = new();
        // Randomly select a number in interval [0, nums.Length)
        int randomIndex = random.Next(nums.Length);
        // Retrieve and return the random element
        int randomNum = nums[randomIndex];
        return randomNum;
    }

    /* Extend array length */
    int[] Extend(int[] nums, int enlarge) {
        // Initialize an array with extended length
        int[] res = new int[nums.Length + enlarge];
        // Copy all elements from the original array to the new array
        for (int i = 0; i < nums.Length; i++) {
            res[i] = nums[i];
        }
        // Return the extended new array
        return res;
    }

    /* Insert element num at index index in the array */
    void Insert(int[] nums, int num, int index) {
        // Move all elements at and after index index backward by one position
        for (int i = nums.Length - 1; i > index; i--) {
            nums[i] = nums[i - 1];
        }
        // Assign num to the element at index index
        nums[index] = num;
    }

    /* Remove the element at index index */
    void Remove(int[] nums, int index) {
        // Move all elements after index index forward by one position
        for (int i = index; i < nums.Length - 1; i++) {
            nums[i] = nums[i + 1];
        }
    }

    /* Traverse array */
    void Traverse(int[] nums) {
        int count = 0;
        // Traverse array by index
        for (int i = 0; i < nums.Length; i++) {
            count += nums[i];
        }
        // Direct traversal of array elements
        foreach (int num in nums) {
            count += num;
        }
    }

    /* Find the specified element in the array */
    int Find(int[] nums, int target) {
        for (int i = 0; i < nums.Length; i++) {
            if (nums[i] == target)
                return i;
        }
        return -1;
    }

    /* Helper function, convert array to string */
    string ToString(int[] nums) {
        return string.Join(",", nums);
    }


    [Test]
    public void Test() {
        // Initialize array
        int[] arr = new int[5];
        Console.WriteLine("Array arr = " + ToString(arr));
        int[] nums = [1, 3, 2, 5, 4];
        Console.WriteLine("Array nums = " + ToString(nums));

        // Insert element
        int randomNum = RandomAccess(nums);
        Console.WriteLine("Get random element in nums " + randomNum);

        // Traverse array
        nums = Extend(nums, 3);
        Console.WriteLine("Extend array length to 8, resulting in nums = " + ToString(nums));

        // Insert element
        Insert(nums, 6, 3);
        Console.WriteLine("Insert number 6 at index 3, resulting in nums = " + ToString(nums));

        // Remove element
        Remove(nums, 2);
        Console.WriteLine("Remove element at index 2, resulting in nums = " + ToString(nums));

        // Traverse array
        Traverse(nums);

        // Find element
        int index = Find(nums, 3);
        Console.WriteLine("Find element 3 in nums, get index = " + index);
    }
}
