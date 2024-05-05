/**
 * File: build_tree.swift
 * Created Time: 2023-09-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Build binary tree: Divide and conquer */
func dfs(preorder: [Int], inorderMap: [Int: Int], i: Int, l: Int, r: Int) -> TreeNode? {
    // Terminate when subtree interval is empty
    if r - l < 0 {
        return nil
    }
    // Initialize root node
    let root = TreeNode(x: preorder[i])
    // Query m to divide left and right subtrees
    let m = inorderMap[preorder[i]]!
    // Subproblem: build left subtree
    root.left = dfs(preorder: preorder, inorderMap: inorderMap, i: i + 1, l: l, r: m - 1)
    // Subproblem: build right subtree
    root.right = dfs(preorder: preorder, inorderMap: inorderMap, i: i + 1 + m - l, l: m + 1, r: r)
    // Return root node
    return root
}

/* Build binary tree */
func buildTree(preorder: [Int], inorder: [Int]) -> TreeNode? {
    // Initialize hash table, storing in-order elements to indices mapping
    let inorderMap = inorder.enumerated().reduce(into: [:]) { $0[$1.element] = $1.offset }
    return dfs(preorder: preorder, inorderMap: inorderMap, i: inorder.startIndex, l: inorder.startIndex, r: inorder.endIndex - 1)
}

@main
enum BuildTree {
    /* Driver Code */
    static func main() {
        let preorder = [3, 9, 2, 1, 7]
        let inorder = [9, 3, 1, 2, 7]
        print("Pre-order traversal = \(pre-order)")
        print("In-order traversal = \(in-order)")

        let root = buildTree(preorder: preorder, inorder: inorder)
        print("The built binary tree is:")
        PrintUtil.printTree(root: root)
    }
}
