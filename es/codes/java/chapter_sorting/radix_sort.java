/**
 * File: radix_sort.java
 * Created Time: 2023-01-17
 * Author: krahets (krahets@163.com)
 */

package chapter_sorting;

import java.util.*;

public class radix_sort {
    /* 获取元素 num 的第 k 位，其中 exp = 10^(k-1) */
    static int digit(int num, int exp) {
        // 传入 exp 而非 k 可以避免在此重复执行昂贵的次方计算
        return (num / exp) % 10;
    }

    /* 计数排序（根据 nums 第 k 位排序） */
    static void countingSortDigit(int[] nums, int exp) {
        // 十进制的位范围为 0~9 ，因此需要长度为 10 的桶数组
        int[] counter = new int[10];
        int n = nums.length;
        // 统计 0~9 各数字的出现次数
        for (int i = 0; i < n; i++) {
            int d = digit(nums[i], exp); // 获取 nums[i] 第 k 位，记为 d
            counter[d]++;                // 统计数字 d 的出现次数
        }
        // 求前缀和，将“出现个数”转换为“数组索引”
        for (int i = 1; i < 10; i++) {
            counter[i] += counter[i - 1];
        }
        // 倒序遍历，根据桶内统计结果，将各元素填入 res
        int[] res = new int[n];
        for (int i = n - 1; i >= 0; i--) {
            int d = digit(nums[i], exp);
            int j = counter[d] - 1; // 获取 d 在数组中的索引 j
            res[j] = nums[i];       // 将当前元素填入索引 j
            counter[d]--;           // 将 d 的数量减 1
        }
        // 使用结果覆盖原数组 nums
        for (int i = 0; i < n; i++)
            nums[i] = res[i];
    }

    /* 基数排序 */
    static void radixSort(int[] nums) {
        // 获取数组的最大元素，用于判断最大位数
        int m = Integer.MIN_VALUE;
        for (int num : nums)
            if (num > m)
                m = num;
        // 按照从低位到高位的顺序遍历
        for (int exp = 1; exp <= m; exp *= 10) {
            // 对数组元素的第 k 位执行计数排序
            // k = 1 -> exp = 1
            // k = 2 -> exp = 10
            // 即 exp = 10^(k-1)
            countingSortDigit(nums, exp);
        }
    }

    public static void main(String[] args) {
        // 基数排序
        int[] nums = { 10546151, 35663510, 42865989, 34862445, 81883077,
                       88906420, 72429244, 30524779, 82060337, 63832996 };
        radixSort(nums);
        System.out.println("基数排序完成后 nums = " + Arrays.toString(nums));
    }
}
