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
    """判斷當前狀態是否為解"""
    return state and state[-1].val == 7


def record_solution(state: list[TreeNode], res: list[list[TreeNode]]):
    """記錄解"""
    res.append(list(state))


def is_valid(state: list[TreeNode], choice: TreeNode) -> bool:
    """判斷在當前狀態下，該選擇是否合法"""
    return choice is not None and choice.val != 3


def make_choice(state: list[TreeNode], choice: TreeNode):
    """更新狀態"""
    state.append(choice)


def undo_choice(state: list[TreeNode], choice: TreeNode):
    """恢復狀態"""
    state.pop()


def backtrack(
    state: list[TreeNode], choices: list[TreeNode], res: list[list[TreeNode]]
):
    """回溯演算法：例題三"""
    # 檢查是否為解
    if is_solution(state):
        # 記錄解
        record_solution(state, res)
    # 走訪所有選擇
    for choice in choices:
        # 剪枝：檢查選擇是否合法
        if is_valid(state, choice):
            # 嘗試：做出選擇，更新狀態
            make_choice(state, choice)
            # 進行下一輪選擇
            backtrack(state, [choice.left, choice.right], res)
            # 回退：撤銷選擇，恢復到之前的狀態
            undo_choice(state, choice)


"""Driver Code"""
if __name__ == "__main__":
    root = list_to_tree([1, 7, 3, 4, 5, 6, 7])
    print("\n初始化二元樹")
    print_tree(root)

    # 回溯演算法
    res = []
    backtrack(state=[], choices=[root], res=res)

    print("\n輸出所有根節點到節點 7 的路徑，要求路徑中不包含值為 3 的節點")
    for path in res:
        print([node.val for node in path])
