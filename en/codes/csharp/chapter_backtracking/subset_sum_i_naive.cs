/**
* File: subset_sum_i_naive.cs
* Created Time: 2023-06-25
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_backtracking;

public class subset_sum_i_naive {
    /* Backtracking algorithm: Subset Sum I */
    void Backtrack(List<int> state, int target, int total, int[] choices, List<List<int>> res) {
        // When the subset sum equals target, record the solution
        if (total == target) {
            res.Add(new List<int>(state));
            return;
        }
        // Traverse all choices
        for (int i = 0; i < choices.Length; i++) {
            // Pruning: if the subset sum exceeds target, skip that choice
            if (total + choices[i] > target) {
                continue;
            }
            // Attempt: make a choice, update elements and total
            state.Add(choices[i]);
            // Proceed to the next round of selection
            Backtrack(state, target, total + choices[i], choices, res);
            // Retract: undo the choice, restore to the previous state
            state.RemoveAt(state.Count - 1);
        }
    }

    /* Solve Subset Sum I (including duplicate subsets) */
    List<List<int>> SubsetSumINaive(int[] nums, int target) {
        List<int> state = []; // State (subset)
        int total = 0; // Subset sum
        List<List<int>> res = []; // Result list (subset list)
        Backtrack(state, target, total, nums, res);
        return res;
    }

    [Test]
    public void Test() {
        int[] nums = [3, 4, 5];
        int target = 9;
        List<List<int>> res = SubsetSumINaive(nums, target);
        Console.WriteLine("Input array nums = " + string.Join(", ", nums) + ", target = " + target);
        Console.WriteLine("All subsets summing to " + target + " res =");
        foreach (var subset in res) {
            PrintUtil.PrintList(subset);
        }
        Console.WriteLine("Please note that the result of this method includes duplicate sets");
    }
}
