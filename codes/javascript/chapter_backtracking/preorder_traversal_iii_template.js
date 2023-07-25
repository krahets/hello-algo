/**
 * File: preorder_traversal_iii_template.js
 * Created Time: 2023-05-09
 * Author: Justin (xiefahit@gmail.com)
 */

const { arrToTree } = require('../modules/TreeNode');
const { printTree } = require('../modules/PrintUtil');

/* 判断当前状态是否为解 */
function isSolution(state) {
    return state && state[state.length - 1]?.val === 7;
}

/* 记录解 */
function recordSolution(state, res) {
    res.push([...state]);
}

/* 判断在当前状态下，该选择是否合法 */
function isValid(state, choice) {
    return choice !== null && choice.val !== 3;
}

/* 更新状态 */
function makeChoice(state, choice) {
    state.push(choice);
}

/* 恢复状态 */
function undoChoice(state) {
    state.pop();
}

/* 回溯算法：例题三 */
function backtrack(state, choices, res) {
    // 检查是否为解
    if (isSolution(state)) {
        // 记录解
        recordSolution(state, res);
    }
    // 遍历所有选择
    for (const choice of choices) {
        // 剪枝：检查选择是否合法
        if (isValid(state, choice)) {
            // 尝试：做出选择，更新状态
            makeChoice(state, choice);
            // 进行下一轮选择
            backtrack(state, [choice.left, choice.right], res);
            // 回退：撤销选择，恢复到之前的状态
            undoChoice(state);
        }
    }
}

// Driver Code
const root = arrToTree([1, 7, 3, 4, 5, 6, 7]);
console.log('\n初始化二叉树');
printTree(root);

// 回溯算法
const res = [];
backtrack([], [root], res);

console.log('\n输出所有根节点到节点 7 的路径，要求路径中不包含值为 3 的节点');
res.forEach((path) => {
    console.log(path.map((node) => node.val));
});
