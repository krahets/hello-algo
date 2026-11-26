/**
 * File: subset_sum_i.java
 * Created Time: 2023-06-21
 * Author: krahets (krahets@163.com)
 */

package chapter_backtracking;

import java.util.*;

public class subset_sum_i {
    /* Backtracking: subset sum I */
    static void backtrack(List<Integer> state, int target, int[] choices, int start, List<List<Integer>> res) {
        // Record a solution when the subset sums to target
        if (target == 0) {
            res.add(new ArrayList<>(state));
            return;
        }
        // Try each choice
        // Pruning rule 2: start at start to avoid duplicate subsets
        for (int i = start; i < choices.length; i++) {
            // Pruning rule 1: break if the subset sum would exceed target
            // The array is sorted, so later elements are at least as large and would also take the sum over target
            if (target - choices[i] < 0) {
                break;
            }
            // Make a choice and update target and start
            state.add(choices[i]);
            // Make the next choice
            backtrack(state, target - choices[i], choices, i, res);
            // Backtrack: undo the choice to restore the previous state
            state.remove(state.size() - 1);
        }
    }

    /* Solve subset sum I */
    static List<List<Integer>> subsetSumI(int[] nums, int target) {
        List<Integer> state = new ArrayList<>(); // State (current subset)
        Arrays.sort(nums); // Sort nums
        int start = 0; // Starting index
        List<List<Integer>> res = new ArrayList<>(); // Results (list of subsets)
        backtrack(state, target, nums, start, res);
        return res;
    }

    public static void main(String[] args) {
        int[] nums = { 3, 4, 5 };
        int target = 9;

        List<List<Integer>> res = subsetSumI(nums, target);

        System.out.println("Input array nums = " + Arrays.toString(nums) + ", target = " + target);
        System.out.println("Subsets that sum to  " + target + " : res = " + res);
    }
}
