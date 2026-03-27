/**
 * File: two_sum.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_searching;

import java.util.*;

public class two_sum {
    /* Метод 1: полный перебор */
    static int[] twoSumBruteForce(int[] nums, int target) {
        int size = nums.length;
        // Два вложенных цикла, временная сложность O(n^2)
        for (int i = 0; i < size - 1; i++) {
            for (int j = i + 1; j < size; j++) {
                if (nums[i] + nums[j] == target)
                    return new int[] { i, j };
            }
        }
        return new int[0];
    }

    /* Метод 2: вспомогательная хеш-таблица */
    static int[] twoSumHashTable(int[] nums, int target) {
        int size = nums.length;
        // Вспомогательная хеш-таблица, пространственная сложность O(n)
        Map<Integer, Integer> dic = new HashMap<>();
        // Один цикл, временная сложность O(n)
        for (int i = 0; i < size; i++) {
            if (dic.containsKey(target - nums[i])) {
                return new int[] { dic.get(target - nums[i]), i };
            }
            dic.put(nums[i], i);
        }
        return new int[0];
    }

    public static void main(String[] args) {
        // ======= Test Case =======
        int[] nums = { 2, 7, 11, 15 };
        int target = 13;

        // ====== Основной код ======
        // Метод 1
        int[] res = twoSumBruteForce(nums, target);
        System.out.println("Результат метода 1 res = " + Arrays.toString(res));
        // Метод 2
        res = twoSumHashTable(nums, target);
        System.out.println("Результат метода 2 res = " + Arrays.toString(res));
    }
}
