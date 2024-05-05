/**
 * File: preorder_traversal_iii_template.js
 * Created Time: 2023-05-09
 * Author: Justin (xiefahit@gmail.com)
 */

const { arrToTree } = require('../modules/TreeNode');
const { printTree } = require('../modules/PrintUtil');

/* Determine if the current state is a solution */
function isSolution(state) {
    return state && state[state.length - 1]?.val === 7;
}

/* Record solution */
function recordSolution(state, res) {
    res.push([...state]);
}

/* Determine if the choice is legal under the current state */
function isValid(state, choice) {
    return choice !== null && choice.val !== 3;
}

/* Update state */
function makeChoice(state, choice) {
    state.push(choice);
}

/* Restore state */
function undoChoice(state) {
    state.pop();
}

/* Backtracking algorithm: Example three */
function backtrack(state, choices, res) {
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
const res = [];
backtrack([], [root], res);

console.log('\nOutput all root-to-node 7 paths, requiring paths not to include nodes with value 3');
res.forEach((path) => {
    console.log(path.map((node) => node.val));
});
