/**
 * File: insertion_sort.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_sorting;

import java.util.*;

public class insertion_sort {
    /* 삽입 정렬 */
    static void insertionSort(int[] nums) {
        // 바깥 루프: 정렬된 구간은 [0, i-1]
        for (int i = 1; i < nums.length; i++) {
            int base = nums[i], j = i - 1;
            // 안쪽 루프: base를 정렬된 구간 [0, i-1]의 올바른 위치에 삽입
            while (j >= 0 && nums[j] > base) {
                nums[j + 1] = nums[j]; // nums[j]를 오른쪽으로 한 칸 이동
                j--;
            }
            nums[j + 1] = base;        // 올바른 위치에 base 대입
        }
    }

    public static void main(String[] args) {
        int[] nums = { 4, 1, 3, 1, 5, 2 };
        insertionSort(nums);
        System.out.println("삽입 정렬 후 nums = " + Arrays.toString(nums));
    }
}
