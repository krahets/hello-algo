/**
 * File: subset_sum_ii.java
 * Created Time: 2023-06-21
 * Author: krahets (krahets@163.com)
 */

package chapter_backtracking;

import java.util.*;

public class subset_sum_ii {
    /* Backtracking: subset sum II */
    static void backtrack(List<Integer> state, int target, int[] choices, int start, List<List<Integer>> res) {
        // Record a solution when the remaining target is zero, so the subset sums to the original target
        if (target == 0) {
            res.add(new ArrayList<>(state));
            return;
        }
        // Iterate over all choices
        // Pruning 2: iterate from start to avoid generating duplicate subsets
        // Pruning 3: iterate from start to avoid choosing the same element again
        for (int i = start; i < choices.length; i++) {
            // Pruning 1: exit the loop if the next element exceeds the remaining target
            // The array is sorted, so later elements are at least as large and also exceed the remaining target
            if (target - choices[i] < 0) {
                break;
            }
            // Pruning 4: if this element equals its left neighbor at the same search depth, the branch is a duplicate; skip it
            if (i > start && choices[i] == choices[i - 1]) {
                continue;
            }
            // Try: make a choice and update target and start
            state.add(choices[i]);
            // Proceed to the next choice
            backtrack(state, target - choices[i], choices, i + 1, res);
            // Backtrack: undo the choice and restore the previous state
            state.remove(state.size() - 1);
        }
    }

    /* Solve subset sum II */
    static List<List<Integer>> subsetSumII(int[] nums, int target) {
        List<Integer> state = new ArrayList<>(); // State (subset)
        Arrays.sort(nums); // Sort nums
        int start = 0; // Starting index for iteration
        List<List<Integer>> res = new ArrayList<>(); // Result list (list of subsets)
        backtrack(state, target, nums, start, res);
        return res;
    }

    public static void main(String[] args) {
        int[] nums = { 4, 4, 5 };
        int target = 9;

        List<List<Integer>> res = subsetSumII(nums, target);

        System.out.println("Input array nums = " + Arrays.toString(nums) + ", target = " + target);
        System.out.println("All subsets with sum " + target + " : res = " + res);
    }
}
