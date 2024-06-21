/**
 * File: subset_sum_i_naive.java
 * Created Time: 2023-06-21
 * Author: krahets (krahets@163.com)
 */

package chapter_backtracking;

import java.util.*;

public class subset_sum_i_naive {
    /* 回溯演算法：子集和 I */
    static void backtrack(List<Integer> state, int target, int total, int[] choices, List<List<Integer>> res) {
        // 子集和等於 target 時，記錄解
        if (total == target) {
            res.add(new ArrayList<>(state));
            return;
        }
        // 走訪所有選擇
        for (int i = 0; i < choices.length; i++) {
            // 剪枝：若子集和超過 target ，則跳過該選擇
            if (total + choices[i] > target) {
                continue;
            }
            // 嘗試：做出選擇，更新元素和 total
            state.add(choices[i]);
            // 進行下一輪選擇
            backtrack(state, target, total + choices[i], choices, res);
            // 回退：撤銷選擇，恢復到之前的狀態
            state.remove(state.size() - 1);
        }
    }

    /* 求解子集和 I（包含重複子集） */
    static List<List<Integer>> subsetSumINaive(int[] nums, int target) {
        List<Integer> state = new ArrayList<>(); // 狀態（子集）
        int total = 0; // 子集和
        List<List<Integer>> res = new ArrayList<>(); // 結果串列（子集串列）
        backtrack(state, target, total, nums, res);
        return res;
    }

    public static void main(String[] args) {
        int[] nums = { 3, 4, 5 };
        int target = 9;

        List<List<Integer>> res = subsetSumINaive(nums, target);

        System.out.println("輸入陣列 nums = " + Arrays.toString(nums) + ", target = " + target);
        System.out.println("所有和等於 " + target + " 的子集 res = " + res);
        System.out.println("請注意，該方法輸出的結果包含重複集合");
    }
}
