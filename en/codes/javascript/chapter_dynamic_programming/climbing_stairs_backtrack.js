/**
 * File: climbing_stairs_backtrack.js
 * Created Time: 2023-07-26
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* Backtracking */
function backtrack(choices, state, n, res) {
    // When climbing to the nth step, add 1 to the number of solutions
    if (state === n) res.set(0, res.get(0) + 1);
    // Traverse all choices
    for (const choice of choices) {
        // Pruning: do not allow climbing beyond the nth step
        if (state + choice > n) continue;
        // Attempt: make a choice, update the state
        backtrack(choices, state + choice, n, res);
        // Retract
    }
}

/* Climbing stairs: Backtracking */
function climbingStairsBacktrack(n) {
    const choices = [1, 2]; // Can choose to climb up 1 step or 2 steps
    const state = 0; // Start climbing from the 0th step
    const res = new Map();
    res.set(0, 0); // Use res[0] to record the number of solutions
    backtrack(choices, state, n, res);
    return res.get(0);
}

/* Driver Code */
const n = 9;
const res = climbingStairsBacktrack(n);
console.log(`爬 ${n} 阶楼梯共有 ${res} 种方案`);
