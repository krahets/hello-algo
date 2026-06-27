/**
 * File: subset_sum_i_naive.ts
 * Created Time: 2023-07-30
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* Backtracking algorithm: Subset sum I */
function backtrack(
    state: number[],
    target: number,
    total: number,
    choices: number[],
    res: number[][]
): void {
    // When the subset sum equals target, record the solution
    if (total === target) {
        res.push([...state]);
        return;
    }
    // Traverse all choices
    for (let i = 0; i < choices.length; i++) {
        // Pruning: if the subset sum exceeds target, skip this choice
        if (total + choices[i] > target) {
            continue;
        }
        // Attempt: make choice, update element sum total
        state.push(choices[i]);
        // Proceed to the next round of selection
        backtrack(state, target, total + choices[i], choices, res);
        // Backtrack: undo choice, restore to previous state
        state.pop();
    }
}

/* Solve subset sum I (including duplicate subsets) */
function subsetSumINaive(nums: number[], target: number): number[][] {
    const state = []; // State (subset)
    const total = 0; // Subset sum
    const res = []; // Result list (subset list)
    backtrack(state, target, total, nums, res);
    return res;
}

/* Driver Code */
const nums = [3, 4, 5];
const target = 9;
const res = subsetSumINaive(nums, target);
console.log(`Input array nums = ${JSON.stringify(nums)}, target = ${target}`);
console.log(`All subsets with sum equal to ${target} res = ${JSON.stringify(res)}`);
console.log('Please note that this method outputs results containing duplicate sets');

export {};
