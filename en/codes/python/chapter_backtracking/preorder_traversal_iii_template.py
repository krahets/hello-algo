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
    """Determine if the current state is a solution"""
    return state and state[-1].val == 7


def record_solution(state: list[TreeNode], res: list[list[TreeNode]]):
    """Record solution"""
    res.append(list(state))


def is_valid(state: list[TreeNode], choice: TreeNode) -> bool:
    """Determine if the choice is legal under the current state"""
    return choice is not None and choice.val != 3


def make_choice(state: list[TreeNode], choice: TreeNode):
    """Update state"""
    state.append(choice)


def undo_choice(state: list[TreeNode], choice: TreeNode):
    """Restore state"""
    state.pop()


def backtrack(
    state: list[TreeNode], choices: list[TreeNode], res: list[list[TreeNode]]
):
    """Backtracking algorithm: Example three"""
    # Check if it's a solution
    if is_solution(state):
        # Record solution
        record_solution(state, res)
    # Traverse all choices
    for choice in choices:
        # Pruning: check if the choice is legal
        if is_valid(state, choice):
            # Attempt: make a choice, update the state
            make_choice(state, choice)
            # Proceed to the next round of selection
            backtrack(state, [choice.left, choice.right], res)
            # Retract: undo the choice, restore to the previous state
            undo_choice(state, choice)


"""Driver Code"""
if __name__ == "__main__":
    root = list_to_tree([1, 7, 3, 4, 5, 6, 7])
    print("\nInitialize binary tree")
    print_tree(root)

    # Backtracking algorithm
    res = []
    backtrack(state=[], choices=[root], res=res)

    print("\nOutput all root-to-node 7 paths, requiring paths not to include nodes with value 3")
    for path in res:
        print([node.val for node in path])
