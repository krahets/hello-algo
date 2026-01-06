/**
 * File: permutations_ii.java
 * Created Time: 2023-04-24
 * Author: krahets (krahets@163.com)
 */

package chapter_backtracking;

import java.util.*;

public class permutations_ii {
    /* Backtracking algorithm: Permutations II */
    static void backtrack(List<Integer> state, int[] choices, boolean[] selected, List<List<Integer>> res) {
        // When the state length equals the number of elements, record the solution
        if (state.size() == choices.length) {
            res.add(new ArrayList<Integer>(state));
            return;
        }
        // Traverse all choices
        Set<Integer> duplicated = new HashSet<Integer>();
        for (int i = 0; i < choices.length; i++) {
            int choice = choices[i];
            // Pruning: do not allow repeated selection of elements and do not allow repeated selection of equal elements
            if (!selected[i] && !duplicated.contains(choice)) {
                // Attempt: make choice, update state
                duplicated.add(choice); // Record the selected element value
                selected[i] = true;
                state.add(choice);
                // Proceed to the next round of selection
                backtrack(state, choices, selected, res);
                // Backtrack: undo choice, restore to previous state
                selected[i] = false;
                state.remove(state.size() - 1);
            }
        }
    }

    /* Permutations II */
    static List<List<Integer>> permutationsII(int[] nums) {
        List<List<Integer>> res = new ArrayList<List<Integer>>();
        backtrack(new ArrayList<Integer>(), nums, new boolean[nums.length], res);
        return res;
    }

    public static void main(String[] args) {
        int[] nums = { 1, 2, 2 };

        List<List<Integer>> res = permutationsII(nums);

        System.out.println("Input array nums = " + Arrays.toString(nums));
        System.out.println("All permutations res = " + res);
    }
}
