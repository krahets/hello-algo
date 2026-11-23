"""
File: binary_tree_bfs.py
Created Time: 2022-12-20
Author: a16su (lpluls001@gmail.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import TreeNode, list_to_tree, print_tree
from collections import deque


def level_order(root: TreeNode | None) -> list[int]:
    """레벨 순서 순회"""
    # 큐를 초기화하고 루트 노드를 넣는다
    queue: deque[TreeNode] = deque()
    queue.append(root)
    # 순회 순서를 저장할 리스트를 초기화한다
    res = []
    while queue:
        node: TreeNode = queue.popleft()  # 큐에서 꺼낸다
        res.append(node.val)  # 노드 값을 저장한다
        if node.left is not None:
            queue.append(node.left)  # 왼쪽 자식 노드를 큐에 삽입한다
        if node.right is not None:
            queue.append(node.right)  # 오른쪽 자식 노드를 큐에 삽입한다
    return res


"""실행 코드"""
if __name__ == "__main__":
    # 이진 트리 초기화
    # 여기서는 배열로부터 이진 트리를 바로 생성하는 함수를 사용한다
    root: TreeNode = list_to_tree(arr=[1, 2, 3, 4, 5, 6, 7])
    print("\n이진 트리 초기화\n")
    print_tree(root)

    # 레벨 순서 순회
    res: list[int] = level_order(root)
    print("\n레벨 순서 순회의 노드 출력 순서 = ", res)
