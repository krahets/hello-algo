/**
 * File: preorder_traversal_iii_template.js
 * Created Time: 2023-05-09
 * Author: Justin (xiefahit@gmail.com)
 */

const { arrToTree } = require('../modules/TreeNode');
const { printTree } = require('../modules/PrintUtil');

/* 現在の状態が解かを判定 */
function isSolution(state) {
    return state && state[state.length - 1]?.val === 7;
}

/* 解を記録する */
function recordSolution(state, res) {
    res.push([...state]);
}

/* 現在の状態でこの選択が有効か判定 */
function isValid(state, choice) {
    return choice !== null && choice.val !== 3;
}

/* 状態を更新する */
function makeChoice(state, choice) {
    state.push(choice);
}

/* 状態を復元する */
function undoChoice(state) {
    state.pop();
}

/* バックトラッキング：例題 3 */
function backtrack(state, choices, res) {
    // 解かを確認
    if (isSolution(state)) {
        // 解を記録する
        recordSolution(state, res);
    }
    // すべての選択肢を走査する
    for (const choice of choices) {
        // 枝刈り：選択が有効か確認
        if (isValid(state, choice)) {
            // 試行：選択を行い、状態を更新する
            makeChoice(state, choice);
            // 次の選択に進む
            backtrack(state, [choice.left, choice.right], res);
            // 復元：選択を取り消し、以前の状態に戻す
            undoChoice(state);
        }
    }
}

// 実行用コード
const root = arrToTree([1, 7, 3, 4, 5, 6, 7]);
console.log('\n二分木を初期化する');
printTree(root);

// バックトラッキング
const res = [];
backtrack([], [root], res);

console.log('\n値が 3 のノードを含まない、根ノードからノード 7 までのすべての経路を出力する');
res.forEach((path) => {
    console.log(path.map((node) => node.val));
});
