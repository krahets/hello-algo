"""
File: binary_search_tree.py
Created Time: 2022-12-20
Author: a16su (lpluls001@gmail.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import TreeNode, print_tree


class BinarySearchTree:
    """Binary search tree"""

    def __init__(self):
        """Constructor"""
        # Initialize empty tree
        self._root = None

    def get_root(self) -> TreeNode | None:
        """Get binary tree root node"""
        return self._root

    def search(self, num: int) -> TreeNode | None:
        """Search node"""
        cur = self._root
        # Loop find, break after passing leaf nodes
        while cur is not None:
            # Target node is in cur's right subtree
            if cur.val < num:
                cur = cur.right
            # Target node is in cur's left subtree
            elif cur.val > num:
                cur = cur.left
            # Found target node, break loop
            else:
                break
        return cur

    def insert(self, num: int):
        """Insert node"""
        # If tree is empty, initialize root node
        if self._root is None:
            self._root = TreeNode(num)
            return
        # Loop find, break after passing leaf nodes
        cur, pre = self._root, None
        while cur is not None:
            # Found duplicate node, thus return
            if cur.val == num:
                return
            pre = cur
            # Insertion position is in cur's right subtree
            if cur.val < num:
                cur = cur.right
            # Insertion position is in cur's left subtree
            else:
                cur = cur.left
        # Insert node
        node = TreeNode(num)
        if pre.val < num:
            pre.right = node
        else:
            pre.left = node

    def remove(self, num: int):
        """Remove node"""
        # If tree is empty, return
        if self._root is None:
            return
        # Loop find, break after passing leaf nodes
        cur, pre = self._root, None
        while cur is not None:
            # Found node to be removed, break loop
            if cur.val == num:
                break
            pre = cur
            # Node to be removed is in cur's right subtree
            if cur.val < num:
                cur = cur.right
            # Node to be removed is in cur's left subtree
            else:
                cur = cur.left
        # If no node to be removed, return
        if cur is None:
            return

        # Number of child nodes = 0 or 1
        if cur.left is None or cur.right is None:
            # When the number of child nodes = 0/1, child = null/that child node
            child = cur.left or cur.right
            # Remove node cur
            if cur != self._root:
                if pre.left == cur:
                    pre.left = child
                else:
                    pre.right = child
            else:
                # If the removed node is the root, reassign the root
                self._root = child
        # Number of child nodes = 2
        else:
            # Get the next node in in-order traversal of cur
            tmp: TreeNode = cur.right
            while tmp.left is not None:
                tmp = tmp.left
            # Recursively remove node tmp
            self.remove(tmp.val)
            # Replace cur with tmp
            cur.val = tmp.val


"""Driver Code"""
if __name__ == "__main__":
    # Initialize binary search tree
    bst = BinarySearchTree()
    nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15]
    # Note that different insertion orders can result in various tree structures. This particular sequence creates a perfect binary tree
    for num in nums:
        bst.insert(num)
    print("\nInitialized binary tree is\n")
    print_tree(bst.get_root())

    # Search node
    node = bst.search(7)
    print("\nFound node object is: {}, node value = {}".format(node, node.val))

    # Insert node
    bst.insert(16)
    print("\nAfter inserting node 16, the binary tree is\n")
    print_tree(bst.get_root())

    # Remove node
    bst.remove(1)
    print("\nAfter removing node 1, the binary tree is\n")
    print_tree(bst.get_root())

    bst.remove(2)
    print("\nAfter removing node 2, the binary tree is\n")
    print_tree(bst.get_root())

    bst.remove(4)
    print("\nAfter removing node 4, the binary tree is\n")
    print_tree(bst.get_root())
