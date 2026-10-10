/**
 * File: permutations_ii.js
 * Created Time: 2023-05-13
 * Author: Justin (xiefahit@gmail.com)
 */

/* Backtracking algorithm: Permutations II */
function backtrack(state, choices, selected, res) {
    // When the state length equals the number of elements, record the solution
    if (state.length === choices.length) {
        res.push([...state]);
        return;
    }
    // Traverse all choices
    const duplicated = new Set();
    choices.forEach((choice, i) => {
        // Pruning: do not allow repeated selection of elements and do not allow repeated selection of equal elements
        if (!selected[i] && !duplicated.has(choice)) {
            // Attempt: make choice, update state
            duplicated.add(choice); // Record the selected element value
            selected[i] = true;
            state.push(choice);
            // Proceed to the next round of selection
            backtrack(state, choices, selected, res);
            // Backtrack: undo choice, restore to previous state
            selected[i] = false;
            state.pop();
        }
    });
}

/* Permutations II */
function permutationsII(nums) {
    const res = [];
    backtrack([], nums, Array(nums.length).fill(false), res);
    return res;
}

// Driver Code
const nums = [1, 2, 2];
const res = permutationsII(nums);

console.log(`Input array nums = ${JSON.stringify(nums)}`);
console.log(`All permutations res = ${JSON.stringify(res)}`);
