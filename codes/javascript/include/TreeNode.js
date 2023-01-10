/**
 * File: TreeNode.js
 * Created Time: 2022-12-04
 * Author: IsChristina (christinaxia77@foxmail.com)
 */

/**
 * Definition for a binary tree node.
 */
function TreeNode(val, left, right) {
    this.val = (val === undefined ? 0 : val); // 结点值
    this.left = (left === undefined ? null : left); // 左子结点指针
    this.right = (right === undefined ? null : right); // 右子结点指针
}

/**
* Generate a binary tree given an array
* @param arr
* @return
*/
function arrToTree(arr) {
    if (arr.length === 0)
        return null;
         
    let root = new TreeNode(arr[0]);
    let queue = [root] 
    let i = 0;
    while (queue.length) {
        let node = queue.shift();
        if (++i >= arr.length) break;
        if (arr[i] !== null) {
            node.left = new TreeNode(arr[i]);
            queue.push(node.left);
        }
        if (++i >= arr.length) break;
        if (arr[i] !== null) {
            node.right = new TreeNode(arr[i]);
            queue.push(node.right);
        }
    }

    return root;
}

module.exports = { 
    TreeNode,
    arrToTree,
}