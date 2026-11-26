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
    // Record a solution when the state contains all the elements
    if (state.length === choices.length) {
        res.push([...state]);
        return;
    }
    // Try each choice
    const duplicated = new Set();
    choices.forEach((choice, i) => {
        // Skip elements already in use and values already tried at this level
        if (!selected[i] && !duplicated.has(choice)) {
            // Make a choice and update the state
            duplicated.add(choice); // Track values already tried
            selected[i] = true;
            state.push(choice);
            // Make the next choice
            backtrack(state, choices, selected, res);
            // Backtrack: undo the choice to restore the previous state
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
