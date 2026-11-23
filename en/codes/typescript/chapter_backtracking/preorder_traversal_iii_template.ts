/**
 * File: preorder_traversal_iii_template.ts
 * Created Time: 2023-05-09
 * Author: Justin (xiefahit@gmail.com)
 */

import { type TreeNode } from '../modules/TreeNode';
import { arrToTree } from '../modules/TreeNode';
import { printTree } from '../modules/PrintUtil';

/* Check whether the current state is a solution */
function isSolution(state: TreeNode[]): boolean {
    return state && state[state.length - 1]?.val === 7;
}

/* Record the solution */
function recordSolution(state: TreeNode[], res: TreeNode[][]): void {
    res.push([...state]);
}

/* Check whether the choice is valid in the current state */
function isValid(state: TreeNode[], choice: TreeNode): boolean {
    return choice !== null && choice.val !== 3;
}

/* Update the state */
function makeChoice(state: TreeNode[], choice: TreeNode): void {
    state.push(choice);
}

/* Restore the state */
function undoChoice(state: TreeNode[]): void {
    state.pop();
}

/* Backtracking: example 3 */
function backtrack(
    state: TreeNode[],
    choices: TreeNode[],
    res: TreeNode[][]
): void {
    // Check whether this is a solution
    if (isSolution(state)) {
        // Record the solution
        recordSolution(state, res);
    }
    // Iterate over all choices
    for (const choice of choices) {
        // Prune: check whether the choice is valid
        if (isValid(state, choice)) {
            // Try: make a choice and update the state
            makeChoice(state, choice);
            // Proceed to the next choice
            backtrack(state, [choice.left, choice.right], res);
            // Backtrack: undo the choice and restore the previous state
            undoChoice(state);
        }
    }
}

// Driver code
const root = arrToTree([1, 7, 3, 4, 5, 6, 7]);
console.log('\nInitialize the binary tree');
printTree(root);

// Backtracking algorithm
const res: TreeNode[][] = [];
backtrack([], [root], res);

console.log('\nOutput all paths from the root to nodes with value 7, requiring that no node on the path has value 3');
res.forEach((path) => {
    console.log(path.map((node) => node.val));
});

export {};
