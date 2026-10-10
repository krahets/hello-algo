/**
 * File: two_sum.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_searching;

public class two_sum {
    /* Метод 1: полный перебор */
    int[] TwoSumBruteForce(int[] nums, int target) {
        int size = nums.Length;
        // Два вложенных цикла, временная сложность O(n^2)
        for (int i = 0; i < size - 1; i++) {
            for (int j = i + 1; j < size; j++) {
                if (nums[i] + nums[j] == target)
                    return [i, j];
            }
        }
        return [];
    }

    /* Метод 2: вспомогательная хеш-таблица */
    int[] TwoSumHashTable(int[] nums, int target) {
        int size = nums.Length;
        // Вспомогательная хеш-таблица, пространственная сложность O(n)
        Dictionary<int, int> dic = [];
        // Один цикл, временная сложность O(n)
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

        // ====== Основной код ======
        // Метод 1
        int[] res = TwoSumBruteForce(nums, target);
        Console.WriteLine("Результат метода 1 res = " + string.Join(",", res));
        // Метод 2
        res = TwoSumHashTable(nums, target);
        Console.WriteLine("Результат метода 2 res = " + string.Join(",", res));
    }
}
