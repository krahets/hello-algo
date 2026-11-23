/**
 * File: permutations_ii.cs
 * Created Time: 2023-04-24
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_backtracking;

public class permutations_ii {
    /* Backtracking: permutations II */
    void Backtrack(List<int> state, int[] choices, bool[] selected, List<List<int>> res) {
        // Record a solution when the state length equals the number of elements
        if (state.Count == choices.Length) {
            res.Add(new List<int>(state));
            return;
        }
        // Iterate over all choices
        HashSet<int> duplicated = [];
        for (int i = 0; i < choices.Length; i++) {
            int choice = choices[i];
            // Prune: do not reuse an element or choose the same value again at this depth
            if (!selected[i] && !duplicated.Contains(choice)) {
                // Try: make a choice and update the state
                duplicated.Add(choice); // Record the chosen value
                selected[i] = true;
                state.Add(choice);
                // Proceed to the next choice
                Backtrack(state, choices, selected, res);
                // Backtrack: undo the choice and restore the previous state
                selected[i] = false;
                state.RemoveAt(state.Count - 1);
            }
        }
    }

    /* Permutations II */
    List<List<int>> PermutationsII(int[] nums) {
        List<List<int>> res = [];
        Backtrack([], nums, new bool[nums.Length], res);
        return res;
    }

    [Test]
    public void Test() {
        int[] nums = [1, 2, 2];

        List<List<int>> res = PermutationsII(nums);

        Console.WriteLine("Input array nums = " + string.Join(", ", nums));
        Console.WriteLine("All permutations: res = ");
        foreach (List<int> permutation in res) {
            PrintUtil.PrintList(permutation);
        }
    }
}
