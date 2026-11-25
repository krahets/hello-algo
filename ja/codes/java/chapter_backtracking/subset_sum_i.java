/**
 * File: subset_sum_i.java
 * Created Time: 2023-06-21
 * Author: krahets (krahets@163.com)
 */

package chapter_backtracking;

import java.util.*;

public class subset_sum_i {
    /* バックトラッキングによる部分和問題 I */
    static void backtrack(List<Integer> state, int target, int[] choices, int start, List<List<Integer>> res) {
        // 部分集合の要素の和が target に等しくなったら解を記録する
        if (target == 0) {
            res.add(new ArrayList<>(state));
            return;
        }
        // すべての選択肢を調べる
        // 枝刈り 2：start から調べて部分集合の重複を防ぐ
        for (int i = start; i < choices.length; i++) {
            // 枝刈り 1：部分集合の要素の和が target を超えたらループを終了する
            // 配列はソート済みで、後の要素ほど大きく、和は必ず target を超えるため
            if (target - choices[i] < 0) {
                break;
            }
            // 試行：選択して target と start を更新する
            state.add(choices[i]);
            // 次の選択に進む
            backtrack(state, target - choices[i], choices, i, res);
            // 後戻り：選択を取り消し、元の状態に戻す
            state.remove(state.size() - 1);
        }
    }

    /* 部分和問題 I を解く */
    static List<List<Integer>> subsetSumI(int[] nums, int target) {
        List<Integer> state = new ArrayList<>(); // 状態（部分集合）
        Arrays.sort(nums); // nums をソートする
        int start = 0; // 走査の開始位置
        List<List<Integer>> res = new ArrayList<>(); // 結果のリスト（部分集合のリスト）
        backtrack(state, target, nums, start, res);
        return res;
    }

    public static void main(String[] args) {
        int[] nums = { 3, 4, 5 };
        int target = 9;

        List<List<Integer>> res = subsetSumI(nums, target);

        System.out.println("入力配列 nums = " + Arrays.toString(nums) + ", target = " + target);
        System.out.println("要素の和が " + target + " となるすべての部分集合 res = " + res);
    }
}
