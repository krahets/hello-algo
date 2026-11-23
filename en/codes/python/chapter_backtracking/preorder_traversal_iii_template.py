"""
File: preorder_traversal_iii_template.py
Created Time: 2023-04-15
Author: krahets (krahets@163.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import TreeNode, print_tree, list_to_tree


def is_solution(state: list[TreeNode]) -> bool:
    """Check whether the current state is a solution"""
    return state and state[-1].val == 7


def record_solution(state: list[TreeNode], res: list[list[TreeNode]]):
    """Record the solution"""
    res.append(list(state))


def is_valid(state: list[TreeNode], choice: TreeNode) -> bool:
    """Check whether the choice is valid in the current state"""
    return choice is not None and choice.val != 3


def make_choice(state: list[TreeNode], choice: TreeNode):
    """Update the state"""
    state.append(choice)


def undo_choice(state: list[TreeNode], choice: TreeNode):
    """Restore the state"""
    state.pop()


def backtrack(
    state: list[TreeNode], choices: list[TreeNode], res: list[list[TreeNode]]
):
    """Backtracking: example 3"""
    # Check whether this is a solution
    if is_solution(state):
        # Record the solution
        record_solution(state, res)
    # Iterate over all choices
    for choice in choices:
        # Prune: check whether the choice is valid
        if is_valid(state, choice):
            # Try: make a choice and update the state
            make_choice(state, choice)
            # Proceed to the next choice
            backtrack(state, [choice.left, choice.right], res)
            # Backtrack: undo the choice and restore the previous state
            undo_choice(state, choice)


"""Driver code"""
if __name__ == "__main__":
    root = list_to_tree([1, 7, 3, 4, 5, 6, 7])
    print("\nInitialize the binary tree")
    print_tree(root)

    # Backtracking algorithm
    res = []
    backtrack(state=[], choices=[root], res=res)

    print("\nOutput all paths from the root to nodes with value 7, requiring that no node on the path has value 3")
    for path in res:
        print([node.val for node in path])
