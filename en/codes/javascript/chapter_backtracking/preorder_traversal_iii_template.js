/**
 * File: preorder_traversal_iii_template.js
 * Created Time: 2023-05-09
 * Author: Justin (xiefahit@gmail.com)
 */

const { arrToTree } = require('../modules/TreeNode');
const { printTree } = require('../modules/PrintUtil');

/* Check whether the current state is a solution */
function isSolution(state) {
    return state && state[state.length - 1]?.val === 7;
}

/* Record the solution */
function recordSolution(state, res) {
    res.push([...state]);
}

/* Check whether this choice is valid in the current state */
function isValid(state, choice) {
    return choice !== null && choice.val !== 3;
}

/* Update the state */
function makeChoice(state, choice) {
    state.push(choice);
}

/* Restore the state */
function undoChoice(state) {
    state.pop();
}

/* Backtracking: example 3 */
function backtrack(state, choices, res) {
    // Check for a solution
    if (isSolution(state)) {
        // Record the solution
        recordSolution(state, res);
    }
    // Try each choice
    for (const choice of choices) {
        // Prune: check whether the choice is valid
        if (isValid(state, choice)) {
            // Make a choice and update the state
            makeChoice(state, choice);
            // Make the next choice
            backtrack(state, [choice.left, choice.right], res);
            // Backtrack: undo the choice to restore the previous state
            undoChoice(state);
        }
    }
}

// Driver code
const root = arrToTree([1, 7, 3, 4, 5, 6, 7]);
console.log('\nInitialize the binary tree');
printTree(root);

// Backtracking
const res = [];
backtrack([], [root], res);

console.log('\nPrint all paths from the root to a node with value 7 that avoid nodes with value 3');
res.forEach((path) => {
    console.log(path.map((node) => node.val));
});
