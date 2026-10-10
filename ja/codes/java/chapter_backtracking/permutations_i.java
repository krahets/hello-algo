/**
 * File: permutations_i.java
 * Created Time: 2023-04-24
 * Author: krahets (krahets@163.com)
 */

package chapter_backtracking;

import java.util.*;

public class permutations_i {
    /* バックトラッキング：順列 I */
    public static void backtrack(List<Integer> state, int[] choices, boolean[] selected, List<List<Integer>> res) {
        // 状態の長さが要素数に等しければ、解を記録
        if (state.size() == choices.length) {
            res.add(new ArrayList<Integer>(state));
            return;
        }
        // すべての選択肢を走査
        for (int i = 0; i < choices.length; i++) {
            int choice = choices[i];
            // 枝刈り：要素の重複選択を許可しない
            if (!selected[i]) {
                // 試行: 選択を行い、状態を更新
                selected[i] = true;
                state.add(choice);
                // 次の選択へ進む
                backtrack(state, choices, selected, res);
                // バックトラック：選択を取り消し、前の状態に戻す
                selected[i] = false;
                state.remove(state.size() - 1);
            }
        }
    }

    /* 全順列 I */
    static List<List<Integer>> permutationsI(int[] nums) {
        List<List<Integer>> res = new ArrayList<List<Integer>>();
        backtrack(new ArrayList<Integer>(), nums, new boolean[nums.length], res);
        return res;
    }

    public static void main(String[] args) {
        int[] nums = { 1, 2, 3 };

        List<List<Integer>> res = permutationsI(nums);

        System.out.println("入力配列 nums = " + Arrays.toString(nums));
        System.out.println("すべての順列 res = " + res);
    }
}
