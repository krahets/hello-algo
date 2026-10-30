/**
 * File: permutations_ii.ts
 * Created Time: 2023-05-13
 * Author: Justin (xiefahit@gmail.com)
 */

/* Backtracking: permutations II */
function backtrack(
    state: number[],
    choices: number[],
    selected: boolean[],
    res: number[][]
): void {
    // Record a solution when the state length equals the number of elements
    if (state.length === choices.length) {
        res.push([...state]);
        return;
    }
    // Iterate over all choices
    const duplicated = new Set();
    choices.forEach((choice, i) => {
        // Prune: do not reuse an element or choose the same value again at this depth
        if (!selected[i] && !duplicated.has(choice)) {
            // Try: make a choice and update the state
            duplicated.add(choice); // Record the chosen value
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

/* Permutations II */
function permutationsII(nums: number[]): number[][] {
    const res: number[][] = [];
    backtrack([], nums, Array(nums.length).fill(false), res);
    return res;
}

// Driver code
const nums: number[] = [1, 2, 2];
const res: number[][] = permutationsII(nums);

console.log(`Input array nums = ${JSON.stringify(nums)}`);
console.log(`All permutations res = ${JSON.stringify(res)}`);

export {};
