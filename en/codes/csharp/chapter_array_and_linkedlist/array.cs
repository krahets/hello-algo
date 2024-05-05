// File: array.cs
// Created Time: 2022-12-14
// Author: mingXta (1195669834@qq.com)

namespace hello_algo.chapter_array_and_linkedlist;

public class array {
    /* Random access to elements */
    int RandomAccess(int[] nums) {
        Random random = new();
        // Randomly select a number within the interval [0, nums.Length)
        int randomIndex = random.Next(nums.Length);
        // Retrieve and return a random element
        int randomNum = nums[randomIndex];
        return randomNum;
    }

    /* Extend array length */
    int[] Extend(int[] nums, int enlarge) {
        // Initialize an extended length array
        int[] res = new int[nums.Length + enlarge];
        // Copy all elements from the original array to the new array
        for (int i = 0; i < nums.Length; i++) {
            res[i] = nums[i];
        }
        // Return the new array after expansion
        return res;
    }

    /* Insert element num at `index` */
    void Insert(int[] nums, int num, int index) {
        // Move all elements after `index` one position backward
        for (int i = nums.Length - 1; i > index; i--) {
            nums[i] = nums[i - 1];
        }
        // Assign num to the element at index
        nums[index] = num;
    }

    /* Remove the element at `index` */
    void Remove(int[] nums, int index) {
        // Move all elements after `index` one position forward
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
        // Traverse array elements
        foreach (int num in nums) {
            count += num;
        }
    }

    /* Search for a specified element in the array */
    int Find(int[] nums, int target) {
        for (int i = 0; i < nums.Length; i++) {
            if (nums[i] == target)
                return i;
        }
        return -1;
    }

    /* Helper function, array to string */
    string ToString(int[] nums) {
        return string.Join(",", nums);
    }


    [Test]
    public void Test() {
        // Initialize an array
        int[] arr = new int[5];
        Console.WriteLine("Array arr =" + ToString(arr));
        int[] nums = [1, 3, 2, 5, 4];
        Console.WriteLine("Array nums =" + ToString(nums));

        // Random access
        int randomNum = RandomAccess(nums);
        Console.WriteLine("Get a random element from nums" + randomNum);

        // Length extension
        nums = Extend(nums, 3);
        Console.WriteLine("Extend the array length to 8, resulting in nums =" + ToString(nums));

        // Insert element
        Insert(nums, 6, 3);
        Console.WriteLine("Insert the number 6 at index 3, resulting in nums =" + ToString(nums));

        // Remove element
        Remove(nums, 2);
        Console.WriteLine("Remove the element at index 2, resulting in nums =" + ToString(nums));

        // Traverse array
        Traverse(nums);

        // Find element
        int index = Find(nums, 3);
        Console.WriteLine("Find element 3 in nums, index =" + index);
    }
}
