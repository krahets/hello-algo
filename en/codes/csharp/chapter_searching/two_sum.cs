/**
 * File: two_sum.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_searching;

public class two_sum {
    /* Method one: Brute force enumeration */
    int[] TwoSumBruteForce(int[] nums, int target) {
        int size = nums.Length;
        // Two-layer loop, time complexity is O(n^2)
        for (int i = 0; i < size - 1; i++) {
            for (int j = i + 1; j < size; j++) {
                if (nums[i] + nums[j] == target)
                    return [i, j];
            }
        }
        return [];
    }

    /* Method two: Auxiliary hash table */
    int[] TwoSumHashTable(int[] nums, int target) {
        int size = nums.Length;
        // Auxiliary hash table, space complexity is O(n)
        Dictionary<int, int> dic = [];
        // Single-layer loop, time complexity is O(n)
        for (int i = 0; i < size; i++) {
            if (dic.ContainsKey(target - nums[i])) {
                return [dic[target - nums[i]], i];
            }
            dic.Add(nums[i], i);
        }
        return [];
    }

    [Test]
    public void Test() {
        // ======= Test Case =======
        int[] nums = [2, 7, 11, 15];
        int target = 13;

        // ====== Driver Code ======
        // Method one
        int[] res = TwoSumBruteForce(nums, target);
        Console.WriteLine("Method one result = " + string.Join(", ", res));
        // Method two
        res = TwoSumHashTable(nums, target);
        Console.WriteLine("Method two result = " + string.Join(", ", res));
    }
}
