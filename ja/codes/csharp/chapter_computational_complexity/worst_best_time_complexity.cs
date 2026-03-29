/**
 * File: worst_best_time_complexity.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_computational_complexity;

public class worst_best_time_complexity {
    /* 要素が { 1, 2, ..., n } で、順序がシャッフルされた配列を生成 */
    int[] RandomNumbers(int n) {
        int[] nums = new int[n];
        // 配列 nums = { 1, 2, 3, ..., n } を生成
        for (int i = 0; i < n; i++) {
            nums[i] = i + 1;
        }

        // 配列要素をランダムにシャッフル
        for (int i = 0; i < nums.Length; i++) {
            int index = new Random().Next(i, nums.Length);
            (nums[i], nums[index]) = (nums[index], nums[i]);
        }
        return nums;
    }

    /* 配列 nums 内で数値 1 のインデックスを探す */
    int FindOne(int[] nums) {
        for (int i = 0; i < nums.Length; i++) {
            // 要素 1 が配列の先頭にあるとき、最良時間計算量 O(1) となる
            // 要素 1 が配列の末尾にあるとき、最悪時間計算量 O(n) となる
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
            Console.WriteLine("\n配列 [ 1, 2, ..., n ] をシャッフルした後 = " + string.Join(",", nums));
            Console.WriteLine("数字 1 のインデックスは " + index);
        }
    }
}
