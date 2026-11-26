/**
* File: subset_sum_ii.cs
* Created Time: 2023-06-25
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_backtracking;

public class subset_sum_ii {
    /* Backtracking: subset sum II */
    void Backtrack(List<int> state, int target, int[] choices, int start, List<List<int>> res) {
        // Record a solution when the subset sums to target
        if (target == 0) {
            res.Add(new List<int>(state));
            return;
        }
        // Try each choice
        // Pruning rule 2: start at start to avoid duplicate subsets
        // Pruning rule 3: start at start to avoid reusing the same element
        for (int i = start; i < choices.Length; i++) {
            // Pruning rule 1: break if the subset sum would exceed target
            // The array is sorted, so later elements are at least as large and would also take the sum over target
            if (target - choices[i] < 0) {
                break;
            }
            // Pruning rule 4: skip a value equal to its left neighbor, since its search branch is a duplicate
            if (i > start && choices[i] == choices[i - 1]) {
                continue;
            }
            // Make a choice and update target and start
            state.Add(choices[i]);
            // Make the next choice
            Backtrack(state, target - choices[i], choices, i + 1, res);
            // Backtrack: undo the choice to restore the previous state
            state.RemoveAt(state.Count - 1);
        }
    }

    /* Solve subset sum II */
    List<List<int>> SubsetSumII(int[] nums, int target) {
        List<int> state = []; // State (current subset)
        Array.Sort(nums); // Sort nums
        int start = 0; // Starting index
        List<List<int>> res = []; // Results (list of subsets)
        Backtrack(state, target, nums, start, res);
        return res;
    }

    [Test]
    public void Test() {
        int[] nums = [4, 4, 5];
        int target = 9;
        List<List<int>> res = SubsetSumII(nums, target);
        Console.WriteLine("Input array nums = " + string.Join(", ", nums) + ", target = " + target);
        Console.WriteLine("Subsets that sum to  " + target + " : res = ");
        foreach (var subset in res) {
            PrintUtil.PrintList(subset);
        }
    }
}
