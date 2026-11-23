/**
 * File: permutations_ii.java
 * Created Time: 2023-04-24
 * Author: krahets (krahets@163.com)
 */

package chapter_backtracking;

import java.util.*;

public class permutations_ii {
    /* Backtracking: permutations II */
    static void backtrack(List<Integer> state, int[] choices, boolean[] selected, List<List<Integer>> res) {
        // Record a solution when the state length equals the number of elements
        if (state.size() == choices.length) {
            res.add(new ArrayList<Integer>(state));
            return;
        }
        // Iterate over all choices
        Set<Integer> duplicated = new HashSet<Integer>();
        for (int i = 0; i < choices.length; i++) {
            int choice = choices[i];
            // Prune: do not reuse an element or choose the same value again at this depth
            if (!selected[i] && !duplicated.contains(choice)) {
                // Try: make a choice and update the state
                duplicated.add(choice); // Record the chosen value
                selected[i] = true;
                state.add(choice);
                // Proceed to the next choice
                backtrack(state, choices, selected, res);
                // Backtrack: undo the choice and restore the previous state
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
        System.out.println("All permutations: res = " + res);
    }
}
