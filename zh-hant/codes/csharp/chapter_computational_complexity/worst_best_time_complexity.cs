/**
 * File: worst_best_time_complexity.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_computational_complexity;

public class worst_best_time_complexity {
    /* 建立含有 { 1, 2, ..., n } 的陣列，並打亂順序 */
    int[] RandomNumbers(int n) {
        int[] nums = new int[n];
        // 建立陣列 nums = { 1, 2, 3, ..., n }
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

    /* 在陣列 nums 中尋找數字 1 的索引 */
    int FindOne(int[] nums) {
        for (int i = 0; i < nums.Length; i++) {
            // 若 1 在陣列開頭，最佳時間複雜度為 O(1)
            // 若 1 在陣列末端，最差時間複雜度為 O(n)
            if (nums[i] == 1)
                return i;
        }
        return -1;
    }


    /* 主程式 */
    [Test]
    public void Test() {
        for (int i = 0; i < 10; i++) {
            int n = 100;
            int[] nums = RandomNumbers(n);
            int index = FindOne(nums);
            Console.WriteLine("\n陣列 [ 1, 2, ..., n ] 打亂順序後 = " + string.Join(",", nums));
            Console.WriteLine("數字 1 的索引為 " + index);
        }
    }
}
