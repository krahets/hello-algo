/**
 * File: subset_sum_i_naive.js
 * Created Time: 2023-07-30
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* Backtracking: subset sum I */
function backtrack(state, target, total, choices, res) {
    // Record a solution when the subset sums to target
    if (total === target) {
        res.push([...state]);
        return;
    }
    // Try each choice
    for (let i = 0; i < choices.length; i++) {
        // Prune: skip choices that would take the subset sum over target
        if (total + choices[i] > target) {
            continue;
        }
        // Make a choice and update the running sum total
        state.push(choices[i]);
        // Make the next choice
        backtrack(state, target, total + choices[i], choices, res);
        // Backtrack: undo the choice to restore the previous state
        state.pop();
    }
}

/* Solve subset sum I (including duplicate subsets) */
function subsetSumINaive(nums, target) {
    const state = []; // State (current subset)
    const total = 0; // Subset sum
    const res = []; // Results (list of subsets)
    backtrack(state, target, total, nums, res);
    return res;
}

/* Driver code */
const nums = [3, 4, 5];
const target = 9;
const res = subsetSumINaive(nums, target);
console.log(`Input array nums = ${JSON.stringify(nums)}, target = ${target}`);
console.log(`Subsets that sum to ${target}: res = ${JSON.stringify(res)}`);
console.log('This method returns duplicate subsets');
