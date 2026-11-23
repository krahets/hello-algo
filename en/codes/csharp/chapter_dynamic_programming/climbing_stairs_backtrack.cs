/**
* File: climbing_stairs_backtrack.cs
* Created Time: 2023-06-30
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_dynamic_programming;

public class climbing_stairs_backtrack {
    /* Backtracking */
    void Backtrack(List<int> choices, int state, int n, List<int> res) {
        // When step n is reached, increase the number of ways by 1
        if (state == n)
            res[0]++;
        // Iterate over all choices
        foreach (int choice in choices) {
            // Prune: do not go beyond step n
            if (state + choice > n)
                continue;
            // Try: make a choice and update the state
            Backtrack(choices, state + choice, n, res);
            // Backtrack
        }
    }

    /* Climbing stairs: backtracking */
    int ClimbingStairsBacktrack(int n) {
        List<int> choices = [1, 2]; // Choose to climb 1 or 2 steps
        int state = 0; // Start climbing from step 0
        List<int> res = [0]; // Use res[0] to record the number of ways
        Backtrack(choices, state, n, res);
        return res[0];
    }

    [Test]
    public void Test() {
        int n = 9;
        int res = ClimbingStairsBacktrack(n);
        Console.WriteLine($"Number of ways to climb {n} stairs: {res}");
    }
}
