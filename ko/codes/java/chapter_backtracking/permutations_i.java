/**
 * File: permutations_i.java
 * Created Time: 2023-04-24
 * Author: krahets (krahets@163.com)
 */

package chapter_backtracking;

import java.util.*;

public class permutations_i {
    /* 백트래킹 알고리즘: 모든 순열 I */
    public static void backtrack(List<Integer> state, int[] choices, boolean[] selected, List<List<Integer>> res) {
        // 상태의 길이가 원소 개수와 같으면 해를 기록한다
        if (state.size() == choices.length) {
            res.add(new ArrayList<Integer>(state));
            return;
        }
        // 모든 선택지를 순회한다
        for (int i = 0; i < choices.length; i++) {
            int choice = choices[i];
            // 가지치기: 원소를 중복하여 선택할 수 없다
            if (!selected[i]) {
                // 시도: 선택하고 상태를 갱신한다
                selected[i] = true;
                state.add(choice);
                // 다음 선택을 진행한다
                backtrack(state, choices, selected, res);
                // 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
                selected[i] = false;
                state.remove(state.size() - 1);
            }
        }
    }

    /* 모든 순열 I */
    static List<List<Integer>> permutationsI(int[] nums) {
        List<List<Integer>> res = new ArrayList<List<Integer>>();
        backtrack(new ArrayList<Integer>(), nums, new boolean[nums.length], res);
        return res;
    }

    public static void main(String[] args) {
        int[] nums = { 1, 2, 3 };

        List<List<Integer>> res = permutationsI(nums);

        System.out.println("입력 배열 nums = " + Arrays.toString(nums));
        System.out.println("모든 순열 res = " + res);
    }
}
