"""
File: build_tree.py
Created Time: 2023-07-15
Author: krahets (krahets@163.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import TreeNode, print_tree


def dfs(
    preorder: list[int],
    inorder_map: dict[int, int],
    i: int,
    l: int,
    r: int,
) -> TreeNode | None:
    """Build binary tree: divide and conquer"""
    # Terminate when the subtree interval is empty
    if r - l < 0:
        return None
    # Initialize the root node
    root = TreeNode(preorder[i])
    # Query m to divide the left and right subtrees
    m = inorder_map[preorder[i]]
    # Subproblem: build the left subtree
    root.left = dfs(preorder, inorder_map, i + 1, l, m - 1)
    # Subproblem: build the right subtree
    root.right = dfs(preorder, inorder_map, i + 1 + m - l, m + 1, r)
    # Return the root node
    return root


def build_tree(preorder: list[int], inorder: list[int]) -> TreeNode | None:
    """Build binary tree"""
    # Initialize hash map, storing the mapping from inorder elements to indices
    inorder_map = {val: i for i, val in enumerate(inorder)}
    root = dfs(preorder, inorder_map, 0, 0, len(inorder) - 1)
    return root


"""Driver Code"""
if __name__ == "__main__":
    preorder = [3, 9, 2, 1, 7]
    inorder = [9, 3, 1, 2, 7]
    print(f"Preorder traversal = {preorder}")
    print(f"Inorder traversal = {inorder}")

    root = build_tree(preorder, inorder)
    print("The built binary tree is:")
    print_tree(root)
