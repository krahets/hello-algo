/**
 * File: permutations_ii.java
 * Created Time: 2023-04-24
 * Author: krahets (krahets@163.com)
 */

package chapter_backtracking;

import java.util.*;

public class permutations_ii {
    /* バックトラッキング：すべての順列 II */
    static void backtrack(List<Integer> state, int[] choices, boolean[] selected, List<List<Integer>> res) {
        // 状態の長さが要素数と等しくなったら、解を記録する
        if (state.size() == choices.length) {
            res.add(new ArrayList<Integer>(state));
            return;
        }
        // すべての選択肢を走査する
        Set<Integer> duplicated = new HashSet<Integer>();
        for (int i = 0; i < choices.length; i++) {
            int choice = choices[i];
            // 枝刈り：同じ要素の再選択も、等しい値を持つ要素の重複選択も許可しない
            if (!selected[i] && !duplicated.contains(choice)) {
                // 試行：選択を行い、状態を更新する
                duplicated.add(choice); // 選択済みの要素の値を記録する
                selected[i] = true;
                state.add(choice);
                // 次の選択に進む
                backtrack(state, choices, selected, res);
                // 復元：選択を取り消し、以前の状態に戻す
                selected[i] = false;
                state.remove(state.size() - 1);
            }
        }
    }

    /* すべての順列 II */
    static List<List<Integer>> permutationsII(int[] nums) {
        List<List<Integer>> res = new ArrayList<List<Integer>>();
        backtrack(new ArrayList<Integer>(), nums, new boolean[nums.length], res);
        return res;
    }

    public static void main(String[] args) {
        int[] nums = { 1, 2, 2 };

        List<List<Integer>> res = permutationsII(nums);

        System.out.println("入力配列 nums = " + Arrays.toString(nums));
        System.out.println("すべての順列 res = " + res);
    }
}
