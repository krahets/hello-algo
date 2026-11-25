/**
 * File: worst_best_time_complexity.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_computational_complexity;

public class worst_best_time_complexity {
    /* { 1, 2, ..., n } の要素をランダムに並べた配列を生成 */
    int[] RandomNumbers(int n) {
        int[] nums = new int[n];
        // 配列 nums = { 1, 2, 3, ..., n } を生成
        for (int i = 0; i < n; i++) {
            nums[i] = i + 1;
        }

        // 配列の要素をシャッフル
        for (int i = 0; i < nums.Length; i++) {
            int index = new Random().Next(i, nums.Length);
            (nums[i], nums[index]) = (nums[index], nums[i]);
        }
        return nums;
    }

    /* 配列 nums で数値 1 のインデックスを探す */
    int FindOne(int[] nums) {
        for (int i = 0; i < nums.Length; i++) {
            // 1 が配列の先頭にあるとき、最良時間計算量 O(1) となる
            // 1 が配列の末尾にあるとき、最悪時間計算量 O(n) となる
            if (nums[i] == 1)
                return i;
        }
        return -1;
    }


    /* 実行例 */
    [Test]
    public void Test() {
        for (int i = 0; i < 10; i++) {
            int n = 100;
            int[] nums = RandomNumbers(n);
            int index = FindOne(nums);
            Console.WriteLine("\n配列 [ 1, 2, ..., n ] のシャッフル結果 = " + string.Join(",", nums));
            Console.WriteLine("数値 1 のインデックスは " + index);
        }
    }
}
