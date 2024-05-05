/**
 * File: preorder_traversal_iii_template.ts
 * Created Time: 2023-05-09
 * Author: Justin (xiefahit@gmail.com)
 */

import { type TreeNode } from '../modules/TreeNode';
import { arrToTree } from '../modules/TreeNode';
import { printTree } from '../modules/PrintUtil';

/* Determine if the current state is a solution */
function isSolution(state: TreeNode[]): boolean {
    return state && state[state.length - 1]?.val === 7;
}

/* Record solution */
function recordSolution(state: TreeNode[], res: TreeNode[][]): void {
    res.push([...state]);
}

/* Determine if the choice is legal under the current state */
function isValid(state: TreeNode[], choice: TreeNode): boolean {
    return choice !== null && choice.val !== 3;
}

/* Update state */
function makeChoice(state: TreeNode[], choice: TreeNode): void {
    state.push(choice);
}

/* Restore state */
function undoChoice(state: TreeNode[]): void {
    state.pop();
}

/* Backtracking algorithm: Example three */
function backtrack(
    state: TreeNode[],
    choices: TreeNode[],
    res: TreeNode[][]
): void {
    // Check if it's a solution
    if (isSolution(state)) {
        // Record solution
        recordSolution(state, res);
    }
    // Traverse all choices
    for (const choice of choices) {
        // Pruning: check if the choice is legal
        if (isValid(state, choice)) {
            // Attempt: make a choice, update the state
            makeChoice(state, choice);
            // Proceed to the next round of selection
            backtrack(state, [choice.left, choice.right], res);
            // Retract: undo the choice, restore to the previous state
            undoChoice(state);
        }
    }
}

// Driver Code
const root = arrToTree([1, 7, 3, 4, 5, 6, 7]);
console.log('\nInitialize binary tree');
printTree(root);

// Backtracking algorithm
const res: TreeNode[][] = [];
backtrack([], [root], res);

console.log('\nOutput all root-to-node 7 paths, requiring paths not to include nodes with value 3');
res.forEach((path) => {
    console.log(path.map((node) => node.val));
});

export {};
