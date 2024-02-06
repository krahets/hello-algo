/**
 * File: selection_sort.java
 * Created Time: 2023-05-23
 * Author: krahets (krahets@163.com)
 */

package chapter_sorting;

import java.util.Arrays;

public class selection_sort {
    /* 选择排序 */
    public static void selectionSort(int[] nums) {
        int n = nums.length;
        // 外循环：未排序区间为 [i, n-1]
        for (int i = 0; i < n - 1; i++) {
            // 内循环：找到未排序区间内的最小元素
            int k = i;
            for (int j = i + 1; j < n; j++) {
                if (nums[j] < nums[k])
                    k = j; // 记录最小元素的索引
            }
            // 将该最小元素与未排序区间的首个元素交换
            int temp = nums[i];
            nums[i] = nums[k];
            nums[k] = temp;
        }
    }

    public static void main(String[] args) {
        int[] nums = { 4, 1, 3, 1, 5, 2 };
        selectionSort(nums);
        System.out.println("选择排序完成后 nums = " + Arrays.toString(nums));
    }
}
