/**
* File: subset_sum_i.cs
* Created Time: 2023-06-25
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_backtracking;

public class subset_sum_i {
    /* Backtracking algorithm: Subset sum I */
    void Backtrack(List<int> state, int target, int[] choices, int start, List<List<int>> res) {
        // When the subset sum equals target, record the solution
        if (target == 0) {
            res.Add(new List<int>(state));
            return;
        }
        // Traverse all choices
        // Pruning 2: start traversing from start to avoid generating duplicate subsets
        for (int i = start; i < choices.Length; i++) {
            // Pruning 1: if the subset sum exceeds target, end the loop directly
            // This is because the array is sorted, and later elements are larger, so the subset sum will definitely exceed target
            if (target - choices[i] < 0) {
                break;
            }
            // Attempt: make choice, update target, start
            state.Add(choices[i]);
            // Proceed to the next round of selection
            Backtrack(state, target - choices[i], choices, i, res);
            // Backtrack: undo choice, restore to previous state
            state.RemoveAt(state.Count - 1);
        }
    }

    /* Solve subset sum I */
    List<List<int>> SubsetSumI(int[] nums, int target) {
        List<int> state = []; // State (subset)
        Array.Sort(nums); // Sort nums
        int start = 0; // Start point for traversal
        List<List<int>> res = []; // Result list (subset list)
        Backtrack(state, target, nums, start, res);
        return res;
    }

    [Test]
    public void Test() {
        int[] nums = [3, 4, 5];
        int target = 9;
        List<List<int>> res = SubsetSumI(nums, target);
        Console.WriteLine("Input array nums = " + string.Join(", ", nums) + ", target = " + target);
        Console.WriteLine("All subsets with sum equal to " + target + " are res = ");
        foreach (var subset in res) {
            PrintUtil.PrintList(subset);
        }
    }
}
