/**
 * File: two_sum.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_searching;

public class two_sum {
    /* 方法 1：総当たり */
    int[] TwoSumBruteForce(int[] nums, int target) {
        int size = nums.Length;
        // 二重ループの時間計算量は O(n^2)
        for (int i = 0; i < size - 1; i++) {
            for (int j = i + 1; j < size; j++) {
                if (nums[i] + nums[j] == target)
                    return [i, j];
            }
        }
        return [];
    }

    /* 方法 2：補助のハッシュテーブルを使う */
    int[] TwoSumHashTable(int[] nums, int target) {
        int size = nums.Length;
        // 補助のハッシュテーブルの空間計算量は O(n)
        Dictionary<int, int> dic = [];
        // 一重ループの時間計算量は O(n)
        for (int i = 0; i < size; i++) {
            if (dic.ContainsKey(target - nums[i])) {
                return [dic[target - nums[i]], i];
            }
            dic[nums[i]] = i;
        }
        return [];
    }

    [Test]
    public void Test() {
        // ======= テストケース =======
        int[] nums = [2, 7, 11, 15];
        int target = 13;

        // ====== 実行例 ======
        // 方法 1
        int[] res = TwoSumBruteForce(nums, target);
        Console.WriteLine("方法 1 の res = " + string.Join(",", res));
        // 方法 2
        res = TwoSumHashTable(nums, target);
        Console.WriteLine("方法 2 の res = " + string.Join(",", res));
    }
}
