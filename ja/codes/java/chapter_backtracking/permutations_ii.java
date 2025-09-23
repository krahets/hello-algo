/**
 * File: permutations_ii.java
 * Created Time: 2023-04-24
 * Author: krahets (krahets@163.com)
 */

package chapter_backtracking;

import java.util.*;

public class permutations_ii {
    /* バックトラッキングアルゴリズム：順列 II */
    static void backtrack(List<Integer> state, int[] choices, boolean[] selected, List<List<Integer>> res) {
        // 状態の長さが要素数と等しくなったら、解を記録
        if (state.size() == choices.length) {
            res.add(new ArrayList<Integer>(state));
            return;
        }
        // すべての選択肢を走査
        Set<Integer> duplicated = new HashSet<Integer>();
        for (int i = 0; i < choices.length; i++) {
            int choice = choices[i];
            // 剪定：要素の重複選択を許可せず、等しい要素の重複選択も許可しない
            if (!selected[i] && !duplicated.contains(choice)) {
                // 試行：選択を行い、状態を更新
                duplicated.add(choice); // 選択された要素値を記録
                selected[i] = true;
                state.add(choice);
                // 次のラウンドの選択に進む
                backtrack(state, choices, selected, res);
                // 回退：選択を取り消し、前の状態に復元
                selected[i] = false;
                state.remove(state.size() - 1);
            }
        }
    }

    /* 順列 II */
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