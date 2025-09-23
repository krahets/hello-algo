/**
 * File: subset_sum_i_naive.java
 * Created Time: 2023-06-21
 * Author: krahets (krahets@163.com)
 */

package chapter_backtracking;

import java.util.*;

public class subset_sum_i_naive {
    /* バックトラッキングアルゴリズム：部分集合和 I */
    static void backtrack(List<Integer> state, int target, int total, int[] choices, List<List<Integer>> res) {
        // 部分集合の和がtargetと等しいとき、解を記録
        if (total == target) {
            res.add(new ArrayList<>(state));
            return;
        }
        // すべての選択肢を走査
        for (int i = 0; i < choices.length; i++) {
            // 剪定：部分集合の和がtargetを超えた場合、その選択をスキップ
            if (total + choices[i] > target) {
                continue;
            }
            // 試行：選択を行い、要素とtotalを更新
            state.add(choices[i]);
            // 次のラウンドの選択に進む
            backtrack(state, target, total + choices[i], choices, res);
            // 回退：選択を取り消し、前の状態に復元
            state.remove(state.size() - 1);
        }
    }

    /* 部分集合和 I を解く（重複する部分集合を含む） */
    static List<List<Integer>> subsetSumINaive(int[] nums, int target) {
        List<Integer> state = new ArrayList<>(); // 状態（部分集合）
        int total = 0; // 部分集合の和
        List<List<Integer>> res = new ArrayList<>(); // 結果リスト（部分集合リスト）
        backtrack(state, target, total, nums, res);
        return res;
    }

    public static void main(String[] args) {
        int[] nums = { 3, 4, 5 };
        int target = 9;

        List<List<Integer>> res = subsetSumINaive(nums, target);

        System.out.println("入力配列 nums = " + Arrays.toString(nums) + ", target = " + target);
        System.out.println("和が " + target + " のすべての部分集合 res = " + res);
        System.out.println("この方法の結果には重複する集合が含まれています");
    }
}