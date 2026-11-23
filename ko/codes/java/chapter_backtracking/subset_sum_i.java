/**
 * File: subset_sum_i.java
 * Created Time: 2023-06-21
 * Author: krahets (krahets@163.com)
 */

package chapter_backtracking;

import java.util.*;

public class subset_sum_i {
    /* 백트래킹 알고리즘: 부분 집합 합 I */
    static void backtrack(List<Integer> state, int target, int[] choices, int start, List<List<Integer>> res) {
        // 부분 집합의 합이 target과 같으면 해를 기록한다
        if (target == 0) {
            res.add(new ArrayList<>(state));
            return;
        }
        // 모든 선택지를 순회한다
        // 가지치기 2: start부터 순회하여 중복 부분 집합 생성을 방지한다
        for (int i = start; i < choices.length; i++) {
            // 가지치기 1: 부분 집합의 합이 target을 초과하면 즉시 반복문을 종료한다
            // 배열이 정렬되어 있어 뒤의 원소가 더 크므로, 부분 집합의 합이 반드시 target을 초과하기 때문이다
            if (target - choices[i] < 0) {
                break;
            }
            // 시도: 선택하고 target, start를 갱신한다
            state.add(choices[i]);
            // 다음 선택을 진행한다
            backtrack(state, target - choices[i], choices, i, res);
            // 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
            state.remove(state.size() - 1);
        }
    }

    /* 부분 집합 합 I 풀기 */
    static List<List<Integer>> subsetSumI(int[] nums, int target) {
        List<Integer> state = new ArrayList<>(); // 상태(부분 집합)
        Arrays.sort(nums); // nums를 정렬한다
        int start = 0; // 순회 시작 위치
        List<List<Integer>> res = new ArrayList<>(); // 결과 리스트(부분 집합 리스트)
        backtrack(state, target, nums, start, res);
        return res;
    }

    public static void main(String[] args) {
        int[] nums = { 3, 4, 5 };
        int target = 9;

        List<List<Integer>> res = subsetSumI(nums, target);

        System.out.println("입력 배열 nums = " + Arrays.toString(nums) + ", target = " + target);
        System.out.println("부분 집합의 합: " + target + " ; 해당하는 모든 부분 집합 res = " + res);
    }
}
