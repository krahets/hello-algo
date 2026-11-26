/**
 * File: climbing_stairs_backtrack.java
 * Created Time: 2023-06-30
 * Author: krahets (krahets@163.com)
 */

package chapter_dynamic_programming;

import java.util.*;

public class climbing_stairs_backtrack {
    /* Backtracking */
    public static void backtrack(List<Integer> choices, int state, int n, List<Integer> res) {
        // Count one more way when we reach stair n
        if (state == n)
            res.set(0, res.get(0) + 1);
        // Iterate over all choices
        for (Integer choice : choices) {
            // Prune moves that would overshoot stair n
            if (state + choice > n)
                continue;
            // Try a choice and update the state
            backtrack(choices, state + choice, n, res);
            // Undo the choice
        }
    }

    /* Climbing stairs with backtracking */
    public static int climbingStairsBacktrack(int n) {
        List<Integer> choices = Arrays.asList(1, 2); // Each move can climb 1 or 2 stairs
        int state = 0; // Start at stair 0
        List<Integer> res = new ArrayList<>();
        res.add(0); // Store the number of ways in res[0]
        backtrack(choices, state, n, res);
        return res.get(0);
    }

    public static void main(String[] args) {
        int n = 9;

        int res = climbingStairsBacktrack(n);
        System.out.println(String.format("Climbing %d stairs: %d ways", n, res));
    }
}
