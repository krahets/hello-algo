/**
 * File: subset_sum_i_naive.java
 * Created Time: 2023-06-21
 * Author: krahets (krahets@163.com)
 */

package chapter_backtracking;

import java.util.*;

public class subset_sum_i_naive {
    /* Backtracking algorithm: Subset Sum I */
    static void backtrack(List<Integer> state, int target, int total, int[] choices, List<List<Integer>> res) {
        // When the subset sum equals target, record the solution
        if (total == target) {
            res.add(new ArrayList<>(state));
            return;
        }
        // Traverse all choices
        for (int i = 0; i < choices.length; i++) {
            // Pruning: if the subset sum exceeds target, skip that choice
            if (total + choices[i] > target) {
                continue;
            }
            // Attempt: make a choice, update elements and total
            state.add(choices[i]);
            // Proceed to the next round of selection
            backtrack(state, target, total + choices[i], choices, res);
            // Retract: undo the choice, restore to the previous state
            state.remove(state.size() - 1);
        }
    }

    /* Solve Subset Sum I (including duplicate subsets) */
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
        System.out.println("All subsets summing to " + target + " res = " + res);
        System.out.println("The result of this method includes duplicate sets");
    }
}
