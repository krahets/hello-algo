/**
 * File: build_tree.swift
 * Created Time: 2023-09-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Build binary tree: divide and conquer */
func dfs(preorder: [Int], inorderMap: [Int: Int], i: Int, l: Int, r: Int) -> TreeNode? {
    // Terminate when the subtree interval is empty
    if r - l < 0 {
        return nil
    }
    // Initialize the root node
    let root = TreeNode(x: preorder[i])
    // Query m to divide the left and right subtrees
    let m = inorderMap[preorder[i]]!
    // Subproblem: build the left subtree
    root.left = dfs(preorder: preorder, inorderMap: inorderMap, i: i + 1, l: l, r: m - 1)
    // Subproblem: build the right subtree
    root.right = dfs(preorder: preorder, inorderMap: inorderMap, i: i + 1 + m - l, l: m + 1, r: r)
    // Return the root node
    return root
}

/* Build binary tree */
func buildTree(preorder: [Int], inorder: [Int]) -> TreeNode? {
    // Initialize hash map, storing the mapping from inorder elements to indices
    let inorderMap = inorder.enumerated().reduce(into: [:]) { $0[$1.element] = $1.offset }
    return dfs(preorder: preorder, inorderMap: inorderMap, i: inorder.startIndex, l: inorder.startIndex, r: inorder.endIndex - 1)
}

@main
enum BuildTree {
    /* Driver Code */
    static func main() {
        let preorder = [3, 9, 2, 1, 7]
        let inorder = [9, 3, 1, 2, 7]
        print("Pre-order traversal = \(preorder)")
        print("In-order traversal = \(inorder)")

        let root = buildTree(preorder: preorder, inorder: inorder)
        print("The constructed binary tree is:")
        PrintUtil.printTree(root: root)
    }
}
