"""
File: build_tree.py
Created Time: 2023-07-15
Author: krahets (krahets@163.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import TreeNode, print_tree


def dfs(
    preorder: list[int],
    inorder_map: dict[int, int],
    i: int,
    l: int,
    r: int,
) -> TreeNode | None:
    """이진 트리 구성: 분할 정복"""
    # 서브트리 구간이 비어 있으면 종료한다
    if r - l < 0:
        return None
    # 루트 노드를 초기화한다
    root = TreeNode(preorder[i])
    # m을 조회하여 왼쪽과 오른쪽 서브트리를 나눈다
    m = inorder_map[preorder[i]]
    # 부분 문제: 왼쪽 서브트리 구성
    root.left = dfs(preorder, inorder_map, i + 1, l, m - 1)
    # 부분 문제: 오른쪽 서브트리 구성
    root.right = dfs(preorder, inorder_map, i + 1 + m - l, m + 1, r)
    # 루트 노드를 반환한다
    return root


def build_tree(preorder: list[int], inorder: list[int]) -> TreeNode | None:
    """이진 트리 구성"""
    # inorder 원소와 인덱스의 대응 관계를 저장할 해시 테이블을 초기화한다
    inorder_map = {val: i for i, val in enumerate(inorder)}
    root = dfs(preorder, inorder_map, 0, 0, len(inorder) - 1)
    return root


"""실행 코드"""
if __name__ == "__main__":
    preorder = [3, 9, 2, 1, 7]
    inorder = [9, 3, 1, 2, 7]
    print(f"전위 순회 = {preorder}")
    print(f"중위 순회 = {inorder}")

    root = build_tree(preorder, inorder)
    print("구성한 이진 트리:")
    print_tree(root)
