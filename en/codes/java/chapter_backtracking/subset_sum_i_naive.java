/**
 * File: subset_sum_i_naive.java
 * Created Time: 2023-06-21
 * Author: krahets (krahets@163.com)
 */

package chapter_backtracking;

import java.util.*;

public class subset_sum_i_naive {
    /* Backtracking algorithm: Subset sum I */
    static void backtrack(List<Integer> state, int target, int total, int[] choices, List<List<Integer>> res) {
        // When the subset sum equals target, record the solution
        if (total == target) {
            res.add(new ArrayList<>(state));
            return;
        }
        // Traverse all choices
        for (int i = 0; i < choices.length; i++) {
            // Pruning: if the subset sum exceeds target, skip this choice
            if (total + choices[i] > target) {
                continue;
            }
            // Attempt: make choice, update element sum total
            state.add(choices[i]);
            // Proceed to the next round of selection
            backtrack(state, target, total + choices[i], choices, res);
            // Backtrack: undo choice, restore to previous state
            state.remove(state.size() - 1);
        }
    }

    /* Solve subset sum I (including duplicate subsets) */
    static List<List<Integer>> subsetSumINaive(int[] nums, int target) {
        List<Integer> state = new ArrayList<>(); // State (subset)
        int total = 0; // Subset sum
        List<List<Integer>> res = new ArrayList<>(); // Result list (subset list)
        backtrack(state, target, total, nums, res);
        return res;
    }

    public static void main(String[] args) {
        int[] nums = { 3, 4, 5 };
        int target = 9;

        List<List<Integer>> res = subsetSumINaive(nums, target);

        System.out.println("Input array nums = " + Arrays.toString(nums) + ", target = " + target);
        System.out.println("All subsets with sum equal to " + target + " are res = " + res);
        System.out.println("Please note that this method outputs results containing duplicate sets");
    }
}
