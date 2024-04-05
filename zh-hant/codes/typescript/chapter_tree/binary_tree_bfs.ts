/**
 * File: binary_tree_bfs.ts
 * Created Time: 2022-12-14
 * Author: Justin (xiefahit@gmail.com)
 */

import { type TreeNode } from '../modules/TreeNode';
import { arrToTree } from '../modules/TreeNode';
import { printTree } from '../modules/PrintUtil';

/* 層序走訪 */
function levelOrder(root: TreeNode | null): number[] {
    // 初始化佇列，加入根節點
    const queue = [root];
    // 初始化一個串列，用於儲存走訪序列
    const list: number[] = [];
    while (queue.length) {
        let node = queue.shift() as TreeNode; // 隊列出隊
        list.push(node.val); // 儲存節點值
        if (node.left) {
            queue.push(node.left); // 左子節點入列
        }
        if (node.right) {
            queue.push(node.right); // 右子節點入列
        }
    }
    return list;
}

/* Driver Code */
/* 初始化二元樹 */
// 這裡藉助了一個從陣列直接生成二元樹的函式
const root = arrToTree([1, 2, 3, 4, 5, 6, 7]);
console.log('\n初始化二元樹\n');
printTree(root);

/* 層序走訪 */
const list = levelOrder(root);
console.log('\n層序走訪的節點列印序列 = ' + list);

export {};
