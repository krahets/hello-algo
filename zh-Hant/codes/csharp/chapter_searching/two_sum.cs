/**
 * File: two_sum.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_searching;

public class two_sum {
    /* 方法一：暴力列舉 */
    int[] TwoSumBruteForce(int[] nums, int target) {
        int size = nums.Length;
        // 兩層迴圈，時間複雜度為 O(n^2)
        for (int i = 0; i < size - 1; i++) {
            for (int j = i + 1; j < size; j++) {
                if (nums[i] + nums[j] == target)
                    return [i, j];
            }
        }
        return [];
    }

    /* 方法二：輔助雜湊表 */
    int[] TwoSumHashTable(int[] nums, int target) {
        int size = nums.Length;
        // 輔助雜湊表，空間複雜度為 O(n)
        Dictionary<int, int> dic = [];
        // 單層迴圈，時間複雜度為 O(n)
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
