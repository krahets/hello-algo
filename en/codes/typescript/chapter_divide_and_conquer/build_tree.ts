/**
 * File: build_tree.ts
 * Created Time: 2023-07-30
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

import { printTree } from '../modules/PrintUtil';
import { TreeNode } from '../modules/TreeNode';

/* Build binary tree: divide and conquer */
function dfs(
    preorder: number[],
    inorderMap: Map<number, number>,
    i: number,
    l: number,
    r: number
): TreeNode | null {
    // Terminate when the subtree interval is empty
    if (r - l < 0) return null;
    // Initialize the root node
    const root: TreeNode = new TreeNode(preorder[i]);
    // Query m to divide the left and right subtrees
    const m = inorderMap.get(preorder[i]);
    // Subproblem: build the left subtree
    root.left = dfs(preorder, inorderMap, i + 1, l, m - 1);
    // Subproblem: build the right subtree
    root.right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r);
    // Return the root node
    return root;
}

/* Build binary tree */
function buildTree(preorder: number[], inorder: number[]): TreeNode | null {
    // Initialize hash map, storing the mapping from inorder elements to indices
    let inorderMap = new Map<number, number>();
    for (let i = 0; i < inorder.length; i++) {
        inorderMap.set(inorder[i], i);
    }
    const root = dfs(preorder, inorderMap, 0, 0, inorder.length - 1);
    return root;
}

/* Driver Code */
const preorder = [3, 9, 2, 1, 7];
const inorder = [9, 3, 1, 2, 7];
console.log('Preorder traversal = ' + JSON.stringify(preorder));
console.log('Inorder traversal = ' + JSON.stringify(inorder));
const root = buildTree(preorder, inorder);
console.log('The constructed binary tree is:');
printTree(root);
