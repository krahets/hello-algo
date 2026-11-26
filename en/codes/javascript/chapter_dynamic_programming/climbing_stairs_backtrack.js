/**
 * File: climbing_stairs_backtrack.js
 * Created Time: 2023-07-26
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* Backtracking */
function backtrack(choices, state, n, res) {
    // Count one more way when we reach stair n
    if (state === n) res.set(0, res.get(0) + 1);
    // Iterate over all choices
    for (const choice of choices) {
        // Prune moves that would overshoot stair n
        if (state + choice > n) continue;
        // Try a choice and update the state
        backtrack(choices, state + choice, n, res);
        // Undo the choice
    }
}

/* Climbing stairs with backtracking */
function climbingStairsBacktrack(n) {
    const choices = [1, 2]; // Each move can climb 1 or 2 stairs
    const state = 0; // Start at stair 0
    const res = new Map();
    res.set(0, 0); // Store the number of ways in res[0]
    backtrack(choices, state, n, res);
    return res.get(0);
}

/* Driver code */
const n = 9;
const res = climbingStairsBacktrack(n);
console.log(`Climbing ${n} stairs: ${res} ways`);
