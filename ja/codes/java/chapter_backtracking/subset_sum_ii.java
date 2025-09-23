/**
 * File: subset_sum_ii.java
 * Created Time: 2023-06-21
 * Author: krahets (krahets@163.com)
 */

package chapter_backtracking;

import java.util.*;

public class subset_sum_ii {
    /* バックトラッキングアルゴリズム：部分集合和 II */
    static void backtrack(List<Integer> state, int target, int[] choices, int start, List<List<Integer>> res) {
        // 部分集合の和がtargetと等しいとき、解を記録
        if (target == 0) {
            res.add(new ArrayList<>(state));
            return;
        }
        // すべての選択肢を走査
        // 剪定二：startから走査を開始し、重複する部分集合の生成を回避
        // 剪定三：startから走査を開始し、同じ要素の繰り返し選択を回避
        for (int i = start; i < choices.length; i++) {
            // 剪定一：部分集合の和がtargetを超えた場合、即座にループを終了
            // 配列がソートされているため、後の要素はさらに大きく、部分集合の和は必ずtargetを超える
            if (target - choices[i] < 0) {
                break;
            }
            // 剪定四：要素が左の要素と等しい場合、検索ブランチの重複を示すのでスキップ
            if (i > start && choices[i] == choices[i - 1]) {
                continue;
            }
            // 試行：選択を行い、target、startを更新
            state.add(choices[i]);
            // 次のラウンドの選択に進む
            backtrack(state, target - choices[i], choices, i + 1, res);
            // 回退：選択を取り消し、前の状態に復元
            state.remove(state.size() - 1);
        }
    }

    /* 部分集合和 II を解く */
    static List<List<Integer>> subsetSumII(int[] nums, int target) {
        List<Integer> state = new ArrayList<>(); // 状態（部分集合）
        Arrays.sort(nums); // nums をソート
        int start = 0; // 走査の開始点
        List<List<Integer>> res = new ArrayList<>(); // 結果リスト（部分集合リスト）
        backtrack(state, target, nums, start, res);
        return res;
    }

    public static void main(String[] args) {
        int[] nums = { 4, 4, 5 };
        int target = 9;

        List<List<Integer>> res = subsetSumII(nums, target);

        System.out.println("入力配列 nums = " + Arrays.toString(nums) + ", target = " + target);
        System.out.println("和が " + target + " のすべての部分集合 res = " + res);
    }
}