/**
* File: climbing_stairs_backtrack.cs
* Created Time: 2023-06-30
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_dynamic_programming;

public class climbing_stairs_backtrack {
    /* Backtracking */
    void Backtrack(List<int> choices, int state, int n, List<int> res) {
        // Count one more way when we reach stair n
        if (state == n)
            res[0]++;
        // Iterate over all choices
        foreach (int choice in choices) {
            // Prune moves that would overshoot stair n
            if (state + choice > n)
                continue;
            // Try a choice and update the state
            Backtrack(choices, state + choice, n, res);
            // Undo the choice
        }
    }

    /* Climbing stairs with backtracking */
    int ClimbingStairsBacktrack(int n) {
        List<int> choices = [1, 2]; // Each move can climb 1 or 2 stairs
        int state = 0; // Start at stair 0
        List<int> res = [0]; // Store the number of ways in res[0]
        Backtrack(choices, state, n, res);
        return res[0];
    }

    [Test]
    public void Test() {
        int n = 9;
        int res = ClimbingStairsBacktrack(n);
        Console.WriteLine($"Climbing {n} stairs: {res} ways");
    }
}
