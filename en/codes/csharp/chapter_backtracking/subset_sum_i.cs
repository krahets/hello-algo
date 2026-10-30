/**
* File: subset_sum_i.cs
* Created Time: 2023-06-25
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_backtracking;

public class subset_sum_i {
    /* Backtracking: subset sum I */
    void Backtrack(List<int> state, int target, int[] choices, int start, List<List<int>> res) {
        // Record a solution when the subset reaches the original target (remaining target is 0)
        if (target == 0) {
            res.Add(new List<int>(state));
            return;
        }
        // Iterate over all choices
        // Pruning 2: iterate from start to avoid generating duplicate subsets
        for (int i = start; i < choices.Length; i++) {
            // Pruning 1: exit the loop if this choice would exceed the remaining target
            // The array is sorted, so later elements are at least as large and would also exceed the remaining target
            if (target - choices[i] < 0) {
                break;
            }
            // Try: make a choice and update target and start
            state.Add(choices[i]);
            // Proceed to the next choice
            Backtrack(state, target - choices[i], choices, i, res);
            // Backtrack: undo the choice and restore the previous state
            state.RemoveAt(state.Count - 1);
        }
    }

    /* Solve subset sum I */
    List<List<int>> SubsetSumI(int[] nums, int target) {
        List<int> state = []; // State (subset)
        Array.Sort(nums); // Sort nums
        int start = 0; // Starting index for iteration
        List<List<int>> res = []; // Result list (list of subsets)
        Backtrack(state, target, nums, start, res);
        return res;
    }

    [Test]
    public void Test() {
        int[] nums = [3, 4, 5];
        int target = 9;
        List<List<int>> res = SubsetSumI(nums, target);
        Console.WriteLine("Input array nums = " + string.Join(", ", nums) + ", target = " + target);
        Console.WriteLine("All subsets with sum " + target + " : res = ");
        foreach (var subset in res) {
            PrintUtil.PrintList(subset);
        }
    }
}
