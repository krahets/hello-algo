/**
 * File: permutations_i.js
 * Created Time: 2023-05-13
 * Author: Justin (xiefahit@gmail.com)
 */

/* Backtracking: permutations I */
function backtrack(state, choices, selected, res) {
    // Record a solution when the state length equals the number of elements
    if (state.length === choices.length) {
        res.push([...state]);
        return;
    }
    // Iterate over all choices
    choices.forEach((choice, i) => {
        // Prune: do not choose an element more than once
        if (!selected[i]) {
            // Try: make a choice and update the state
            selected[i] = true;
            state.push(choice);
            // Proceed to the next choice
            backtrack(state, choices, selected, res);
            // Backtrack: undo the choice and restore the previous state
            selected[i] = false;
            state.pop();
        }
    });
}

/* Permutations I */
function permutationsI(nums) {
    const res = [];
    backtrack([], nums, Array(nums.length).fill(false), res);
    return res;
}

// Driver code
const nums = [1, 2, 3];
const res = permutationsI(nums);

console.log(`Input array nums = ${JSON.stringify(nums)}`);
console.log(`All permutations res = ${JSON.stringify(res)}`);
