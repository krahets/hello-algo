/**
 * File: counting_sort.java
 * Created Time: 2023-03-17
 * Author: krahets (krahets@163.com)
 */

package chapter_sorting;

import java.util.*;

public class counting_sort {
    /* 계수 정렬 */
    // 간단한 구현이며, 객체 정렬에는 사용할 수 없다
    static void countingSortNaive(int[] nums) {
        // 1. 배열의 최댓값 m을 구한다
        int m = 0;
        for (int num : nums) {
            m = Math.max(m, num);
        }
        // 2. 각 숫자의 등장 횟수를 센다
        // counter[num]은 num의 등장 횟수를 나타낸다
        int[] counter = new int[m + 1];
        for (int num : nums) {
            counter[num]++;
        }
        // 3. counter를 순회하며 각 원소를 원래 배열 nums에 채운다
        int i = 0;
        for (int num = 0; num < m + 1; num++) {
            for (int j = 0; j < counter[num]; j++, i++) {
                nums[i] = num;
            }
        }
    }

    /* 계수 정렬 */
    // 완전한 구현이며, 객체를 정렬할 수 있고 안정 정렬이다
    static void countingSort(int[] nums) {
        // 1. 배열의 최댓값 m을 구한다
        int m = 0;
        for (int num : nums) {
            m = Math.max(m, num);
        }
        // 2. 각 숫자의 등장 횟수를 센다
        // counter[num]은 num의 등장 횟수를 나타낸다
        int[] counter = new int[m + 1];
        for (int num : nums) {
            counter[num]++;
        }
        // 3. counter의 접두 합을 구하여 등장 횟수를 마지막 인덱스로 변환한다
        // 즉, counter[num]-1은 res에서 num이 마지막으로 등장하는 인덱스이다
        for (int i = 0; i < m; i++) {
            counter[i + 1] += counter[i];
        }
        // 4. nums를 역순으로 순회하며 각 원소를 결과 배열 res에 채운다
        // 결과를 기록할 배열 res를 초기화한다
        int n = nums.length;
        int[] res = new int[n];
        for (int i = n - 1; i >= 0; i--) {
            int num = nums[i];
            res[counter[num] - 1] = num; // num을 해당 인덱스에 배치한다
            counter[num]--; // 접두 합을 1 감소시켜 다음에 num을 배치할 인덱스를 구한다
        }
        // 결과 배열 res로 원래 배열 nums를 덮어쓴다
        for (int i = 0; i < n; i++) {
            nums[i] = res[i];
        }
    }

    public static void main(String[] args) {
        int[] nums = { 1, 0, 1, 2, 0, 4, 0, 2, 2, 4 };
        countingSortNaive(nums);
        System.out.println("계수 정렬(객체 정렬 불가)을 마친 후 nums = " + Arrays.toString(nums));

        int[] nums1 = { 1, 0, 1, 2, 0, 4, 0, 2, 2, 4 };
        countingSort(nums1);
        System.out.println("계수 정렬을 마친 후 nums1 = " + Arrays.toString(nums1));
    }
}
