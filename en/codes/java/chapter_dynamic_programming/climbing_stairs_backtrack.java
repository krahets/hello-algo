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
        // When climbing to the n-th stair, add 1 to the solution count
        if (state == n)
            res.set(0, res.get(0) + 1);
        // Traverse all choices
        for (Integer choice : choices) {
            // Pruning: not allowed to go beyond the n-th stair
            if (state + choice > n)
                continue;
            // Attempt: make choice, update state
            backtrack(choices, state + choice, n, res);
            // Backtrack
        }
    }

    /* Climbing stairs: Backtracking */
    public static int climbingStairsBacktrack(int n) {
        List<Integer> choices = Arrays.asList(1, 2); // Can choose to climb up 1 or 2 stairs
        int state = 0; // Start climbing from the 0-th stair
        List<Integer> res = new ArrayList<>();
        res.add(0); // Use res[0] to record the solution count
        backtrack(choices, state, n, res);
        return res.get(0);
    }

    public static void main(String[] args) {
        int n = 9;

        int res = climbingStairsBacktrack(n);
        System.out.println(String.format("Climbing %d stairs has %d solutions", n, res));
    }
}
