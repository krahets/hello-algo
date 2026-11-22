"""
File: binary_tree.py
Created Time: 2022-12-20
Author: a16su (lpluls001@gmail.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import TreeNode, print_tree


"""실행 코드"""
if __name__ == "__main__":
    # 이진 트리 초기화
    # 노드 초기화
    n1 = TreeNode(val=1)
    n2 = TreeNode(val=2)
    n3 = TreeNode(val=3)
    n4 = TreeNode(val=4)
    n5 = TreeNode(val=5)
    # 노드 사이의 참조(포인터)를 설정한다
    n1.left = n2
    n1.right = n3
    n2.left = n4
    n2.right = n5
    print("\n이진 트리 초기화\n")
    print_tree(n1)

    # 노드 삽입과 삭제
    P = TreeNode(0)
    # n1 -> n2 사이에 노드 P를 삽입한다
    n1.left = P
    P.left = n2
    print("\n노드 P를 삽입한 후\n")
    print_tree(n1)
    # 노드 삭제
    n1.left = n2
    print("\n노드 P를 삭제한 후\n")
    print_tree(n1)
