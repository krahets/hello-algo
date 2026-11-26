/**
 * File: permutations_i.java
 * Created Time: 2023-04-24
 * Author: krahets (krahets@163.com)
 */

package chapter_backtracking;

import java.util.*;

public class permutations_i {
    /* バックトラッキングによる全順列 I */
    public static void backtrack(List<Integer> state, int[] choices, boolean[] selected, List<List<Integer>> res) {
        // 状態の長さが要素数に達したら解を記録する
        if (state.size() == choices.length) {
            res.add(new ArrayList<Integer>(state));
            return;
        }
        // すべての選択肢を調べる
        for (int i = 0; i < choices.length; i++) {
            int choice = choices[i];
            // 枝刈り：同じ要素は二度選ばない
            if (!selected[i]) {
                // 試行：選択して状態を更新する
                selected[i] = true;
                state.add(choice);
                // 次の選択に進む
                backtrack(state, choices, selected, res);
                // 後戻り：選択を取り消し、元の状態に戻す
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
