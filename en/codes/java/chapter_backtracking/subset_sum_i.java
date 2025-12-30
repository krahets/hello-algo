/**
 * File: subset_sum_i.java
 * Created Time: 2023-06-21
 * Author: krahets (krahets@163.com)
 */

package chapter_backtracking;

import java.util.*;

public class subset_sum_i {
    /* Backtracking algorithm: Subset sum I */
    static void backtrack(List<Integer> state, int target, int[] choices, int start, List<List<Integer>> res) {
        // When the subset sum equals target, record the solution
        if (target == 0) {
            res.add(new ArrayList<>(state));
            return;
        }
        // Traverse all choices
        // Pruning 2: start traversing from start to avoid generating duplicate subsets
        for (int i = start; i < choices.length; i++) {
            // Pruning 1: if the subset sum exceeds target, end the loop directly
            // This is because the array is sorted, and later elements are larger, so the subset sum will definitely exceed target
            if (target - choices[i] < 0) {
                break;
            }
            // Attempt: make choice, update target, start
            state.add(choices[i]);
            // Proceed to the next round of selection
            backtrack(state, target - choices[i], choices, i, res);
            // Backtrack: undo choice, restore to previous state
            state.remove(state.size() - 1);
        }
    }

    /* Solve subset sum I */
    static List<List<Integer>> subsetSumI(int[] nums, int target) {
        List<Integer> state = new ArrayList<>(); // State (subset)
        Arrays.sort(nums); // Sort nums
        int start = 0; // Start point for traversal
        List<List<Integer>> res = new ArrayList<>(); // Result list (subset list)
        backtrack(state, target, nums, start, res);
        return res;
    }

    public static void main(String[] args) {
        int[] nums = { 3, 4, 5 };
        int target = 9;

        List<List<Integer>> res = subsetSumI(nums, target);

        System.out.println("Input array nums = " + Arrays.toString(nums) + ", target = " + target);
        System.out.println("All subsets with sum equal to " + target + " are res = " + res);
    }
}
