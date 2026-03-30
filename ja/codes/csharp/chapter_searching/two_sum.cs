/**
 * File: two_sum.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_searching;

public class two_sum {
    /* 方法 1：総当たり列挙 */
    int[] TwoSumBruteForce(int[] nums, int target) {
        int size = nums.Length;
        // 2重ループのため、時間計算量は O(n^2)
        for (int i = 0; i < size - 1; i++) {
            for (int j = i + 1; j < size; j++) {
                if (nums[i] + nums[j] == target)
                    return [i, j];
            }
        }
        return [];
    }

    /* 方法 2：補助ハッシュテーブル */
    int[] TwoSumHashTable(int[] nums, int target) {
        int size = nums.Length;
        // 補助ハッシュテーブルを使用し、空間計算量は O(n)
        Dictionary<int, int> dic = [];
        // 単一ループで、時間計算量は O(n)
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
        // 方法 1
        int[] res = TwoSumBruteForce(nums, target);
        Console.WriteLine("方法1 res = " + string.Join(",", res));
        // 方法 2
        res = TwoSumHashTable(nums, target);
        Console.WriteLine("方法2 res = " + string.Join(",", res));
    }
}
