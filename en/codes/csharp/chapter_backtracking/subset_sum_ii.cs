/**
* File: subset_sum_ii.cs
* Created Time: 2023-06-25
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_backtracking;

public class subset_sum_ii {
    /* Backtracking algorithm: Subset Sum II */
    void Backtrack(List<int> state, int target, int[] choices, int start, List<List<int>> res) {
        // When the subset sum equals target, record the solution
        if (target == 0) {
            res.Add(new List<int>(state));
            return;
        }
        // Traverse all choices
        // Pruning two: start traversing from start to avoid generating duplicate subsets
        // Pruning three: start traversing from start to avoid repeatedly selecting the same element
        for (int i = start; i < choices.Length; i++) {
            // Pruning one: if the subset sum exceeds target, end the loop immediately
            // This is because the array is sorted, and later elements are larger, so the subset sum will definitely exceed target
            if (target - choices[i] < 0) {
                break;
            }
            // Pruning four: if the element equals the left element, it indicates that the search branch is repeated, skip it
            if (i > start && choices[i] == choices[i - 1]) {
                continue;
            }
            // Attempt: make a choice, update target, start
            state.Add(choices[i]);
            // Proceed to the next round of selection
            Backtrack(state, target - choices[i], choices, i + 1, res);
            // Retract: undo the choice, restore to the previous state
            state.RemoveAt(state.Count - 1);
        }
    }

    /* Solve Subset Sum II */
    List<List<int>> SubsetSumII(int[] nums, int target) {
        List<int> state = []; // State (subset)
        Array.Sort(nums); // Sort nums
        int start = 0; // Start point for traversal
        List<List<int>> res = []; // Result list (subset list)
        Backtrack(state, target, nums, start, res);
        return res;
    }

    [Test]
    public void Test() {
        int[] nums = [4, 4, 5];
        int target = 9;
        List<List<int>> res = SubsetSumII(nums, target);
        Console.WriteLine("Input array nums = " + string.Join(", ", nums) + ", target = " + target);
        Console.WriteLine("All subsets summing to " + target + " res =");
        foreach (var subset in res) {
            PrintUtil.PrintList(subset);
        }
    }
}
