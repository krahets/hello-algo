/**
 * File: leetcode_two_sum.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

using NUnit.Framework;

namespace hello_algo.chapter_computational_complexity
{
    class SolutionBruteForce
    {
        public int[] twoSum(int[] nums, int target)
        {
            int size = nums.Length;
            // 两层循环，时间复杂度 O(n^2)
            for (int i = 0; i < size - 1; i++)
            {
                for (int j = i + 1; j < size; j++)
                {
                    if (nums[i] + nums[j] == target)
                        return new int[] { i, j };
                }
            }
            return new int[0];
        }
    }

    class SolutionHashMap
    {
        public int[] twoSum(int[] nums, int target)
        {
            int size = nums.Length;
            // 辅助哈希表，空间复杂度 O(n)
            Dictionary<int, int> dic = new();
            // 单层循环，时间复杂度 O(n)
            for (int i = 0; i < size; i++)
            {
                if (dic.ContainsKey(target - nums[i]))
                {
                    return new int[] { dic[target - nums[i]], i };
                }
                dic.Add(nums[i], i);
            }
            return new int[0];
        }
    }

    public class leetcode_two_sum
    {
        [Test]
        public void Test()
        {
            // ======= Test Case =======
            int[] nums = { 2, 7, 11, 15 };
            int target = 9;

            // ====== Driver Code ======
            // 方法一
            SolutionBruteForce slt1 = new SolutionBruteForce();
            int[] res = slt1.twoSum(nums, target);
            Console.WriteLine("方法一 res = " + string.Join(",", res));
            // 方法二
            SolutionHashMap slt2 = new SolutionHashMap();
            res = slt2.twoSum(nums, target);
            Console.WriteLine("方法二 res = " + string.Join(",", res));
        }
    }
}
