/**
* File: climbing_stairs_backtrack.cs
* Created Time: 2023-06-30
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_dynamic_programming;

public class climbing_stairs_backtrack {
    /* Backtracking */
    void Backtrack(List<int> choices, int state, int n, List<int> res) {
        // When climbing to the nth step, add 1 to the number of solutions
        if (state == n)
            res[0]++;
        // Traverse all choices
        foreach (int choice in choices) {
            // Pruning: do not allow climbing beyond the nth step
            if (state + choice > n)
                continue;
            // Attempt: make a choice, update the state
            Backtrack(choices, state + choice, n, res);
            // Retract
        }
    }

    /* Climbing stairs: Backtracking */
    int ClimbingStairsBacktrack(int n) {
        List<int> choices = [1, 2]; // Can choose to climb up 1 step or 2 steps
        int state = 0; // Start climbing from the 0th step
        List<int> res = [0]; // Use res[0] to record the number of solutions
        Backtrack(choices, state, n, res);
        return res[0];
    }

    [Test]
    public void Test() {
        int n = 9;
        int res = ClimbingStairsBacktrack(n);
        Console.WriteLine($"Climb {n} steps, there are {res} solutions in total");
    }
}
