/**
 * File: two_sum.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_searching;

import java.util.*;

public class two_sum {
    /* 방법 1: 완전 열거 */
    static int[] twoSumBruteForce(int[] nums, int target) {
        int size = nums.length;
        // 이중 반복문이며 시간 복잡도는 O(n^2)이다
        for (int i = 0; i < size - 1; i++) {
            for (int j = i + 1; j < size; j++) {
                if (nums[i] + nums[j] == target)
                    return new int[] { i, j };
            }
        }
        return new int[0];
    }

    /* 방법 2: 보조 해시 테이블 */
    static int[] twoSumHashTable(int[] nums, int target) {
        int size = nums.length;
        // 보조 해시 테이블의 공간 복잡도는 O(n)이다
        Map<Integer, Integer> dic = new HashMap<>();
        // 단일 반복문이며 시간 복잡도는 O(n)이다
        for (int i = 0; i < size; i++) {
            if (dic.containsKey(target - nums[i])) {
                return new int[] { dic.get(target - nums[i]), i };
            }
            dic.put(nums[i], i);
        }
        return new int[0];
    }

    public static void main(String[] args) {
        // ======= 테스트 사례 =======
        int[] nums = { 2, 7, 11, 15 };
        int target = 13;

        // ====== 실행 코드 ======
        // 방법 1
        int[] res = twoSumBruteForce(nums, target);
        System.out.println("방법 1 res = " + Arrays.toString(res));
        // 방법 2
        res = twoSumHashTable(nums, target);
        System.out.println("방법 2 res = " + Arrays.toString(res));
    }
}
