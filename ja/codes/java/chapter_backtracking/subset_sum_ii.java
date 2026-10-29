/**
 * File: subset_sum_ii.java
 * Created Time: 2023-06-21
 * Author: krahets (krahets@163.com)
 */

package chapter_backtracking;

import java.util.*;

public class subset_sum_ii {
    /* バックトラッキング：部分集合和 II */
    static void backtrack(List<Integer> state, int target, int[] choices, int start, List<List<Integer>> res) {
        // 部分集合の和が target と等しくなったら、解を記録する
        if (target == 0) {
            res.add(new ArrayList<>(state));
            return;
        }
        // すべての選択肢を走査する
        // 枝刈り 2：start から走査を始め、重複した部分集合の生成を避ける
        // 枝刈り 3：start から走査を始め、同じ要素の再選択を避ける
        for (int i = start; i < choices.length; i++) {
            // 枝刈り 1：部分集合の和が target を超えたら、直ちにループを終了する
            // 配列はソート済みで後ろの要素ほど大きいため、部分集合の和が必ず target を超えるからである
            if (target - choices[i] < 0) {
                break;
            }
            // 枝刈り 4：この要素が左隣の要素と等しい場合、探索の分岐が重複するため、直ちにスキップする
            if (i > start && choices[i] == choices[i - 1]) {
                continue;
            }
            // 試行：選択を行い、target, start を更新する
            state.add(choices[i]);
            // 次の選択に進む
            backtrack(state, target - choices[i], choices, i + 1, res);
            // 復元：選択を取り消し、以前の状態に戻す
            state.remove(state.size() - 1);
        }
    }

    /* 部分集合和 II を解く */
    static List<List<Integer>> subsetSumII(int[] nums, int target) {
        List<Integer> state = new ArrayList<>(); // 状態（部分集合）
        Arrays.sort(nums); // nums をソートする
        int start = 0; // 走査の開始位置
        List<List<Integer>> res = new ArrayList<>(); // 結果リスト（部分集合のリスト）
        backtrack(state, target, nums, start, res);
        return res;
    }

    public static void main(String[] args) {
        int[] nums = { 4, 4, 5 };
        int target = 9;

        List<List<Integer>> res = subsetSumII(nums, target);

        System.out.println("入力配列 nums = " + Arrays.toString(nums) + ", target = " + target);
        System.out.println("和が " + target + " になるすべての部分集合 res = " + res);
    }
}
