/**
 * File: preorder_traversal_iii_template.js
 * Created Time: 2023-05-09
 * Author: Justin (xiefahit@gmail.com)
 */

const { arrToTree } = require('../modules/TreeNode');
const { printTree } = require('../modules/PrintUtil');

/* 現在の状態が解かどうかを判定 */
function isSolution(state) {
    return state && state[state.length - 1]?.val === 7;
}

/* 解を記録 */
function recordSolution(state, res) {
    res.push([...state]);
}

/* 現在の状態で、この選択が有効かどうかを判定 */
function isValid(state, choice) {
    return choice !== null && choice.val !== 3;
}

/* 状態を更新 */
function makeChoice(state, choice) {
    state.push(choice);
}

/* 状態を元に戻す */
function undoChoice(state) {
    state.pop();
}

/* バックトラッキング：例題 3 */
function backtrack(state, choices, res) {
    // 解かどうかを確認
    if (isSolution(state)) {
        // 解を記録
        recordSolution(state, res);
    }
    // すべての選択肢を走査
    for (const choice of choices) {
        // 枝刈り：選択が妥当かを確認する
        if (isValid(state, choice)) {
            // 試行: 選択を行い、状態を更新
            makeChoice(state, choice);
            // 次の選択へ進む
            backtrack(state, [choice.left, choice.right], res);
            // バックトラック：選択を取り消し、前の状態に戻す
            undoChoice(state);
        }
    }
}

// Driver Code
const root = arrToTree([1, 7, 3, 4, 5, 6, 7]);
console.log('\n二分木を初期化');
printTree(root);

// バックトラッキング法
const res = [];
backtrack([], [root], res);

console.log('\n根ノードからノード 7 までのすべての経路を出力し，経路には値が 3 のノードを含まないことを条件とする');
res.forEach((path) => {
    console.log(path.map((node) => node.val));
});
