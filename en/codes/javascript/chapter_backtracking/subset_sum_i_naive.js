/**
 * File: subset_sum_i_naive.js
 * Created Time: 2023-07-30
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* Backtracking algorithm: Subset Sum I */
function backtrack(state, target, total, choices, res) {
    // When the subset sum equals target, record the solution
    if (total === target) {
        res.push([...state]);
        return;
    }
    // Traverse all choices
    for (let i = 0; i < choices.length; i++) {
        // Pruning: if the subset sum exceeds target, skip that choice
        if (total + choices[i] > target) {
            continue;
        }
        // Attempt: make a choice, update elements and total
        state.push(choices[i]);
        // Proceed to the next round of selection
        backtrack(state, target, total + choices[i], choices, res);
        // Retract: undo the choice, restore to the previous state
        state.pop();
    }
}

/* Solve Subset Sum I (including duplicate subsets) */
function subsetSumINaive(nums, target) {
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
console.log(`输入数组 nums = ${JSON.stringify(nums)}, target = ${target}`);
console.log(`所有和等于 ${target} 的子集 res = ${JSON.stringify(res)}`);
console.log('Please note that the result of this method includes duplicate sets');
