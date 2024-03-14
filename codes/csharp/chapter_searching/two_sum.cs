/**
 * File: two_sum.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_searching;

public class two_sum {
    /* 方法一：暴力枚举 */
    int[] TwoSumBruteForce(int[] nums, int target) {
        int size = nums.Length;
        // 两层循环，时间复杂度为 O(n^2)
        for (int i = 0; i < size - 1; i++) {
            for (int j = i + 1; j < size; j++) {
                if (nums[i] + nums[j] == target)
                    return [i, j];
            }
        }
        return [];
    }

    /* 方法二：辅助哈希表 */
    int[] TwoSumHashTable(int[] nums, int target) {
        int size = nums.Length;
        // 辅助哈希表，空间复杂度为 O(n)
        Dictionary<int, int> dic = [];
        // 单层循环，时间复杂度为 O(n)
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
        // 方法一
        int[] res = TwoSumBruteForce(nums, target);
        Console.WriteLine("方法一 res = " + string.Join(",", res));
        // 方法二
        res = TwoSumHashTable(nums, target);
        Console.WriteLine("方法二 res = " + string.Join(",", res));
    }
}
