/**
 * File: permutations_i.java
 * Created Time: 2023-04-24
 * Author: krahets (krahets@163.com)
 */

package chapter_backtracking;

import java.util.*;

public class permutations_i {
    /* Backtracking algorithm: Permutations I */
    public static void backtrack(List<Integer> state, int[] choices, boolean[] selected, List<List<Integer>> res) {
        // When the state length equals the number of elements, record the solution
        if (state.size() == choices.length) {
            res.add(new ArrayList<Integer>(state));
            return;
        }
        // Traverse all choices
        for (int i = 0; i < choices.length; i++) {
            int choice = choices[i];
            // Pruning: do not allow repeated selection of elements
            if (!selected[i]) {
                // Attempt: make choice, update state
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

    /* Permutations I */
    static List<List<Integer>> permutationsI(int[] nums) {
        List<List<Integer>> res = new ArrayList<List<Integer>>();
        backtrack(new ArrayList<Integer>(), nums, new boolean[nums.length], res);
        return res;
    }

    public static void main(String[] args) {
        int[] nums = { 1, 2, 3 };

        List<List<Integer>> res = permutationsI(nums);

        System.out.println("Input array nums = " + Arrays.toString(nums));
        System.out.println("All permutations res = " + res);
    }
}
