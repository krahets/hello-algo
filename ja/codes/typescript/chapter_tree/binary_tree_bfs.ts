/**
 * File: binary_tree_bfs.ts
 * Created Time: 2022-12-14
 * Author: Justin (xiefahit@gmail.com)
 */

import { type TreeNode } from '../modules/TreeNode';
import { arrToTree } from '../modules/TreeNode';
import { printTree } from '../modules/PrintUtil';

/* レベル順走査 */
function levelOrder(root: TreeNode | null): number[] {
    // キューを初期化して根を入れる
    const queue = [root];
    // 走査順を記録するリストを初期化する
    const list: number[] = [];
    while (queue.length) {
        let node = queue.shift() as TreeNode; // キューの先頭から取り出す
        list.push(node.val); // ノードの値を記録する
        if (node.left) {
            queue.push(node.left); // 左の子をキューに入れる
        }
        if (node.right) {
            queue.push(node.right); // 右の子をキューに入れる
        }
    }
    return list;
}

/* 実行例 */
/* 二分木を初期化する */
// ここでは配列から直接二分木を作る関数を使う
const root = arrToTree([1, 2, 3, 4, 5, 6, 7]);
console.log('\n二分木を初期化\n');
printTree(root);

/* レベル順走査 */
const list = levelOrder(root);
console.log('\nレベル順に出力したノードの列 = ' + list);

export {};
