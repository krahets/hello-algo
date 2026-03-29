/**
 * File: subset_sum_ii.java
 * Created Time: 2023-06-21
 * Author: krahets (krahets@163.com)
 */

package chapter_backtracking;

import java.util.*;

public class subset_sum_ii {
    /* バックトラッキング：部分和 II */
    static void backtrack(List<Integer> state, int target, int[] choices, int start, List<List<Integer>> res) {
        // 部分集合の和が target に等しければ、解を記録
        if (target == 0) {
            res.add(new ArrayList<>(state));
            return;
        }
        // すべての選択肢を走査
        // 枝刈り 2: start から走査し、重複する部分集合の生成を避ける
        // 枝刈り 3: start から走査し、同じ要素の重複選択を避ける
        for (int i = start; i < choices.length; i++) {
            // 枝刈り1：部分集合の和が target を超えたら、直ちにループを終了する
            // 配列はソート済みで後続要素のほうが大きく、部分集合の和は必ず target を超えるため
            if (target - choices[i] < 0) {
                break;
            }
            // 枝刈り4：この要素が左隣の要素と等しければ、その探索分岐は重複しているためスキップする
            if (i > start && choices[i] == choices[i - 1]) {
                continue;
            }
            // 試す：選択を行い、target と start を更新
            state.add(choices[i]);
            // 次の選択へ進む
            backtrack(state, target - choices[i], choices, i + 1, res);
            // バックトラック：選択を取り消し、前の状態に戻す
            state.remove(state.size() - 1);
        }
    }

    /* 部分和 II を解く */
    static List<List<Integer>> subsetSumII(int[] nums, int target) {
        List<Integer> state = new ArrayList<>(); // 状態（部分集合）
        Arrays.sort(nums); // nums をソート
        int start = 0; // 開始点を走査
        List<List<Integer>> res = new ArrayList<>(); // 結果リスト（部分集合のリスト）
        backtrack(state, target, nums, start, res);
        return res;
    }

    public static void main(String[] args) {
        int[] nums = { 4, 4, 5 };
        int target = 9;

        List<List<Integer>> res = subsetSumII(nums, target);

        System.out.println("入力配列 nums = " + Arrays.toString(nums) + ", target = " + target);
        System.out.println("和が " + target + " に等しいすべての部分集合 res = " + res);
    }
}
