/**
* File: subset_sum_i_naive.cs
* Created Time: 2023-06-25
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_backtracking;

public class subset_sum_i_naive {
    /* Backtracking: subset sum I */
    void Backtrack(List<int> state, int target, int total, int[] choices, List<List<int>> res) {
        // Record a solution when the subset sum equals target
        if (total == target) {
            res.Add(new List<int>(state));
            return;
        }
        // Iterate over all choices
        for (int i = 0; i < choices.Length; i++) {
            // Prune: skip this choice if the subset sum would exceed target
            if (total + choices[i] > target) {
                continue;
            }
            // Try: make a choice and update the sum total
            state.Add(choices[i]);
            // Proceed to the next choice
            Backtrack(state, target, total + choices[i], choices, res);
            // Backtrack: undo the choice and restore the previous state
            state.RemoveAt(state.Count - 1);
        }
    }

    /* Solve subset sum I (with duplicate subsets) */
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
        Console.WriteLine("All subsets with sum " + target + " : res = ");
        foreach (var subset in res) {
            PrintUtil.PrintList(subset);
        }
        Console.WriteLine("Note that this method produces duplicate subsets");
    }
}
