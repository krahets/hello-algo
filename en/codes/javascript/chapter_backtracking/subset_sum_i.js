/**
 * File: subset_sum_i.js
 * Created Time: 2023-07-30
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* Backtracking: subset sum I */
function backtrack(state, target, choices, start, res) {
    // Record a solution when the subset sums to target
    if (target === 0) {
        res.push([...state]);
        return;
    }
    // Try each choice
    // Pruning rule 2: start at start to avoid duplicate subsets
    for (let i = start; i < choices.length; i++) {
        // Pruning rule 1: break if the subset sum would exceed target
        // The array is sorted, so later elements are at least as large and would also take the sum over target
        if (target - choices[i] < 0) {
            break;
        }
        // Make a choice and update target and start
        state.push(choices[i]);
        // Make the next choice
        backtrack(state, target - choices[i], choices, i, res);
        // Backtrack: undo the choice to restore the previous state
        state.pop();
    }
}

/* Solve subset sum I */
function subsetSumI(nums, target) {
    const state = []; // State (current subset)
    nums.sort((a, b) => a - b); // Sort nums
    const start = 0; // Starting index
    const res = []; // Results (list of subsets)
    backtrack(state, target, nums, start, res);
    return res;
}

/* Driver code */
const nums = [3, 4, 5];
const target = 9;
const res = subsetSumI(nums, target);
console.log(`Input array nums = ${JSON.stringify(nums)}, target = ${target}`);
console.log(`Subsets that sum to ${target}: res = ${JSON.stringify(res)}`);
