/**
 * File: preorder_traversal_iii_template.ts
 * Created Time: 2023-05-09
 * Author: Justin (xiefahit@gmail.com)
 */

import { type TreeNode } from '../modules/TreeNode';
import { arrToTree } from '../modules/TreeNode';
import { printTree } from '../modules/PrintUtil';

/* 現在の状態が解かを判定 */
function isSolution(state: TreeNode[]): boolean {
    return state && state[state.length - 1]?.val === 7;
}

/* 解を記録する */
function recordSolution(state: TreeNode[], res: TreeNode[][]): void {
    res.push([...state]);
}

/* 現在の状態でこの選択が有効か判定 */
function isValid(state: TreeNode[], choice: TreeNode): boolean {
    return choice !== null && choice.val !== 3;
}

/* 状態を更新する */
function makeChoice(state: TreeNode[], choice: TreeNode): void {
    state.push(choice);
}

/* 状態を復元する */
function undoChoice(state: TreeNode[]): void {
    state.pop();
}

/* バックトラッキング：例題 3 */
function backtrack(
    state: TreeNode[],
    choices: TreeNode[],
    res: TreeNode[][]
): void {
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
const res: TreeNode[][] = [];
backtrack([], [root], res);

console.log('\n値が 3 のノードを含まない、根ノードからノード 7 までのすべての経路を出力する');
res.forEach((path) => {
    console.log(path.map((node) => node.val));
});

export {};
