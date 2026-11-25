/**
 * File: permutations_ii.java
 * Created Time: 2023-04-24
 * Author: krahets (krahets@163.com)
 */

package chapter_backtracking;

import java.util.*;

public class permutations_ii {
    /* 回溯演算法：全排列 II */
    static void backtrack(List<Integer> state, int[] choices, boolean[] selected, List<List<Integer>> res) {
        // 當狀態長度等於元素個數時，記錄此解
        if (state.size() == choices.length) {
            res.add(new ArrayList<Integer>(state));
            return;
        }
        // 逐一檢查所有選項
        Set<Integer> duplicated = new HashSet<Integer>();
        for (int i = 0; i < choices.length; i++) {
            int choice = choices[i];
            // 剪枝：不可重複選取同一個元素，同一層也不可重複選取相同的值
            if (!selected[i] && !duplicated.contains(choice)) {
                // 嘗試：做出選擇並更新狀態
                duplicated.add(choice); // 記錄已選過的元素值
                selected[i] = true;
                state.add(choice);
                // 進入下一輪選擇
                backtrack(state, choices, selected, res);
                // 回溯：撤銷選擇，還原先前的狀態
                selected[i] = false;
                state.remove(state.size() - 1);
            }
        }
    }

    /* 全排列 II */
    static List<List<Integer>> permutationsII(int[] nums) {
        List<List<Integer>> res = new ArrayList<List<Integer>>();
        backtrack(new ArrayList<Integer>(), nums, new boolean[nums.length], res);
        return res;
    }

    public static void main(String[] args) {
        int[] nums = { 1, 2, 2 };

        List<List<Integer>> res = permutationsII(nums);

        System.out.println("輸入陣列 nums = " + Arrays.toString(nums));
        System.out.println("所有排列 res = " + res);
    }
}
