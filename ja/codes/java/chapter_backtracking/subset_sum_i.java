/**
 * File: subset_sum_i.java
 * Created Time: 2023-06-21
 * Author: krahets (krahets@163.com)
 */

package chapter_backtracking;

import java.util.*;

public class subset_sum_i {
    /* バックトラッキング：部分和 I */
    static void backtrack(List<Integer> state, int target, int[] choices, int start, List<List<Integer>> res) {
        // 部分集合の和が target に等しければ、解を記録
        if (target == 0) {
            res.add(new ArrayList<>(state));
            return;
        }
        // すべての選択肢を走査
        // 枝刈り 2: start から走査し、重複する部分集合の生成を避ける
        for (int i = start; i < choices.length; i++) {
            // 枝刈り1：部分集合の和が target を超えたら、直ちにループを終了する
            // 配列はソート済みで後続要素のほうが大きく、部分集合の和は必ず target を超えるため
            if (target - choices[i] < 0) {
                break;
            }
            // 試す：選択を行い、target と start を更新
            state.add(choices[i]);
            // 次の選択へ進む
            backtrack(state, target - choices[i], choices, i, res);
            // バックトラック：選択を取り消し、前の状態に戻す
            state.remove(state.size() - 1);
        }
    }

    /* 部分和 I を解く */
    static List<List<Integer>> subsetSumI(int[] nums, int target) {
        List<Integer> state = new ArrayList<>(); // 状態（部分集合）
        Arrays.sort(nums); // nums をソート
        int start = 0; // 開始点を走査
        List<List<Integer>> res = new ArrayList<>(); // 結果リスト（部分集合のリスト）
        backtrack(state, target, nums, start, res);
        return res;
    }

    public static void main(String[] args) {
        int[] nums = { 3, 4, 5 };
        int target = 9;

        List<List<Integer>> res = subsetSumI(nums, target);

        System.out.println("入力配列 nums = " + Arrays.toString(nums) + ", target = " + target);
        System.out.println("和が " + target + " に等しいすべての部分集合 res = " + res);
    }
}
