/**
 * File: subset_sum_i.java
 * Created Time: 2023-06-21
 * Author: krahets (krahets@163.com)
 */

package chapter_backtracking;

import java.util.*;

public class subset_sum_i {
    /* 回溯演算法：子集和 I */
    static void backtrack(List<Integer> state, int target, int[] choices, int start, List<List<Integer>> res) {
        // 子集總和達到目標時，記錄此解
        if (target == 0) {
            res.add(new ArrayList<>(state));
            return;
        }
        // 逐一檢查所有選項
        // 剪枝二：從 start 開始走訪，避免產生重複子集
        for (int i = start; i < choices.length; i++) {
            // 剪枝一：若候選值超過剩餘目標值 target，結束迴圈
            // 陣列已排序，後面的元素更大，也一定超過剩餘目標值 target
            if (target - choices[i] < 0) {
                break;
            }
            // 嘗試：做出選擇，更新 target 和 start
            state.add(choices[i]);
            // 進入下一輪選擇
            backtrack(state, target - choices[i], choices, i, res);
            // 回溯：撤銷選擇，還原先前的狀態
            state.remove(state.size() - 1);
        }
    }

    /* 求解子集和 I */
    static List<List<Integer>> subsetSumI(int[] nums, int target) {
        List<Integer> state = new ArrayList<>(); // 狀態（子集）
        Arrays.sort(nums); // 將 nums 排序
        int start = 0; // 走訪的起點
        List<List<Integer>> res = new ArrayList<>(); // 結果串列（子集串列）
        backtrack(state, target, nums, start, res);
        return res;
    }

    public static void main(String[] args) {
        int[] nums = { 3, 4, 5 };
        int target = 9;

        List<List<Integer>> res = subsetSumI(nums, target);

        System.out.println("輸入陣列 nums = " + Arrays.toString(nums) + ", target = " + target);
        System.out.println("所有總和等於 " + target + " 的子集 res = " + res);
    }
}
