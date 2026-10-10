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
    // When climbing to the n-th stair, add 1 to the solution count
    if (state === n) res.set(0, res.get(0) + 1);
    // Traverse all choices
    for (const choice of choices) {
        // Pruning: not allowed to go beyond the n-th stair
        if (state + choice > n) continue;
        // Attempt: make choice, update state
        backtrack(choices, state + choice, n, res);
        // Backtrack
    }
}

/* Climbing stairs: Backtracking */
function climbingStairsBacktrack(n: number): number {
    const choices = [1, 2]; // Can choose to climb up 1 or 2 stairs
    const state = 0; // Start climbing from the 0-th stair
    const res = new Map();
    res.set(0, 0); // Use res[0] to record the solution count
    backtrack(choices, state, n, res);
    return res.get(0);
}

/* Driver Code */
const n = 9;
const res = climbingStairsBacktrack(n);
console.log(`Climbing ${n} stairs has ${res} solutions`);

export {};
