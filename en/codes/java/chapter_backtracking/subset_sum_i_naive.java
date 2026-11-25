/**
 * File: subset_sum_i_naive.java
 * Created Time: 2023-06-21
 * Author: krahets (krahets@163.com)
 */

package chapter_backtracking;

import java.util.*;

public class subset_sum_i_naive {
    /* Backtracking: subset sum I */
    static void backtrack(List<Integer> state, int target, int total, int[] choices, List<List<Integer>> res) {
        // Record a solution when the subset sums to target
        if (total == target) {
            res.add(new ArrayList<>(state));
            return;
        }
        // Try each choice
        for (int i = 0; i < choices.length; i++) {
            // Prune: skip choices that would take the subset sum over target
            if (total + choices[i] > target) {
                continue;
            }
            // Make a choice and update the running sum total
            state.add(choices[i]);
            // Make the next choice
            backtrack(state, target, total + choices[i], choices, res);
            // Backtrack: undo the choice to restore the previous state
            state.remove(state.size() - 1);
        }
    }

    /* Solve subset sum I (including duplicate subsets) */
    static List<List<Integer>> subsetSumINaive(int[] nums, int target) {
        List<Integer> state = new ArrayList<>(); // State (current subset)
        int total = 0; // Subset sum
        List<List<Integer>> res = new ArrayList<>(); // Results (list of subsets)
        backtrack(state, target, total, nums, res);
        return res;
    }

    public static void main(String[] args) {
        int[] nums = { 3, 4, 5 };
        int target = 9;

        List<List<Integer>> res = subsetSumINaive(nums, target);

        System.out.println("Input array nums =  " + Arrays.toString(nums) + ", target = " + target);
        System.out.println("Subsets that sum to  " + target + " : res =  " + res);
        System.out.println("This method returns duplicate subsets");
    }
}
