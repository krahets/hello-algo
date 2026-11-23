/**
 * File: selection_sort.java
 * Created Time: 2023-05-23
 * Author: krahets (krahets@163.com)
 */

package chapter_sorting;

import java.util.Arrays;

public class selection_sort {
    /* 선택 정렬 */
    public static void selectionSort(int[] nums) {
        int n = nums.length;
        // 바깥쪽 반복문: 정렬되지 않은 구간은 [i, n-1]이다
        for (int i = 0; i < n - 1; i++) {
            // 안쪽 반복문: 정렬되지 않은 구간의 최솟값을 찾는다
            int k = i;
            for (int j = i + 1; j < n; j++) {
                if (nums[j] < nums[k])
                    k = j; // 최솟값의 인덱스를 기록한다
            }
            // 이 최솟값과 정렬되지 않은 구간의 첫 원소를 교환한다
            int temp = nums[i];
            nums[i] = nums[k];
            nums[k] = temp;
        }
    }

    public static void main(String[] args) {
        int[] nums = { 4, 1, 3, 1, 5, 2 };
        selectionSort(nums);
        System.out.println("선택 정렬을 마친 후 nums = " + Arrays.toString(nums));
    }
}
