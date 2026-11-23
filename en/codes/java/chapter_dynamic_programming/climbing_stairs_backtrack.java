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
        // When step n is reached, increase the number of ways by 1
        if (state == n)
            res.set(0, res.get(0) + 1);
        // Iterate over all choices
        for (Integer choice : choices) {
            // Prune: do not go beyond step n
            if (state + choice > n)
                continue;
            // Try: make a choice and update the state
            backtrack(choices, state + choice, n, res);
            // Backtrack
        }
    }

    /* Climbing stairs: backtracking */
    public static int climbingStairsBacktrack(int n) {
        List<Integer> choices = Arrays.asList(1, 2); // Choose to climb 1 or 2 steps
        int state = 0; // Start climbing from step 0
        List<Integer> res = new ArrayList<>();
        res.add(0); // Use res[0] to record the number of ways
        backtrack(choices, state, n, res);
        return res.get(0);
    }

    public static void main(String[] args) {
        int n = 9;

        int res = climbingStairsBacktrack(n);
        System.out.println(String.format("Number of ways to climb %d stairs: %d", n, res));
    }
}
