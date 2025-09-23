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
    """現在の状態が解かどうかを判定"""
    return state and state[-1].val == 7


def record_solution(state: list[TreeNode], res: list[list[TreeNode]]):
    """解を記録"""
    res.append(list(state))


def is_valid(state: list[TreeNode], choice: TreeNode) -> bool:
    """現在の状態下で選択が合法かどうかを判定"""
    return choice is not None and choice.val != 3


def make_choice(state: list[TreeNode], choice: TreeNode):
    """状態を更新"""
    state.append(choice)


def undo_choice(state: list[TreeNode], choice: TreeNode):
    """状態を復元"""
    state.pop()


def backtrack(
    state: list[TreeNode], choices: list[TreeNode], res: list[list[TreeNode]]
):
    """バックトラッキングアルゴリズム：例三"""
    # 解かどうかをチェック
    if is_solution(state):
        # 解を記録
        record_solution(state, res)
    # すべての選択肢を走査
    for choice in choices:
        # 枝刈り：選択が合法かどうかをチェック
        if is_valid(state, choice):
            # 試行：選択を行い、状態を更新
            make_choice(state, choice)
            # 次の選択ラウンドに進む
            backtrack(state, [choice.left, choice.right], res)
            # 撤回：選択を取り消し、前の状態に復元
            undo_choice(state, choice)


"""ドライバーコード"""
if __name__ == "__main__":
    root = list_to_tree([1, 7, 3, 4, 5, 6, 7])
    print("\n二分木を初期化")
    print_tree(root)

    # バックトラッキングアルゴリズム
    res = []
    backtrack(state=[], choices=[root], res=res)

    print("\nルートからノード 7 へのすべてのパスを出力、パスに値が 3 のノードを含まないことを要求")
    for path in res:
        print([node.val for node in path])