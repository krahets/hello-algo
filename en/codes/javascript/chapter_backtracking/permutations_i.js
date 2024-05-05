/**
 * File: permutations_i.js
 * Created Time: 2023-05-13
 * Author: Justin (xiefahit@gmail.com)
 */

/* Backtracking algorithm: Permutation I */
function backtrack(state, choices, selected, res) {
    // When the state length equals the number of elements, record the solution
    if (state.length === choices.length) {
        res.push([...state]);
        return;
    }
    // Traverse all choices
    choices.forEach((choice, i) => {
        // Pruning: do not allow repeated selection of elements
        if (!selected[i]) {
            // Attempt: make a choice, update the state
            selected[i] = true;
            state.push(choice);
            // Proceed to the next round of selection
            backtrack(state, choices, selected, res);
            // Retract: undo the choice, restore to the previous state
            selected[i] = false;
            state.pop();
        }
    });
}

/* Permutation I */
function permutationsI(nums) {
    const res = [];
    backtrack([], nums, Array(nums.length).fill(false), res);
    return res;
}

// Driver Code
const nums = [1, 2, 3];
const res = permutationsI(nums);

console.log(`输入数组 nums = ${JSON.stringify(nums)}`);
console.log(`所有排列 res = ${JSON.stringify(res)}`);
