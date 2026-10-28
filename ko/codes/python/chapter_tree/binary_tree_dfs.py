"""
File: binary_tree_dfs.py
Created Time: 2022-12-20
Author: a16su (lpluls001@gmail.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import TreeNode, list_to_tree, print_tree


def pre_order(root: TreeNode | None):
    """전위 순회"""
    if root is None:
        return
    # 방문 우선순위: 루트 노드 -> 왼쪽 서브트리 -> 오른쪽 서브트리
    res.append(root.val)
    pre_order(root=root.left)
    pre_order(root=root.right)


def in_order(root: TreeNode | None):
    """중위 순회"""
    if root is None:
        return
    # 방문 우선순위: 왼쪽 서브트리 -> 루트 노드 -> 오른쪽 서브트리
    in_order(root=root.left)
    res.append(root.val)
    in_order(root=root.right)


def post_order(root: TreeNode | None):
    """후위 순회"""
    if root is None:
        return
    # 방문 우선순위: 왼쪽 서브트리 -> 오른쪽 서브트리 -> 루트 노드
    post_order(root=root.left)
    post_order(root=root.right)
    res.append(root.val)


"""실행 코드"""
if __name__ == "__main__":
    # 이진 트리 초기화
    # 여기서는 배열로부터 이진 트리를 바로 생성하는 함수를 사용한다
    root = list_to_tree(arr=[1, 2, 3, 4, 5, 6, 7])
    print("\n이진 트리 초기화\n")
    print_tree(root)

    # 전위 순회
    res = []
    pre_order(root)
    print("\n전위 순회의 노드 출력 순서 = ", res)

    # 중위 순회
    res.clear()
    in_order(root)
    print("\n중위 순회의 노드 출력 순서 = ", res)

    # 후위 순회
    res.clear()
    post_order(root)
    print("\n후위 순회의 노드 출력 순서 = ", res)
