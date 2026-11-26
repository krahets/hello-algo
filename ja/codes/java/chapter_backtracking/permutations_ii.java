/**
 * File: permutations_ii.java
 * Created Time: 2023-04-24
 * Author: krahets (krahets@163.com)
 */

package chapter_backtracking;

import java.util.*;

public class permutations_ii {
    /* バックトラッキングによる全順列 II */
    static void backtrack(List<Integer> state, int[] choices, boolean[] selected, List<List<Integer>> res) {
        // 状態の長さが要素数に達したら解を記録する
        if (state.size() == choices.length) {
            res.add(new ArrayList<Integer>(state));
            return;
        }
        // すべての選択肢を調べる
        Set<Integer> duplicated = new HashSet<Integer>();
        for (int i = 0; i < choices.length; i++) {
            int choice = choices[i];
            // 枝刈り：同じ要素は二度選ばず、この段階で同じ値の要素も繰り返し試さない
            if (!selected[i] && !duplicated.contains(choice)) {
                // 試行：選択して状態を更新する
                duplicated.add(choice); // 選んだ要素の値を記録する
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

    /* 全順列 II */
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
