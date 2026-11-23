"""
File: tree_node.py
Created Time: 2021-12-11
Author: krahets (krahets@163.com)
"""

from collections import deque


class TreeNode:
    """이진 트리 노드 클래스"""

    def __init__(self, val: int = 0):
        self.val: int = val  # 노드 값
        self.height: int = 0  # 노드 높이
        self.left: TreeNode | None = None  # 왼쪽 자식 노드 참조
        self.right: TreeNode | None = None  # 오른쪽 자식 노드 참조

    # 직렬화 인코딩 규칙은 다음을 참고한다:
    # https://www.hello-algo.com/ko/chapter_tree/array_representation_of_tree/
    # 이진 트리의 배열 표현:
    # [1, 2, 3, 4, None, 6, 7, 8, 9, None, None, 12, None, None, 15]
    # 이진 트리의 연결 리스트 표현:
    #             /——— 15
    #         /——— 7
    #     /——— 3
    #    |    \——— 6
    #    |        \——— 12
    # ——— 1
    #     \——— 2
    #        |    /——— 9
    #         \——— 4
    #             \——— 8


def list_to_tree_dfs(arr: list[int], i: int) -> TreeNode | None:
    """리스트를 이진 트리로 역직렬화: 재귀"""
    # 인덱스가 배열 길이를 벗어나거나 해당 원소가 None이면 None을 반환한다
    if i < 0 or i >= len(arr) or arr[i] is None:
        return None
    # 현재 노드를 생성한다
    root = TreeNode(arr[i])
    # 왼쪽과 오른쪽 서브트리를 재귀적으로 구성한다
    root.left = list_to_tree_dfs(arr, 2 * i + 1)
    root.right = list_to_tree_dfs(arr, 2 * i + 2)
    return root


def list_to_tree(arr: list[int]) -> TreeNode | None:
    """리스트를 이진 트리로 역직렬화"""
    return list_to_tree_dfs(arr, 0)


def tree_to_list_dfs(root: TreeNode, i: int, res: list[int]) -> list[int]:
    """이진 트리를 리스트로 직렬화: 재귀"""
    if root is None:
        return
    if i >= len(res):
        res += [None] * (i - len(res) + 1)
    res[i] = root.val
    tree_to_list_dfs(root.left, 2 * i + 1, res)
    tree_to_list_dfs(root.right, 2 * i + 2, res)


def tree_to_list(root: TreeNode | None) -> list[int]:
    """이진 트리를 리스트로 직렬화"""
    res = []
    tree_to_list_dfs(root, 0, res)
    return res
