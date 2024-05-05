/**
 * File: subset_sum_ii.java
 * Created Time: 2023-06-21
 * Author: krahets (krahets@163.com)
 */

package chapter_backtracking;

import java.util.*;

public class subset_sum_ii {
    /* Backtracking algorithm: Subset Sum II */
    static void backtrack(List<Integer> state, int target, int[] choices, int start, List<List<Integer>> res) {
        // When the subset sum equals target, record the solution
        if (target == 0) {
            res.add(new ArrayList<>(state));
            return;
        }
        // Traverse all choices
        // Pruning two: start traversing from start to avoid generating duplicate subsets
        // Pruning three: start traversing from start to avoid repeatedly selecting the same element
        for (int i = start; i < choices.length; i++) {
            // Pruning one: if the subset sum exceeds target, end the loop immediately
            // This is because the array is sorted, and later elements are larger, so the subset sum will definitely exceed target
            if (target - choices[i] < 0) {
                break;
            }
            // Pruning four: if the element equals the left element, it indicates that the search branch is repeated, skip it
            if (i > start && choices[i] == choices[i - 1]) {
                continue;
            }
            // Attempt: make a choice, update target, start
            state.add(choices[i]);
            // Proceed to the next round of selection
            backtrack(state, target - choices[i], choices, i + 1, res);
            // Retract: undo the choice, restore to the previous state
            state.remove(state.size() - 1);
        }
    }

    /* Solve Subset Sum II */
    static List<List<Integer>> subsetSumII(int[] nums, int target) {
        List<Integer> state = new ArrayList<>(); // State (subset)
        Arrays.sort(nums); // Sort nums
        int start = 0; // Start point for traversal
        List<List<Integer>> res = new ArrayList<>(); // Result list (subset list)
        backtrack(state, target, nums, start, res);
        return res;
    }

    public static void main(String[] args) {
        int[] nums = { 4, 4, 5 };
        int target = 9;

        List<List<Integer>> res = subsetSumII(nums, target);

        System.out.println("Input array nums = " + Arrays.toString(nums) + ", target = " + target);
        System.out.println("All subsets summing to " + target + " res = " + res);
    }
}
