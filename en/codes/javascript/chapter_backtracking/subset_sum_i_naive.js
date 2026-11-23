/**
 * File: subset_sum_i_naive.js
 * Created Time: 2023-07-30
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* Backtracking: subset sum I */
function backtrack(state, target, total, choices, res) {
    // Record a solution when the subset sum equals target
    if (total === target) {
        res.push([...state]);
        return;
    }
    // Iterate over all choices
    for (let i = 0; i < choices.length; i++) {
        // Prune: skip this choice if the subset sum would exceed target
        if (total + choices[i] > target) {
            continue;
        }
        // Try: make a choice and update the sum total
        state.push(choices[i]);
        // Proceed to the next choice
        backtrack(state, target, total + choices[i], choices, res);
        // Backtrack: undo the choice and restore the previous state
        state.pop();
    }
}

/* Solve subset sum I (with duplicate subsets) */
function subsetSumINaive(nums, target) {
    const state = []; // State (subset)
    const total = 0; // Subset sum
    const res = []; // Result list (list of subsets)
    backtrack(state, target, total, nums, res);
    return res;
}

/* Driver code */
const nums = [3, 4, 5];
const target = 9;
const res = subsetSumINaive(nums, target);
console.log(`Input array nums = ${JSON.stringify(nums)}, target = ${target}`);
console.log(`All subsets with sum ${target}: res = ${JSON.stringify(res)}`);
console.log('Note that this method produces duplicate subsets');
