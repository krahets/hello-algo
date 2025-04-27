/**
 * File: permutations_i.java
 * Created Time: 2023-04-24
 * Author: krahets (krahets@163.com)
 */

package chapter_backtracking;

import java.util.*;

public class permutations_i {
    /* 回溯演算法：全排列 I */
    public static void backtrack(List<Integer> state, int[] choices, boolean[] selected, List<List<Integer>> res) {
        // 當狀態長度等於元素數量時，記錄解
        if (state.size() == choices.length) {
            res.add(new ArrayList<Integer>(state));
            return;
        }
        // 走訪所有選擇
        for (int i = 0; i < choices.length; i++) {
            int choice = choices[i];
            // 剪枝：不允許重複選擇元素
            if (!selected[i]) {
                // 嘗試：做出選擇，更新狀態
                selected[i] = true;
                state.add(choice);
                // 進行下一輪選擇
                backtrack(state, choices, selected, res);
                // 回退：撤銷選擇，恢復到之前的狀態
                selected[i] = false;
                state.remove(state.size() - 1);
            }
        }
    }

    /* 全排列 I */
    static List<List<Integer>> permutationsI(int[] nums) {
        List<List<Integer>> res = new ArrayList<List<Integer>>();
        backtrack(new ArrayList<Integer>(), nums, new boolean[nums.length], res);
        return res;
    }

    public static void main(String[] args) {
        int[] nums = { 1, 2, 3 };

        List<List<Integer>> res = permutationsI(nums);

        System.out.println("輸入陣列 nums = " + Arrays.toString(nums));
        System.out.println("所有排列 res = " + res);
    }
}
