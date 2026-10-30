/**
 * File: subset_sum_i.ts
 * Created Time: 2023-07-30
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* Backtracking: subset sum I */
function backtrack(
    state: number[],
    target: number,
    choices: number[],
    start: number,
    res: number[][]
): void {
    // Record a solution when the subset reaches the original target (remaining target is 0)
    if (target === 0) {
        res.push([...state]);
        return;
    }
    // Iterate over all choices
    // Pruning 2: iterate from start to avoid generating duplicate subsets
    for (let i = start; i < choices.length; i++) {
        // Pruning 1: exit the loop if this choice would exceed the remaining target
        // The array is sorted, so later elements are at least as large and would also exceed the remaining target
        if (target - choices[i] < 0) {
            break;
        }
        // Try: make a choice and update target and start
        state.push(choices[i]);
        // Proceed to the next choice
        backtrack(state, target - choices[i], choices, i, res);
        // Backtrack: undo the choice and restore the previous state
        state.pop();
    }
}

/* Solve subset sum I */
function subsetSumI(nums: number[], target: number): number[][] {
    const state = []; // State (subset)
    nums.sort((a, b) => a - b); // Sort nums
    const start = 0; // Starting index for iteration
    const res = []; // Result list (list of subsets)
    backtrack(state, target, nums, start, res);
    return res;
}

/* Driver code */
const nums = [3, 4, 5];
const target = 9;
const res = subsetSumI(nums, target);
console.log(`Input array nums = ${JSON.stringify(nums)}, target = ${target}`);
console.log(`All subsets with sum ${target}: res = ${JSON.stringify(res)}`);

export {};
