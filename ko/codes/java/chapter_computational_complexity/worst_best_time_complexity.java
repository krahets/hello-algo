/**
 * File: worst_best_time_complexity.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_computational_complexity;

import java.util.*;

public class worst_best_time_complexity {
    /* { 1, 2, ..., n }을 원소로 갖는 배열을 만들고 순서를 섞는다 */
    static int[] randomNumbers(int n) {
        Integer[] nums = new Integer[n];
        // 배열 nums = { 1, 2, 3, ..., n }을 만든다
        for (int i = 0; i < n; i++) {
            nums[i] = i + 1;
        }
        // 배열의 원소를 무작위로 섞는다
        Collections.shuffle(Arrays.asList(nums));
        // Integer[] -> int[]
        int[] res = new int[n];
        for (int i = 0; i < n; i++) {
            res[i] = nums[i];
        }
        return res;
    }

    /* 배열 nums에서 1의 인덱스를 찾는다 */
    static int findOne(int[] nums) {
        for (int i = 0; i < nums.length; i++) {
            // 1이 배열 맨 앞에 있으면 최선 시간 복잡도 O(1)이 된다
            // 1이 배열 맨 뒤에 있으면 최악 시간 복잡도 O(n)이 된다
            if (nums[i] == 1)
                return i;
        }
        return -1;
    }

    /* 실행 예제 */
    public static void main(String[] args) {
        for (int i = 0; i < 10; i++) {
            int n = 100;
            int[] nums = randomNumbers(n);
            int index = findOne(nums);
            System.out.println("\n배열 [ 1, 2, ..., n ]을 섞은 결과 = " + Arrays.toString(nums));
            System.out.println("숫자 1의 인덱스 = " + index);
        }
    }
}
