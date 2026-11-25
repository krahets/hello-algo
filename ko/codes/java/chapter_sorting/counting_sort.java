/**
 * File: counting_sort.java
 * Created Time: 2023-03-17
 * Author: krahets (krahets@163.com)
 */

package chapter_sorting;

import java.util.*;

public class counting_sort {
    /* 계수 정렬 */
    // 객체를 정렬할 수 없는 간단한 구현
    static void countingSortNaive(int[] nums) {
        // 1. 배열의 최댓값 m 구하기
        int m = 0;
        for (int num : nums) {
            m = Math.max(m, num);
        }
        // 2. 각 숫자의 출현 횟수 세기
        // counter[num]은 num의 출현 횟수
        int[] counter = new int[m + 1];
        for (int num : nums) {
            counter[num]++;
        }
        // 3. counter를 순회하며 각 원소를 원래 배열 nums에 채우기
        int i = 0;
        for (int num = 0; num < m + 1; num++) {
            for (int j = 0; j < counter[num]; j++, i++) {
                nums[i] = num;
            }
        }
    }

    /* 계수 정렬 */
    // 객체도 정렬할 수 있는 안정 정렬의 전체 구현
    static void countingSort(int[] nums) {
        // 1. 배열의 최댓값 m 구하기
        int m = 0;
        for (int num : nums) {
            m = Math.max(m, num);
        }
        // 2. 각 숫자의 출현 횟수 세기
        // counter[num]은 num의 출현 횟수
        int[] counter = new int[m + 1];
        for (int num : nums) {
            counter[num]++;
        }
        // 3. counter의 누적합을 구해 ‘출현 횟수’를 ‘끝 위치’로 변환
        // 즉, counter[num]-1은 res에서 num이 마지막으로 나타나는 인덱스
        for (int i = 0; i < m; i++) {
            counter[i + 1] += counter[i];
        }
        // 4. nums를 역순으로 순회하며 각 원소를 결과 배열 res에 채우기
        // 결과를 기록할 배열 res 초기화
        int n = nums.length;
        int[] res = new int[n];
        for (int i = n - 1; i >= 0; i--) {
            int num = nums[i];
            res[counter[num] - 1] = num; // num을 해당 인덱스에 배치
            counter[num]--; // 누적합을 1 줄여 다음 num을 배치할 인덱스 구하기
        }
        // 결과 배열 res로 원래 배열 nums를 덮어쓰기
        for (int i = 0; i < n; i++) {
            nums[i] = res[i];
        }
    }

    public static void main(String[] args) {
        int[] nums = { 1, 0, 1, 2, 0, 4, 0, 2, 2, 4 };
        countingSortNaive(nums);
        System.out.println("계수 정렬(객체 정렬 불가) 후 nums = " + Arrays.toString(nums));

        int[] nums1 = { 1, 0, 1, 2, 0, 4, 0, 2, 2, 4 };
        countingSort(nums1);
        System.out.println("계수 정렬 후 nums1 = " + Arrays.toString(nums1));
    }
}
