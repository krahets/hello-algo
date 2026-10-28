"""
File: preorder_traversal_i_compact.py
Created Time: 2023-04-15
Author: krahets (krahets@163.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import TreeNode, print_tree, list_to_tree


def pre_order(root: TreeNode):
    """전위 순회: 예제 1"""
    if root is None:
        return
    if root.val == 7:
        # 해를 기록한다
        res.append(root)
    pre_order(root.left)
    pre_order(root.right)


"""실행 코드"""
if __name__ == "__main__":
    root = list_to_tree([1, 7, 3, 4, 5, 6, 7])
    print("\n이진 트리 초기화")
    print_tree(root)

    # 전위 순회
    res = list[TreeNode]()
    pre_order(root)

    print("\n값이 7인 모든 노드 출력")
    print([node.val for node in res])
