/**
 * File: preorder_traversal_iii_template.js
 * Created Time: 2023-05-09
 * Author: Justin (xiefahit@gmail.com)
 */

const { arrToTree } = require('../modules/TreeNode');
const { printTree } = require('../modules/PrintUtil');

/* Check if the current state is a solution */
function isSolution(state) {
    return state && state[state.length - 1]?.val === 7;
}

/* Record solution */
function recordSolution(state, res) {
    res.push([...state]);
}

/* Check if the choice is valid under the current state */
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

/* Backtracking algorithm: Example 3 */
function backtrack(state, choices, res) {
    // Check if it is a solution
    if (isSolution(state)) {
        // Record solution
        recordSolution(state, res);
    }
    // Traverse all choices
    for (const choice of choices) {
        // Pruning: check if the choice is valid
        if (isValid(state, choice)) {
            // Attempt: make choice, update state
            makeChoice(state, choice);
            // Proceed to the next round of selection
            backtrack(state, [choice.left, choice.right], res);
            // Backtrack: undo choice, restore to previous state
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

console.log('\nOutput all paths from root node to node 7, requiring paths do not include nodes with value 3');
res.forEach((path) => {
    console.log(path.map((node) => node.val));
});
