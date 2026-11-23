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
        """Find a node"""
        cur = self._root
        # Search in a loop, stopping if cur becomes None
        while cur is not None:
            # If present, the target node is in the right subtree of cur
            if cur.val < num:
                cur = cur.right
            # If present, the target node is in the left subtree of cur
            elif cur.val > num:
                cur = cur.left
            # The target node was found; exit the loop
            else:
                break
        return cur

    def insert(self, num: int):
        """Insert a node"""
        # If the tree is empty, initialize the root node
        if self._root is None:
            self._root = TreeNode(num)
            return
        # Search in a loop, stopping if cur becomes None
        cur, pre = self._root, None
        while cur is not None:
            # Return immediately if a duplicate node is found
            if cur.val == num:
                return
            pre = cur
            # The insertion position lies in the right subtree of cur
            if cur.val < num:
                cur = cur.right
            # The insertion position lies in the left subtree of cur
            else:
                cur = cur.left
        # Insert a node
        node = TreeNode(num)
        if pre.val < num:
            pre.right = node
        else:
            pre.left = node

    def remove(self, num: int):
        """Remove a node"""
        # Return immediately if the tree is empty
        if self._root is None:
            return
        # Search in a loop, stopping if cur becomes None
        cur, pre = self._root, None
        while cur is not None:
            # The node to remove was found; exit the loop
            if cur.val == num:
                break
            pre = cur
            # If present, the node to remove is in the right subtree of cur
            if cur.val < num:
                cur = cur.right
            # If present, the node to remove is in the left subtree of cur
            else:
                cur = cur.left
        # Return immediately if the node to remove does not exist
        if cur is None:
            return

        # Number of children = 0 or 1
        if cur.left is None or cur.right is None:
            # With 0 or 1 child, child is None or that child, respectively
            child = cur.left or cur.right
            # Remove node cur
            if cur != self._root:
                if pre.left == cur:
                    pre.left = child
                else:
                    pre.right = child
            else:
                # If the removed node is the root, assign the new root
                self._root = child
        # Number of children = 2
        else:
            # Get the inorder successor of cur
            tmp: TreeNode = cur.right
            while tmp.left is not None:
                tmp = tmp.left
            # Recursively remove node tmp
            self.remove(tmp.val)
            # Replace the value of cur with the value of tmp
            cur.val = tmp.val


"""Driver code"""
if __name__ == "__main__":
    # Initialize the binary search tree
    bst = BinarySearchTree()
    nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15]
    # Different insertion orders produce different binary trees; this sequence produces a perfect binary tree
    for num in nums:
        bst.insert(num)
    print("\nThe initialized binary tree is:\n")
    print_tree(bst.get_root())

    # Find a node
    node = bst.search(7)
    print("\nFound node object: {}, node value = {}".format(node, node.val))

    # Insert a node
    bst.insert(16)
    print("\nBinary tree after inserting node 16:\n")
    print_tree(bst.get_root())

    # Remove a node
    bst.remove(1)
    print("\nBinary tree after removing node 1:\n")
    print_tree(bst.get_root())

    bst.remove(2)
    print("\nBinary tree after removing node 2:\n")
    print_tree(bst.get_root())

    bst.remove(4)
    print("\nBinary tree after removing node 4:\n")
    print_tree(bst.get_root())
