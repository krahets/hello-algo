/**
* File: climbing_stairs_backtrack.cs
* Created Time: 2023-06-30
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_dynamic_programming;

public class climbing_stairs_backtrack {
    /* Backtracking */
    void Backtrack(List<int> choices, int state, int n, List<int> res) {
        // When climbing to the n-th stair, add 1 to the solution count
        if (state == n)
            res[0]++;
        // Traverse all choices
        foreach (int choice in choices) {
            // Pruning: not allowed to go beyond the n-th stair
            if (state + choice > n)
                continue;
            // Attempt: make choice, update state
            Backtrack(choices, state + choice, n, res);
            // Backtrack
        }
    }

    /* Climbing stairs: Backtracking */
    int ClimbingStairsBacktrack(int n) {
        List<int> choices = [1, 2]; // Can choose to climb up 1 or 2 stairs
        int state = 0; // Start climbing from the 0-th stair
        List<int> res = [0]; // Use res[0] to record the solution count
        Backtrack(choices, state, n, res);
        return res[0];
    }

    [Test]
    public void Test() {
        int n = 9;
        int res = ClimbingStairsBacktrack(n);
        Console.WriteLine($"Climbing {n} stairs has {res} solutions");
    }
}
