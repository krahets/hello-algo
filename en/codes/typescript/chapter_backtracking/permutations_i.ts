/**
 * File: permutations_i.ts
 * Created Time: 2023-05-13
 * Author: Justin (xiefahit@gmail.com)
 */

/* Backtracking algorithm: Permutation I */
function backtrack(
    state: number[],
    choices: number[],
    selected: boolean[],
    res: number[][]
): void {
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
function permutationsI(nums: number[]): number[][] {
    const res: number[][] = [];
    backtrack([], nums, Array(nums.length).fill(false), res);
    return res;
}

// Driver Code
const nums: number[] = [1, 2, 3];
const res: number[][] = permutationsI(nums);

console.log(`输入数组 nums = ${JSON.stringify(nums)}`);
console.log(`所有排列 res = ${JSON.stringify(res)}`);

export {};
