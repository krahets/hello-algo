// File: permutations_ii.cs
// Created Time: 2025-02-07
// Author: Xylphy (github.com/Xylphy)

namespace hello_algo.chapter_backtracking;

public class permutations_ii {
    /* Backtracking Algorithm: Permutations II */
    void Backtrack(List<int> state, int[] choices, bool[] selected, List<List<int>> res) {
        // When the state length equals the number of elements, record the solution
        if (state.Count == choices.Length) {
            res.Add([.. state]);
            return;
        }
        // Traverse all choices
        HashSet<int> duplicated = [];
        for (int i = 0; i < choices.Length; i++) {
            int choice = choices[i];
            // Pruning: do not allow repeated selection of elements and do not allow repeated selection of equal elements
            if (!selected[i] && !duplicated.Contains(choice)) {
                // Attempt: make a choice, update the state
                duplicated.Add(choice); // Record the chosen element value
                selected[i] = true;
                state.Add(choice);
                // Proceed to the next round of choices
                Backtrack(state, choices, selected, res);
                // Backtrack: undo the choice, revert to the previous state
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
        Console.WriteLine("All permutations res = ");
        foreach (List<int> permutation in res) {
            PrintUtil.PrintList(permutation);
        }
    }
}
