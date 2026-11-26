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
        # Initialize an empty tree
        self._root = None

    def get_root(self) -> TreeNode | None:
        """Get the root of the binary tree"""
        return self._root

    def search(self, num: int) -> TreeNode | None:
        """Search for a node"""
        cur = self._root
        # Stop the search after passing a leaf
        while cur is not None:
            # The target is in the right subtree of cur
            if cur.val < num:
                cur = cur.right
            # The target is in the left subtree of cur
            elif cur.val > num:
                cur = cur.left
            # The target was found, so exit the loop
            else:
                break
        return cur

    def insert(self, num: int):
        """Insert a node"""
        # If the tree is empty, initialize the root
        if self._root is None:
            self._root = TreeNode(num)
            return
        # Stop the search after passing a leaf
        cur, pre = self._root, None
        while cur is not None:
            # Return if a duplicate is found
            if cur.val == num:
                return
            pre = cur
            # The insertion position is in the right subtree of cur
            if cur.val < num:
                cur = cur.right
            # The insertion position is in the left subtree of cur
            else:
                cur = cur.left
        # Insert a node
        node = TreeNode(num)
        if pre.val < num:
            pre.right = node
        else:
            pre.left = node

    def remove(self, num: int):
        """Delete a node"""
        # Return immediately if the tree is empty
        if self._root is None:
            return
        # Stop the search after passing a leaf
        cur, pre = self._root, None
        while cur is not None:
            # The node to delete was found, so exit the loop
            if cur.val == num:
                break
            pre = cur
            # The node to delete is in the right subtree of cur
            if cur.val < num:
                cur = cur.right
            # The node to delete is in the left subtree of cur
            else:
                cur = cur.left
        # Return if the node to delete does not exist
        if cur is None:
            return

        # Number of children = 0 or 1
        if cur.left is None or cur.right is None:
            # With no children, child = null. With one child, child is that child.
            child = cur.left or cur.right
            # Delete node cur
            if cur != self._root:
                if pre.left == cur:
                    pre.left = child
                else:
                    pre.right = child
            else:
                # If deleting the root, assign a new root
                self._root = child
        # Number of children = 2
        else:
            # Get the inorder successor of cur
            tmp: TreeNode = cur.right
            while tmp.left is not None:
                tmp = tmp.left
            # Recursively delete node tmp
            self.remove(tmp.val)
            # Replace the value of cur with that of tmp
            cur.val = tmp.val


"""Driver Code"""
if __name__ == "__main__":
    # Initialize the binary search tree
    bst = BinarySearchTree()
    nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15]
    # Different insertion orders produce different tree shapes. This sequence produces a perfect binary tree.
    for num in nums:
        bst.insert(num)
    print("\nInitial binary tree:\n")
    print_tree(bst.get_root())

    # Search for a node
    node = bst.search(7)
    print("\nNode found: {}, node value = {}".format(node, node.val))

    # Insert a node
    bst.insert(16)
    print("\nBinary tree after inserting node 16:\n")
    print_tree(bst.get_root())

    # Delete a node
    bst.remove(1)
    print("\nBinary tree after deleting node 1:\n")
    print_tree(bst.get_root())

    bst.remove(2)
    print("\nBinary tree after deleting node 2:\n")
    print_tree(bst.get_root())

    bst.remove(4)
    print("\nBinary tree after deleting node 4:\n")
    print_tree(bst.get_root())
