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
    """Binary tree class represented by array"""

    def __init__(self, arr: list[int | None]):
        """Constructor"""
        self._tree = list(arr)

    def size(self):
        """List capacity"""
        return len(self._tree)

    def val(self, i: int) -> int | None:
        """Get value of node at index i"""
        # If index is out of bounds, return None, representing empty position
        if i < 0 or i >= self.size():
            return None
        return self._tree[i]

    def left(self, i: int) -> int | None:
        """Get index of left child node of node at index i"""
        return 2 * i + 1

    def right(self, i: int) -> int | None:
        """Get index of right child node of node at index i"""
        return 2 * i + 2

    def parent(self, i: int) -> int | None:
        """Get index of parent node of node at index i"""
        return (i - 1) // 2

    def level_order(self) -> list[int]:
        """Level-order traversal"""
        self.res = []
        # Traverse array directly
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


"""Driver Code"""
if __name__ == "__main__":
    # Initialize binary tree
    # Here we use a function to generate a binary tree directly from an array
    arr = [1, 2, 3, 4, None, 6, 7, 8, 9, None, None, 12, None, None, 15]
    root = list_to_tree(arr)
    print("\nInitialize binary tree\n")
    print("Array representation of binary tree:")
    print(arr)
    print("Linked list representation of binary tree:")
    print_tree(root)

    # Binary tree class represented by array
    abt = ArrayBinaryTree(arr)

    # Access nodes
    i = 1
    l, r, p = abt.left(i), abt.right(i), abt.parent(i)
    print(f"\nCurrent node's index is {i}, value is {abt.val(i)}")
    print(f"Its left child node's index is {l}, value is {abt.val(l)}")
    print(f"Its right child node's index is {r}, value is {abt.val(r)}")
    print(f"Its parent node's index is {p}, value is {abt.val(p)}")

    # Traverse tree
    res = abt.level_order()
    print("\nLevel-order traversal is:", res)
    res = abt.pre_order()
    print("Preorder traversal is:", res)
    res = abt.in_order()
    print("Inorder traversal is:", res)
    res = abt.post_order()
    print("Postorder traversal is:", res)
