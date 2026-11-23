"""
File: binary_search_tree.py
Created Time: 2022-12-20
Author: a16su (lpluls001@gmail.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import TreeNode, print_tree


class BinarySearchTree:
    """이진 탐색 트리"""

    def __init__(self):
        """생성자"""
        # 빈 트리를 초기화한다
        self._root = None

    def get_root(self) -> TreeNode | None:
        """이진 트리의 루트 노드 반환"""
        return self._root

    def search(self, num: int) -> TreeNode | None:
        """노드 탐색"""
        cur = self._root
        # 반복하여 탐색하다 리프 노드를 지나면 종료한다
        while cur is not None:
            # 목표 노드는 cur의 오른쪽 서브트리에 있다
            if cur.val < num:
                cur = cur.right
            # 목표 노드는 cur의 왼쪽 서브트리에 있다
            elif cur.val > num:
                cur = cur.left
            # 목표 노드를 찾았으므로 반복문을 종료한다
            else:
                break
        return cur

    def insert(self, num: int):
        """노드 삽입"""
        # 트리가 비어 있으면 루트 노드를 초기화한다
        if self._root is None:
            self._root = TreeNode(num)
            return
        # 반복하여 탐색하다 리프 노드를 지나면 종료한다
        cur, pre = self._root, None
        while cur is not None:
            # 중복 노드를 찾으면 바로 반환한다
            if cur.val == num:
                return
            pre = cur
            # 삽입 위치는 cur의 오른쪽 서브트리에 있다
            if cur.val < num:
                cur = cur.right
            # 삽입 위치는 cur의 왼쪽 서브트리에 있다
            else:
                cur = cur.left
        # 노드 삽입
        node = TreeNode(num)
        if pre.val < num:
            pre.right = node
        else:
            pre.left = node

    def remove(self, num: int):
        """노드 삭제"""
        # 트리가 비어 있으면 바로 반환하여 종료한다
        if self._root is None:
            return
        # 반복하여 탐색하다 리프 노드를 지나면 종료한다
        cur, pre = self._root, None
        while cur is not None:
            # 삭제할 노드를 찾았으므로 반복문을 종료한다
            if cur.val == num:
                break
            pre = cur
            # 삭제할 노드는 cur의 오른쪽 서브트리에 있다
            if cur.val < num:
                cur = cur.right
            # 삭제할 노드는 cur의 왼쪽 서브트리에 있다
            else:
                cur = cur.left
        # 삭제할 노드가 없으면 바로 반환한다
        if cur is None:
            return

        # 자식 노드 수 = 0 또는 1
        if cur.left is None or cur.right is None:
            # 자식 노드 수 = 0 / 1이면 child = null / 해당 자식 노드이다
            child = cur.left or cur.right
            # 노드 cur를 삭제한다
            if cur != self._root:
                if pre.left == cur:
                    pre.left = child
                else:
                    pre.right = child
            else:
                # 삭제할 노드가 루트 노드이면 루트 노드를 다시 지정한다
                self._root = child
        # 자식 노드 수 = 2
        else:
            # 중위 순회에서 cur의 다음 노드를 구한다
            tmp: TreeNode = cur.right
            while tmp.left is not None:
                tmp = tmp.left
            # 노드 tmp를 재귀적으로 삭제한다
            self.remove(tmp.val)
            # tmp로 cur를 덮어쓴다
            cur.val = tmp.val


"""실행 코드"""
if __name__ == "__main__":
    # 이진 탐색 트리 초기화
    bst = BinarySearchTree()
    nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15]
    # 삽입 순서에 따라 서로 다른 이진 트리가 생성된다. 이 순서는 포화 이진 트리를 생성할 수 있다
    for num in nums:
        bst.insert(num)
    print("\n초기화한 이진 트리\n")
    print_tree(bst.get_root())

    # 노드 탐색
    node = bst.search(7)
    print("\n찾은 노드 객체: {}, 노드 값 = {}".format(node, node.val))

    # 노드 삽입
    bst.insert(16)
    print("\n노드 16을 삽입한 후의 이진 트리\n")
    print_tree(bst.get_root())

    # 노드 삭제
    bst.remove(1)
    print("\n노드 1을 삭제한 후의 이진 트리\n")
    print_tree(bst.get_root())

    bst.remove(2)
    print("\n노드 2를 삭제한 후의 이진 트리\n")
    print_tree(bst.get_root())

    bst.remove(4)
    print("\n노드 4를 삭제한 후의 이진 트리\n")
    print_tree(bst.get_root())
