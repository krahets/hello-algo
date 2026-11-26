"""
File: avl_tree.py
Created Time: 2022-12-20
Author: a16su (lpluls001@gmail.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import TreeNode, print_tree


class AVLTree:
    """AVL tree"""

    def __init__(self):
        """Constructor"""
        self._root = None

    def get_root(self) -> TreeNode | None:
        """Get the root of the binary tree"""
        return self._root

    def height(self, node: TreeNode | None) -> int:
        """Get the node height"""
        # A null node has height -1, and a leaf has height 0
        if node is not None:
            return node.height
        return -1

    def update_height(self, node: TreeNode | None):
        """Update the node height"""
        # Node height is the height of the taller subtree plus 1
        node.height = max([self.height(node.left), self.height(node.right)]) + 1

    def balance_factor(self, node: TreeNode | None) -> int:
        """Get the balance factor"""
        # A null node has a balance factor of 0
        if node is None:
            return 0
        # Balance factor = left subtree height - right subtree height
        return self.height(node.left) - self.height(node.right)

    def right_rotate(self, node: TreeNode | None) -> TreeNode | None:
        """Right rotation"""
        child = node.left
        grand_child = child.right
        # Rotate node to the right around child
        child.right = node
        node.left = grand_child
        # Update the node height
        self.update_height(node)
        self.update_height(child)
        # Return the root of the rotated subtree
        return child

    def left_rotate(self, node: TreeNode | None) -> TreeNode | None:
        """Left rotation"""
        child = node.right
        grand_child = child.left
        # Rotate node to the left around child
        child.left = node
        node.right = grand_child
        # Update the node height
        self.update_height(node)
        self.update_height(child)
        # Return the root of the rotated subtree
        return child

    def rotate(self, node: TreeNode | None) -> TreeNode | None:
        """Rebalance the subtree by rotating it"""
        # Get the balance factor of node
        balance_factor = self.balance_factor(node)
        # Left-heavy tree
        if balance_factor > 1:
            if self.balance_factor(node.left) >= 0:
                # Rotate right
                return self.right_rotate(node)
            else:
                # Rotate left, then right
                node.left = self.left_rotate(node.left)
                return self.right_rotate(node)
        # Right-heavy tree
        elif balance_factor < -1:
            if self.balance_factor(node.right) <= 0:
                # Rotate left
                return self.left_rotate(node)
            else:
                # Rotate right, then left
                node.right = self.right_rotate(node.right)
                return self.left_rotate(node)
        # The tree is balanced, so return without rotating
        return node

    def insert(self, val):
        """Insert a node"""
        self._root = self.insert_helper(self._root, val)

    def insert_helper(self, node: TreeNode | None, val: int) -> TreeNode:
        """Insert a node recursively (helper method)"""
        if node is None:
            return TreeNode(val)
        # 1. Find the insertion position and insert the node
        if val < node.val:
            node.left = self.insert_helper(node.left, val)
        elif val > node.val:
            node.right = self.insert_helper(node.right, val)
        else:
            # Return without inserting a duplicate
            return node
        # Update the node height
        self.update_height(node)
        # 2. Rebalance the subtree by rotating it
        return self.rotate(node)

    def remove(self, val: int):
        """Delete a node"""
        self._root = self.remove_helper(self._root, val)

    def remove_helper(self, node: TreeNode | None, val: int) -> TreeNode | None:
        """Delete a node recursively (helper method)"""
        if node is None:
            return None
        # 1. Find the node and delete it
        if val < node.val:
            node.left = self.remove_helper(node.left, val)
        elif val > node.val:
            node.right = self.remove_helper(node.right, val)
        else:
            if node.left is None or node.right is None:
                child = node.left or node.right
                # No children: delete node and return
                if child is None:
                    return None
                # One child: delete node
                else:
                    node = child
            else:
                # Two children: delete the inorder successor and use it to replace the current node
                temp = node.right
                while temp.left is not None:
                    temp = temp.left
                node.right = self.remove_helper(node.right, temp.val)
                node.val = temp.val
        # Update the node height
        self.update_height(node)
        # 2. Rebalance the subtree by rotating it
        return self.rotate(node)

    def search(self, val: int) -> TreeNode | None:
        """Search for a node"""
        cur = self._root
        # Stop the search after passing a leaf
        while cur is not None:
            # The target is in the right subtree of cur
            if cur.val < val:
                cur = cur.right
            # The target is in the left subtree of cur
            elif cur.val > val:
                cur = cur.left
            # The target was found, so exit the loop
            else:
                break
        # Return the target node
        return cur


"""Driver Code"""
if __name__ == "__main__":

    def test_insert(tree: AVLTree, val: int):
        tree.insert(val)
        print("\nAVL tree after inserting {}:".format(val))
        print_tree(tree.get_root())

    def test_remove(tree: AVLTree, val: int):
        tree.remove(val)
        print("\nAVL tree after deleting {}:".format(val))
        print_tree(tree.get_root())

    # Initialize an empty AVL tree
    avl_tree = AVLTree()

    # Insert a node
    # Watch how the AVL tree stays balanced after an insertion
    for val in [1, 2, 3, 4, 5, 8, 7, 9, 10, 6]:
        test_insert(avl_tree, val)

    # Insert a duplicate node
    test_insert(avl_tree, 7)

    # Delete a node
    # Watch how the AVL tree stays balanced after a deletion
    test_remove(avl_tree, 8)  # Delete a node with no children
    test_remove(avl_tree, 5)  # Delete a node with one child
    test_remove(avl_tree, 4)  # Delete a node with two children

    result_node = avl_tree.search(7)
    print("\nNode found: {}, node value = {}".format(result_node, result_node.val))
