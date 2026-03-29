/**
 * File: binary_tree_bfs.js
 * Created Time: 2022-12-04
 * Author: IsChristina (christinaxia77@foxmail.com)
 */

const { arrToTree } = require('../modules/TreeNode');
const { printTree } = require('../modules/PrintUtil');

/* レベル順走査 */
function levelOrder(root) {
    // キューを初期化し、ルートノードを追加する
    const queue = [root];
    // 走査順序を保存するためのリストを初期化する
    const list = [];
    while (queue.length) {
        let node = queue.shift(); // デキュー
        list.push(node.val); // ノードの値を保存する
        if (node.left) queue.push(node.left); // 左子ノードをキューに追加
        if (node.right) queue.push(node.right); // 右子ノードをキューに追加
    }
    return list;
}

/* Driver Code */
/* 二分木を初期化 */
// ここでは、配列から直接二分木を生成する関数を利用する
const root = arrToTree([1, 2, 3, 4, 5, 6, 7]);
console.log('\n二分木を初期化\n');
printTree(root);

/* レベル順走査 */
const list = levelOrder(root);
console.log('\nレベル順走査のノード出力シーケンス = ' + list);
