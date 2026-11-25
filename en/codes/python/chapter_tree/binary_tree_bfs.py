"""
File: binary_tree_bfs.py
Created Time: 2022-12-20
Author: a16su (lpluls001@gmail.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import TreeNode, list_to_tree, print_tree
from collections import deque


def level_order(root: TreeNode | None) -> list[int]:
    """Level-order traversal"""
    # Initialize the queue with the root
    queue: deque[TreeNode] = deque()
    queue.append(root)
    # Initialize a list to store the traversal sequence
    res = []
    while queue:
        node: TreeNode = queue.popleft()  # Dequeue a node
        res.append(node.val)  # Save the node value
        if node.left is not None:
            queue.append(node.left)  # Enqueue the left child
        if node.right is not None:
            queue.append(node.right)  # Enqueue the right child
    return res


"""Driver Code"""
if __name__ == "__main__":
    # Initialize the binary tree
    # Use a function that builds a binary tree directly from an array
    root: TreeNode = list_to_tree(arr=[1, 2, 3, 4, 5, 6, 7])
    print("\nInitialize the binary tree\n")
    print_tree(root)

    # Level-order traversal
    res: list[int] = level_order(root)
    print("\nNodes in level order = ", res)
