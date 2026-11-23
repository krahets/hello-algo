"""
File: preorder_traversal_ii_compact.py
Created Time: 2023-04-15
Author: krahets (krahets@163.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import TreeNode, print_tree, list_to_tree


def pre_order(root: TreeNode):
    """전위 순회: 예제 2"""
    if root is None:
        return
    # 시도
    path.append(root)
    if root.val == 7:
        # 해를 기록한다
        res.append(list(path))
    pre_order(root.left)
    pre_order(root.right)
    # 되돌리기
    path.pop()


"""실행 코드"""
if __name__ == "__main__":
    root = list_to_tree([1, 7, 3, 4, 5, 6, 7])
    print("\n이진 트리 초기화")
    print_tree(root)

    # 전위 순회
    path = list[TreeNode]()
    res = list[list[TreeNode]]()
    pre_order(root)

    print("\n루트 노드에서 노드 7까지의 모든 경로 출력")
    for path in res:
        print([node.val for node in path])
