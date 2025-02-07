// File: subset_sum_i_naive.cs
// Created Time: 2025-02-07
// Author: Xylphy (github.com/Xylphy)

namespace hello_algo.chapter_backtracking;

public class subset_sum_i_naive {
    /* Backtracking Algorithm: Subset Sum I */
    void Backtrack(List<int> state, int target, int total, int[] choices, List<List<int>> res) {
        // Record the solution when the subset sum equals target
        if (total == target) {
            res.Add([.. state]);
            return;
        }
        // Traverse all choices
        for (int i = 0; i < choices.Length; i++) {
            // Pruning: Skip the choice if the subset sum exceeds target
            if (total + choices[i] > target) {
                continue;
            }
            // Attempt: Make a choice and update the total
            state.Add(choices[i]);
            // Proceed to the next round of selection
            Backtrack(state, target, total + choices[i], choices, res);
            // Retract: Undo the choice and revert to the previous state
            state.RemoveAt(state.Count - 1);
        }
    }

    /* Solve Subset Sum I (including duplicate subsets) */
    List<List<int>> SubsetSumINaive(int[] nums, int target) {
        List<int> state = []; // State (subset)
        int total = 0; // Subset sum
        List<List<int>> res = []; // Result list (list of subsets)
        Backtrack(state, target, total, nums, res);
        return res;
    }

    [Test]
    public void Test() {
        int[] nums = [3, 4, 5];
        int target = 9;
        List<List<int>> res = SubsetSumINaive(nums, target);
        Console.WriteLine("Input array nums = " + string.Join(", ", nums) + ", target = " + target);
        Console.WriteLine("All subsets summing to " + target + " are res = ");
        foreach (var subset in res) {
            PrintUtil.PrintList(subset);
        }
        Console.WriteLine("The result of this method includes duplicate sets");
    }
}
