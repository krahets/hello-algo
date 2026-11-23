/**
 * File: subset_sum_i.js
 * Created Time: 2023-07-30
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* Backtracking: subset sum I */
function backtrack(state, target, choices, start, res) {
    // Record a solution when the remaining target is zero, so the subset sum equals the original target
    if (target === 0) {
        res.push([...state]);
        return;
    }
    // Iterate over all choices
    // Pruning 2: iterate from start to avoid generating duplicate subsets
    for (let i = start; i < choices.length; i++) {
        // Pruning 1: exit the loop if the next choice exceeds the remaining target
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
function subsetSumI(nums, target) {
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
