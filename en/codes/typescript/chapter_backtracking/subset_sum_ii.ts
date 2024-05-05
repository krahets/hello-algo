/**
 * File: subset_sum_ii.ts
 * Created Time: 2023-07-30
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* Backtracking algorithm: Subset Sum II */
function backtrack(
    state: number[],
    target: number,
    choices: number[],
    start: number,
    res: number[][]
): void {
    // When the subset sum equals target, record the solution
    if (target === 0) {
        res.push([...state]);
        return;
    }
    // Traverse all choices
    // Pruning two: start traversing from start to avoid generating duplicate subsets
    // Pruning three: start traversing from start to avoid repeatedly selecting the same element
    for (let i = start; i < choices.length; i++) {
        // Pruning one: if the subset sum exceeds target, end the loop immediately
        // This is because the array is sorted, and later elements are larger, so the subset sum will definitely exceed target
        if (target - choices[i] < 0) {
            break;
        }
        // Pruning four: if the element equals the left element, it indicates that the search branch is repeated, skip it
        if (i > start && choices[i] === choices[i - 1]) {
            continue;
        }
        // Attempt: make a choice, update target, start
        state.push(choices[i]);
        // Proceed to the next round of selection
        backtrack(state, target - choices[i], choices, i + 1, res);
        // Retract: undo the choice, restore to the previous state
        state.pop();
    }
}

/* Solve Subset Sum II */
function subsetSumII(nums: number[], target: number): number[][] {
    const state = []; // State (subset)
    nums.sort((a, b) => a - b); // Sort nums
    const start = 0; // Start point for traversal
    const res = []; // Result list (subset list)
    backtrack(state, target, nums, start, res);
    return res;
}

/* Driver Code */
const nums = [4, 4, 5];
const target = 9;
const res = subsetSumII(nums, target);
console.log(`输入数组 nums = ${JSON.stringify(nums)}, target = ${target}`);
console.log(`所有和等于 ${target} 的子集 res = ${JSON.stringify(res)}`);

export {};
