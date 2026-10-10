/**
 * File: subset_sum_i_naive.java
 * Created Time: 2023-06-21
 * Author: krahets (krahets@163.com)
 */

package chapter_backtracking;

import java.util.*;

public class subset_sum_i_naive {
    /* バックトラッキング：部分和 I */
    static void backtrack(List<Integer> state, int target, int total, int[] choices, List<List<Integer>> res) {
        // 部分集合の和が target に等しければ、解を記録
        if (total == target) {
            res.add(new ArrayList<>(state));
            return;
        }
        // すべての選択肢を走査
        for (int i = 0; i < choices.length; i++) {
            // 枝刈り：部分和が target を超える場合はその選択をスキップする
            if (total + choices[i] > target) {
                continue;
            }
            // 試行：選択を行い、要素と total を更新する
            state.add(choices[i]);
            // 次の選択へ進む
            backtrack(state, target, total + choices[i], choices, res);
            // バックトラック：選択を取り消し、前の状態に戻す
            state.remove(state.size() - 1);
        }
    }

    /* 部分和 I を解く（重複部分集合を含む） */
    static List<List<Integer>> subsetSumINaive(int[] nums, int target) {
        List<Integer> state = new ArrayList<>(); // 状態（部分集合）
        int total = 0; // 部分和
        List<List<Integer>> res = new ArrayList<>(); // 結果リスト（部分集合のリスト）
        backtrack(state, target, total, nums, res);
        return res;
    }

    public static void main(String[] args) {
        int[] nums = { 3, 4, 5 };
        int target = 9;

        List<List<Integer>> res = subsetSumINaive(nums, target);

        System.out.println("入力配列 nums = " + Arrays.toString(nums) + ", target = " + target);
        System.out.println("和が " + target + " に等しいすべての部分集合 res = " + res);
        System.out.println("注意: この方法の出力結果には重複した集合が含まれます");
    }
}
