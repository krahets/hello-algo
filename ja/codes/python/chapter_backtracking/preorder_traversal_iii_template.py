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
    """現在の状態が解かを判定"""
    return state and state[-1].val == 7


def record_solution(state: list[TreeNode], res: list[list[TreeNode]]):
    """解を記録する"""
    res.append(list(state))


def is_valid(state: list[TreeNode], choice: TreeNode) -> bool:
    """現在の状態でこの選択が有効か判定"""
    return choice is not None and choice.val != 3


def make_choice(state: list[TreeNode], choice: TreeNode):
    """状態を更新する"""
    state.append(choice)


def undo_choice(state: list[TreeNode], choice: TreeNode):
    """状態を復元する"""
    state.pop()


def backtrack(
    state: list[TreeNode], choices: list[TreeNode], res: list[list[TreeNode]]
):
    """バックトラッキング：例題 3"""
    # 解かを確認
    if is_solution(state):
        # 解を記録する
        record_solution(state, res)
    # すべての選択肢を走査する
    for choice in choices:
        # 枝刈り：選択が有効か確認
        if is_valid(state, choice):
            # 試行：選択を行い、状態を更新する
            make_choice(state, choice)
            # 次の選択に進む
            backtrack(state, [choice.left, choice.right], res)
            # 復元：選択を取り消し、以前の状態に戻す
            undo_choice(state, choice)


"""実行用コード"""
if __name__ == "__main__":
    root = list_to_tree([1, 7, 3, 4, 5, 6, 7])
    print("\n二分木を初期化する")
    print_tree(root)

    # バックトラッキング
    res = []
    backtrack(state=[], choices=[root], res=res)

    print("\n値が 3 のノードを含まない、根ノードからノード 7 までのすべての経路を出力する")
    for path in res:
        print([node.val for node in path])
