/**
 * File: subset_sum_i_naive.java
 * Created Time: 2023-06-21
 * Author: krahets (krahets@163.com)
 */

package chapter_backtracking;

import java.util.*;

public class subset_sum_i_naive {
    /* 백트래킹 알고리즘: 부분 집합 합 I */
    static void backtrack(List<Integer> state, int target, int total, int[] choices, List<List<Integer>> res) {
        // 부분 집합의 합이 target과 같으면 해를 기록한다
        if (total == target) {
            res.add(new ArrayList<>(state));
            return;
        }
        // 모든 선택지를 순회한다
        for (int i = 0; i < choices.length; i++) {
            // 가지치기: 부분 집합의 합이 target을 초과하면 해당 선택을 건너뛴다
            if (total + choices[i] > target) {
                continue;
            }
            // 시도: 선택하고 원소의 합 total을 갱신한다
            state.add(choices[i]);
            // 다음 선택을 진행한다
            backtrack(state, target, total + choices[i], choices, res);
            // 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
            state.remove(state.size() - 1);
        }
    }

    /* 부분 집합 합 I 풀기(중복 부분 집합 포함) */
    static List<List<Integer>> subsetSumINaive(int[] nums, int target) {
        List<Integer> state = new ArrayList<>(); // 상태(부분 집합)
        int total = 0; // 부분 집합의 합
        List<List<Integer>> res = new ArrayList<>(); // 결과 리스트(부분 집합 리스트)
        backtrack(state, target, total, nums, res);
        return res;
    }

    public static void main(String[] args) {
        int[] nums = { 3, 4, 5 };
        int target = 9;

        List<List<Integer>> res = subsetSumINaive(nums, target);

        System.out.println("입력 배열 nums = " + Arrays.toString(nums) + ", target = " + target);
        System.out.println("부분 집합의 합: " + target + " ; 해당하는 모든 부분 집합 res = " + res);
        System.out.println("이 방법의 출력 결과에는 중복 집합이 포함된다");
    }
}
