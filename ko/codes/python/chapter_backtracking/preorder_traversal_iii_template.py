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
    """현재 상태가 해인지 판단"""
    return state and state[-1].val == 7


def record_solution(state: list[TreeNode], res: list[list[TreeNode]]):
    """해를 기록한다"""
    res.append(list(state))


def is_valid(state: list[TreeNode], choice: TreeNode) -> bool:
    """현재 상태에서 해당 선택이 유효한지 판단"""
    return choice is not None and choice.val != 3


def make_choice(state: list[TreeNode], choice: TreeNode):
    """상태 갱신"""
    state.append(choice)


def undo_choice(state: list[TreeNode], choice: TreeNode):
    """상태 복원"""
    state.pop()


def backtrack(
    state: list[TreeNode], choices: list[TreeNode], res: list[list[TreeNode]]
):
    """백트래킹 알고리즘: 예제 3"""
    # 해인지 확인한다
    if is_solution(state):
        # 해를 기록한다
        record_solution(state, res)
    # 모든 선택지를 순회한다
    for choice in choices:
        # 가지치기: 선택이 유효한지 확인한다
        if is_valid(state, choice):
            # 시도: 선택하고 상태를 갱신한다
            make_choice(state, choice)
            # 다음 선택을 진행한다
            backtrack(state, [choice.left, choice.right], res)
            # 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
            undo_choice(state, choice)


"""실행 코드"""
if __name__ == "__main__":
    root = list_to_tree([1, 7, 3, 4, 5, 6, 7])
    print("\n이진 트리 초기화")
    print_tree(root)

    # 백트래킹 알고리즘
    res = []
    backtrack(state=[], choices=[root], res=res)

    print("\n값이 3인 노드를 포함하지 않는 조건으로, 루트 노드에서 노드 7까지의 모든 경로 출력")
    for path in res:
        print([node.val for node in path])
