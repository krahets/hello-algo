/**
 * File: permutations_i.cs
 * Created Time: 2023-04-24
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_backtracking;

public class permutations_i {
    /* Backtracking: permutations I */
    void Backtrack(List<int> state, int[] choices, bool[] selected, List<List<int>> res) {
        // Record a solution when the state contains all the elements
        if (state.Count == choices.Length) {
            res.Add(new List<int>(state));
            return;
        }
        // Try each choice
        for (int i = 0; i < choices.Length; i++) {
            int choice = choices[i];
            // Prune: skip elements already in use
            if (!selected[i]) {
                // Make a choice and update the state
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

    /* Permutations I */
    List<List<int>> PermutationsI(int[] nums) {
        List<List<int>> res = [];
        Backtrack([], nums, new bool[nums.Length], res);
        return res;
    }

    [Test]
    public void Test() {
        int[] nums = [1, 2, 3];

        List<List<int>> res = PermutationsI(nums);

        Console.WriteLine("Input array nums = " + string.Join(", ", nums));
        Console.WriteLine("All permutations res = ");
        foreach (List<int> permutation in res) {
            PrintUtil.PrintList(permutation);
        }
    }
}
