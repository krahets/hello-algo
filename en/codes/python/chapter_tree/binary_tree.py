"""
File: binary_tree.py
Created Time: 2022-12-20
Author: a16su (lpluls001@gmail.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import TreeNode, print_tree


"""Driver Code"""
if __name__ == "__main__":
    # Initialize binary tree
    # Initialize node
    n1 = TreeNode(val=1)
    n2 = TreeNode(val=2)
    n3 = TreeNode(val=3)
    n4 = TreeNode(val=4)
    n5 = TreeNode(val=5)
    # Construct node references (pointers)
    n1.left = n2
    n1.right = n3
    n2.left = n4
    n2.right = n5
    print("\nInitialize binary tree\n")
    print_tree(n1)

    # Insert and remove nodes
    P = TreeNode(0)
    # Insert node P between n1 -> n2
    n1.left = P
    P.left = n2
    print("\nAfter inserting node P\n")
    print_tree(n1)
    # Remove node
    n1.left = n2
    print("\nAfter removing node P\n")
    print_tree(n1)
