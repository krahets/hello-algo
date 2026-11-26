/**
 * File: bubble_sort.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_sorting;

import java.util.*;

public class bubble_sort {
    /* 氣泡排序 */
    static void bubbleSort(int[] nums) {
        // 外層迴圈：尚未排序的區間為 [0, i]
        for (int i = nums.length - 1; i > 0; i--) {
            // 內層迴圈：逐次交換，將未排序區間 [0, i] 中的最大元素移到區間最右端
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // 交換 nums[j] 與 nums[j + 1]
                    int tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                }
            }
        }
    }

    /* 氣泡排序（以旗標最佳化） */
    static void bubbleSortWithFlag(int[] nums) {
        // 外層迴圈：尚未排序的區間為 [0, i]
        for (int i = nums.length - 1; i > 0; i--) {
            boolean flag = false; // 初始化旗標
            // 內層迴圈：逐次交換，將未排序區間 [0, i] 中的最大元素移到區間最右端
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // 交換 nums[j] 與 nums[j + 1]
                    int tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                    flag = true; // 記錄本輪曾交換元素
                }
            }
            if (!flag)
                break; // 這一輪「冒泡」未交換任何元素，直接跳出迴圈
        }
    }

    public static void main(String[] args) {
        int[] nums = { 4, 1, 3, 1, 5, 2 };
        bubbleSort(nums);
        System.out.println("氣泡排序完成後 nums = " + Arrays.toString(nums));

        int[] nums1 = { 4, 1, 3, 1, 5, 2 };
        bubbleSortWithFlag(nums1);
        System.out.println("氣泡排序完成後 nums1 = " + Arrays.toString(nums1));
    }
}
