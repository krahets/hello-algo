/**
 * File: binary_tree_bfs.js
 * Created Time: 2022-12-04
 * Author: IsChristina (christinaxia77@foxmail.com)
 */

const { arrToTree } = require('../modules/TreeNode');
const { printTree } = require('../modules/PrintUtil');

/* レベル順走査 */
function levelOrder(root) {
    // キューを初期化し、根ノードを追加する
    const queue = [root];
    // 走査順序を保存するリストを初期化する
    const list = [];
    while (queue.length) {
        let node = queue.shift(); // キューからデキューする
        list.push(node.val); // ノードの値を保存する
        if (node.left) queue.push(node.left); // 左の子ノードをエンキューする
        if (node.right) queue.push(node.right); // 右の子ノードをエンキューする
    }
    return list;
}

/* 実行用コード */
/* 二分木を初期化する */
// ここでは配列から二分木を直接生成する関数を使う
const root = arrToTree([1, 2, 3, 4, 5, 6, 7]);
console.log('\n二分木を初期化する\n');
printTree(root);

/* レベル順走査 */
const list = levelOrder(root);
console.log('\nレベル順走査で表示するノードの順序 = ' + list);
