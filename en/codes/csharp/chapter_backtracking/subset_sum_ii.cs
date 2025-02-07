// File: subset_sum_ii_.cs
// Created Time: 2025-02-07
// Author: Xylphy (github.com/Xylphy)

namespace hello_algo.chapter_backtracking;

public class subset_sum_ii {
    /* Backtracking Algorithm: Subset Sum II */
    void Backtrack(List<int> state, int target, int[] choices, int start, List<List<int>> res) {
        // Record the solution when the subset sum equals target
        if (target == 0) {
            res.Add([.. state]);
            return;
        }
        // Traverse all choices
        // Pruning 2: Start traversing from start to avoid generating duplicate subsets
        // Pruning 3: Start traversing from start to avoid choosing the same element repeatedly
        for (int i = start; i < choices.Length; i++) {
            // Pruning 1: If the subset sum exceeds target, end the loop immediately
            // This is because the array is sorted, and the subsequent elements are larger, so the subset sum will definitely exceed target
            if (target - choices[i] < 0) {
                break;
            }
            // Pruning 4: If this element is equal to the left element, it means this search branch is duplicated, skip it immediately
            if (i > start && choices[i] == choices[i - 1]) {
                continue;
            }
            // Attempt: Make a choice, update target, start
            state.Add(choices[i]);
            // Proceed to the next round of selection
            Backtrack(state, target - choices[i], choices, i + 1, res);
            // Backtrack: Undo the choice, revert to the previous state
            state.RemoveAt(state.Count - 1);
        }
    }

    /* Solve Subset Sum II */
    List<List<int>> SubsetSumII(int[] nums, int target) {
        List<int> state = []; // State (subset)
        Array.Sort(nums); // Sort nums
        int start = 0; // Starting point for traversal
        List<List<int>> res = []; // Result list (list of subsets)
        Backtrack(state, target, nums, start, res);
        return res;
    }

    [Test]
    public void Test() {
        int[] nums = [4, 4, 5];
        int target = 9;
        List<List<int>> res = SubsetSumII(nums, target);
        Console.WriteLine("Input array nums = " + string.Join(", ", nums) + ", target = " + target);
        Console.WriteLine("All subsets with summing to " + target + " are res = ");
        foreach (var subset in res) {
            PrintUtil.PrintList(subset);
        }
    }
}
