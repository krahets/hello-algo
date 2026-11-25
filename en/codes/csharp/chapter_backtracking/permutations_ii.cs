/**
 * File: permutations_ii.cs
 * Created Time: 2023-04-24
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_backtracking;

public class permutations_ii {
    /* Backtracking: permutations II */
    void Backtrack(List<int> state, int[] choices, bool[] selected, List<List<int>> res) {
        // Record a solution when the state contains all the elements
        if (state.Count == choices.Length) {
            res.Add(new List<int>(state));
            return;
        }
        // Try each choice
        HashSet<int> duplicated = [];
        for (int i = 0; i < choices.Length; i++) {
            int choice = choices[i];
            // Skip elements already in use and values already tried at this level
            if (!selected[i] && !duplicated.Contains(choice)) {
                // Make a choice and update the state
                duplicated.Add(choice); // Track values already tried
                selected[i] = true;
                state.Add(choice);
                // Make the next choice
                Backtrack(state, choices, selected, res);
                // Backtrack: undo the choice to restore the previous state
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

        Console.WriteLine("Input array nums =  " + string.Join(", ", nums));
        Console.WriteLine("All permutations res =  ");
        foreach (List<int> permutation in res) {
            PrintUtil.PrintList(permutation);
        }
    }
}
