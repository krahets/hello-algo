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
    """現在の状態が解かどうか判定する"""
    return state and state[-1].val == 7


def record_solution(state: list[TreeNode], res: list[list[TreeNode]]):
    """解を記録する"""
    res.append(list(state))


def is_valid(state: list[TreeNode], choice: TreeNode) -> bool:
    """現在の状態でその選択が可能か判定する"""
    return choice is not None and choice.val != 3


def make_choice(state: list[TreeNode], choice: TreeNode):
    """状態を更新する"""
    state.append(choice)


def undo_choice(state: list[TreeNode], choice: TreeNode):
    """状態を元に戻す"""
    state.pop()


def backtrack(
    state: list[TreeNode], choices: list[TreeNode], res: list[list[TreeNode]]
):
    """バックトラッキング：例題 3"""
    # 解かどうか調べる
    if is_solution(state):
        # 解を記録する
        record_solution(state, res)
    # すべての選択肢を調べる
    for choice in choices:
        # 枝刈り：その選択が可能か調べる
        if is_valid(state, choice):
            # 試行：選択して状態を更新する
            make_choice(state, choice)
            # 次の選択に進む
            backtrack(state, [choice.left, choice.right], res)
            # 後戻り：選択を取り消し、元の状態に戻す
            undo_choice(state, choice)


"""Driver Code"""
if __name__ == "__main__":
    root = list_to_tree([1, 7, 3, 4, 5, 6, 7])
    print("\n二分木を初期化")
    print_tree(root)

    # バックトラッキング
    res = []
    backtrack(state=[], choices=[root], res=res)

    print("\n根から値が 7 のノードまでの経路のうち、値が 3 のノードを含まないものをすべて出力")
    for path in res:
        print([node.val for node in path])
