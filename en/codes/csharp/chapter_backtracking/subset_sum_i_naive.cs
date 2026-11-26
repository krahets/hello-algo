/**
* File: subset_sum_i_naive.cs
* Created Time: 2023-06-25
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_backtracking;

public class subset_sum_i_naive {
    /* Backtracking: subset sum I */
    void Backtrack(List<int> state, int target, int total, int[] choices, List<List<int>> res) {
        // Record a solution when the subset sums to target
        if (total == target) {
            res.Add(new List<int>(state));
            return;
        }
        // Try each choice
        for (int i = 0; i < choices.Length; i++) {
            // Prune: skip choices that would take the subset sum over target
            if (total + choices[i] > target) {
                continue;
            }
            // Make a choice and update the running sum total
            state.Add(choices[i]);
            // Make the next choice
            Backtrack(state, target, total + choices[i], choices, res);
            // Backtrack: undo the choice to restore the previous state
            state.RemoveAt(state.Count - 1);
        }
    }

    /* Solve subset sum I (including duplicate subsets) */
    List<List<int>> SubsetSumINaive(int[] nums, int target) {
        List<int> state = []; // State (current subset)
        int total = 0; // Subset sum
        List<List<int>> res = []; // Results (list of subsets)
        Backtrack(state, target, total, nums, res);
        return res;
    }

    [Test]
    public void Test() {
        int[] nums = [3, 4, 5];
        int target = 9;
        List<List<int>> res = SubsetSumINaive(nums, target);
        Console.WriteLine("Input array nums = " + string.Join(", ", nums) + ", target = " + target);
        Console.WriteLine("Subsets that sum to  " + target + " : res = ");
        foreach (var subset in res) {
            PrintUtil.PrintList(subset);
        }
        Console.WriteLine("This method returns duplicate subsets");
    }
}
