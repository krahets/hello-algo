/**
 * File: worst_best_time_complexity.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_computational_complexity;

public class worst_best_time_complexity {
    /* 生成一個陣列，元素為 { 1, 2, ..., n }，順序被打亂 */
    int[] RandomNumbers(int n) {
        int[] nums = new int[n];
        // 生成陣列 nums = { 1, 2, 3, ..., n }
        for (int i = 0; i < n; i++) {
            nums[i] = i + 1;
        }

        // 隨機打亂陣列元素
        for (int i = 0; i < nums.Length; i++) {
            int index = new Random().Next(i, nums.Length);
            (nums[i], nums[index]) = (nums[index], nums[i]);
        }
        return nums;
    }

    /* 查詢陣列 nums 中數字 1 所在索引 */
    int FindOne(int[] nums) {
        for (int i = 0; i < nums.Length; i++) {
            // 當元素 1 在陣列頭部時，達到最佳時間複雜度 O(1)
            // 當元素 1 在陣列尾部時，達到最差時間複雜度 O(n)
            if (nums[i] == 1)
                return i;
        }
        return -1;
    }


    /* Driver Code */
    [Test]
    public void Test() {
        for (int i = 0; i < 10; i++) {
            int n = 100;
            int[] nums = RandomNumbers(n);
            int index = FindOne(nums);
            Console.WriteLine("\n陣列 [ 1, 2, ..., n ] 被打亂後 = " + string.Join(",", nums));
            Console.WriteLine("數字 1 的索引為 " + index);
        }
    }
}
