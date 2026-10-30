/**
 * File: climbing_stairs_backtrack.ts
 * Created Time: 2023-07-26
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* Backtracking */
function backtrack(
    choices: number[],
    state: number,
    n: number,
    res: Map<0, any>
): void {
    // When step n is reached, increase the number of ways by 1
    if (state === n) res.set(0, res.get(0) + 1);
    // Iterate over all choices
    for (const choice of choices) {
        // Prune: do not go beyond step n
        if (state + choice > n) continue;
        // Try: make a choice and update the state
        backtrack(choices, state + choice, n, res);
        // Backtrack
    }
}

/* Climbing stairs: backtracking */
function climbingStairsBacktrack(n: number): number {
    const choices = [1, 2]; // Choose to climb 1 or 2 steps
    const state = 0; // Start climbing from step 0
    const res = new Map();
    res.set(0, 0); // Store the number of ways at key 0 in res
    backtrack(choices, state, n, res);
    return res.get(0);
}

/* Driver code */
const n = 9;
const res = climbingStairsBacktrack(n);
console.log(`Number of ways to climb ${n} stairs: ${res}`);

export {};
