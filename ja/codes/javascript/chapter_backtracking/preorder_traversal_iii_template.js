/**
 * File: preorder_traversal_iii_template.js
 * Created Time: 2023-05-09
 * Author: Justin (xiefahit@gmail.com)
 */

const { arrToTree } = require('../modules/TreeNode');
const { printTree } = require('../modules/PrintUtil');

/* 現在の状態が解かどうか判定する */
function isSolution(state) {
    return state && state[state.length - 1]?.val === 7;
}

/* 解を記録する */
function recordSolution(state, res) {
    res.push([...state]);
}

/* 現在の状態でその選択が可能か判定する */
function isValid(state, choice) {
    return choice !== null && choice.val !== 3;
}

/* 状態を更新する */
function makeChoice(state, choice) {
    state.push(choice);
}

/* 状態を元に戻す */
function undoChoice(state) {
    state.pop();
}

/* バックトラッキング：例題 3 */
function backtrack(state, choices, res) {
    // 解かどうか調べる
    if (isSolution(state)) {
        // 解を記録する
        recordSolution(state, res);
    }
    // すべての選択肢を調べる
    for (const choice of choices) {
        // 枝刈り：その選択が可能か調べる
        if (isValid(state, choice)) {
            // 試行：選択して状態を更新する
            makeChoice(state, choice);
            // 次の選択に進む
            backtrack(state, [choice.left, choice.right], res);
            // 後戻り：選択を取り消し、元の状態に戻す
            undoChoice(state);
        }
    }
}

// 実行例
const root = arrToTree([1, 7, 3, 4, 5, 6, 7]);
console.log('\n二分木を初期化');
printTree(root);

// バックトラッキング
const res = [];
backtrack([], [root], res);

console.log('\n根から値が 7 のノードまでの経路のうち、値が 3 のノードを含まないものをすべて出力');
res.forEach((path) => {
    console.log(path.map((node) => node.val));
});
