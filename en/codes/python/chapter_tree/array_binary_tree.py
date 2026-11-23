"""
File: array_binary_tree.py
Created Time: 2023-07-19
Author: krahets (krahets@163.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import TreeNode, list_to_tree, print_tree


class ArrayBinaryTree:
    """Binary tree class using an array representation"""

    def __init__(self, arr: list[int | None]):
        """Constructor"""
        self._tree = list(arr)

    def size(self):
        """Length of the backing list"""
        return len(self._tree)

    def val(self, i: int) -> int | None:
        """Get the value of the node at index i"""
        # If the index is out of bounds, return None to represent an empty position
        if i < 0 or i >= self.size():
            return None
        return self._tree[i]

    def left(self, i: int) -> int | None:
        """Get the left child index of the node at index i"""
        return 2 * i + 1

    def right(self, i: int) -> int | None:
        """Get the right child index of the node at index i"""
        return 2 * i + 2

    def parent(self, i: int) -> int | None:
        """Get the parent index of the node at index i"""
        return (i - 1) // 2

    def level_order(self) -> list[int]:
        """Level-order traversal"""
        self.res = []
        # Traverse the array directly
        for i in range(self.size()):
            if self.val(i) is not None:
                self.res.append(self.val(i))
        return self.res

    def dfs(self, i: int, order: str):
        """Depth-first traversal"""
        if self.val(i) is None:
            return
        # Preorder traversal
        if order == "pre":
            self.res.append(self.val(i))
        self.dfs(self.left(i), order)
        # Inorder traversal
        if order == "in":
            self.res.append(self.val(i))
        self.dfs(self.right(i), order)
        # Postorder traversal
        if order == "post":
            self.res.append(self.val(i))

    def pre_order(self) -> list[int]:
        """Preorder traversal"""
        self.res = []
        self.dfs(0, order="pre")
        return self.res

    def in_order(self) -> list[int]:
        """Inorder traversal"""
        self.res = []
        self.dfs(0, order="in")
        return self.res

    def post_order(self) -> list[int]:
        """Postorder traversal"""
        self.res = []
        self.dfs(0, order="post")
        return self.res


"""Driver code"""
if __name__ == "__main__":
    # Initialize the binary tree
    # Use a helper function that builds a binary tree directly from an array
    arr = [1, 2, 3, 4, None, 6, 7, 8, 9, None, None, 12, None, None, 15]
    root = list_to_tree(arr)
    print("\nInitialize the binary tree\n")
    print("Array representation of the binary tree:")
    print(arr)
    print("Linked representation of the binary tree:")
    print_tree(root)

    # Binary tree class using an array representation
    abt = ArrayBinaryTree(arr)

    # Access a node
    i = 1
    l, r, p = abt.left(i), abt.right(i), abt.parent(i)
    print(f"\nCurrent node index: {i}, value: {abt.val(i)}")
    print(f"Left child index: {l}, value: {abt.val(l)}")
    print(f"Right child index: {r}, value: {abt.val(r)}")
    print(f"Parent index: {p}, value: {abt.val(p)}")

    # Traverse the tree
    res = abt.level_order()
    print("\nLevel-order traversal:", res)
    res = abt.pre_order()
    print("Preorder traversal:", res)
    res = abt.in_order()
    print("Inorder traversal:", res)
    res = abt.post_order()
    print("Postorder traversal:", res)
