/**
 * File: subset_sum_i_naive.java
 * Created Time: 2023-06-21
 * Author: krahets (krahets@163.com)
 */

package chapter_backtracking;

import java.util.*;

public class subset_sum_i_naive {
    /* バックトラッキングによる部分和問題 I */
    static void backtrack(List<Integer> state, int target, int total, int[] choices, List<List<Integer>> res) {
        // 部分集合の要素の和が target に等しくなったら解を記録する
        if (total == target) {
            res.add(new ArrayList<>(state));
            return;
        }
        // すべての選択肢を調べる
        for (int i = 0; i < choices.length; i++) {
            // 枝刈り：部分集合の要素の和が target を超えるなら、その選択を飛ばす
            if (total + choices[i] > target) {
                continue;
            }
            // 試行：選択して要素の和 total を更新する
            state.add(choices[i]);
            // 次の選択に進む
            backtrack(state, target, total + choices[i], choices, res);
            // 後戻り：選択を取り消し、元の状態に戻す
            state.remove(state.size() - 1);
        }
    }

    /* 部分和問題 I を解く（重複する部分集合を含む） */
    static List<List<Integer>> subsetSumINaive(int[] nums, int target) {
        List<Integer> state = new ArrayList<>(); // 状態（部分集合）
        int total = 0; // 部分和
        List<List<Integer>> res = new ArrayList<>(); // 結果のリスト（部分集合のリスト）
        backtrack(state, target, total, nums, res);
        return res;
    }

    public static void main(String[] args) {
        int[] nums = { 3, 4, 5 };
        int target = 9;

        List<List<Integer>> res = subsetSumINaive(nums, target);

        System.out.println("入力配列 nums = " + Arrays.toString(nums) + ", target = " + target);
        System.out.println("要素の和が " + target + " となるすべての部分集合 res = " + res);
        System.out.println("この方法の出力には重複する集合が含まれる点に注意");
    }
}
