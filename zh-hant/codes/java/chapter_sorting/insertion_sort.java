/**
 * File: insertion_sort.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_sorting;

import java.util.*;

public class insertion_sort {
    /* 插入排序 */
    static void insertionSort(int[] nums) {
        // 外迴圈：已排序區間為 [0, i-1]
        for (int i = 1; i < nums.length; i++) {
            int base = nums[i], j = i - 1;
            // 內迴圈：將 base 插入到已排序區間 [0, i-1] 中的正確位置
            while (j >= 0 && nums[j] > base) {
                nums[j + 1] = nums[j]; // 將 nums[j] 向右移動一位
                j--;
            }
            nums[j + 1] = base;        // 將 base 賦值到正確位置
        }
    }

    public static void main(String[] args) {
        int[] nums = { 4, 1, 3, 1, 5, 2 };
        insertionSort(nums);
        System.out.println("插入排序完成後 nums = " + Arrays.toString(nums));
    }
}
