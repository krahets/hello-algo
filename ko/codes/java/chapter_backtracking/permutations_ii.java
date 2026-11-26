/**
 * File: permutations_ii.java
 * Created Time: 2023-04-24
 * Author: krahets (krahets@163.com)
 */

package chapter_backtracking;

import java.util.*;

public class permutations_ii {
    /* 백트래킹: 순열 II */
    static void backtrack(List<Integer> state, int[] choices, boolean[] selected, List<List<Integer>> res) {
        // 상태의 길이가 원소 개수와 같으면 해를 기록한다
        if (state.size() == choices.length) {
            res.add(new ArrayList<Integer>(state));
            return;
        }
        // 모든 선택지를 순회한다
        Set<Integer> duplicated = new HashSet<Integer>();
        for (int i = 0; i < choices.length; i++) {
            int choice = choices[i];
            // 가지치기: 이미 선택한 원소를 다시 고르거나 같은 층에서 값이 같은 원소를 다시 고르지 않는다
            if (!selected[i] && !duplicated.contains(choice)) {
                // 시도: 하나를 선택하고 상태를 갱신한다
                duplicated.add(choice); // 선택한 원소의 값을 기록한다
                selected[i] = true;
                state.add(choice);
                // 다음 선택을 진행한다
                backtrack(state, choices, selected, res);
                // 되돌리기: 선택을 취소하고 이전 상태를 복원한다
                selected[i] = false;
                state.remove(state.size() - 1);
            }
        }
    }

    /* 순열 II */
    static List<List<Integer>> permutationsII(int[] nums) {
        List<List<Integer>> res = new ArrayList<List<Integer>>();
        backtrack(new ArrayList<Integer>(), nums, new boolean[nums.length], res);
        return res;
    }

    public static void main(String[] args) {
        int[] nums = { 1, 2, 2 };

        List<List<Integer>> res = permutationsII(nums);

        System.out.println("입력 배열 nums = " + Arrays.toString(nums));
        System.out.println("모든 순열 res = " + res);
    }
}
