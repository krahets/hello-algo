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
        # 빈 트리 초기화
        self._root = None

    def get_root(self) -> TreeNode | None:
        """이진 트리의 루트 노드 구하기"""
        return self._root

    def search(self, num: int) -> TreeNode | None:
        """노드 탐색"""
        cur = self._root
        # 반복해서 찾다가 리프 노드를 지나면 종료한다
        while cur is not None:
            # 찾는 노드는 cur의 오른쪽 서브트리에 있다
            if cur.val < num:
                cur = cur.right
            # 찾는 노드는 cur의 왼쪽 서브트리에 있다
            elif cur.val > num:
                cur = cur.left
            # 찾는 노드를 발견했으므로 반복문을 종료한다
            else:
                break
        return cur

    def insert(self, num: int):
        """노드 삽입"""
        # 트리가 비어 있으면 루트 노드를 초기화한다
        if self._root is None:
            self._root = TreeNode(num)
            return
        # 반복해서 찾다가 리프 노드를 지나면 종료한다
        cur, pre = self._root, None
        while cur is not None:
            # 같은 값의 노드를 찾으면 바로 반환한다
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
        # 트리가 비어 있으면 바로 반환한다
        if self._root is None:
            return
        # 반복해서 찾다가 리프 노드를 지나면 종료한다
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

        # 자식 수 = 0 또는 1
        if cur.left is None or cur.right is None:
            # 자식 수가 0이면 child는 null, 1이면 child는 그 자식 노드다
            child = cur.left or cur.right
            # 노드 cur 삭제
            if cur != self._root:
                if pre.left == cur:
                    pre.left = child
                else:
                    pre.right = child
            else:
                # 삭제할 노드가 루트라면 루트 노드를 다시 지정한다
                self._root = child
        # 자식 수 = 2
        else:
            # 중위 순회에서 cur 다음에 오는 노드를 구한다
            tmp: TreeNode = cur.right
            while tmp.left is not None:
                tmp = tmp.left
            # 노드 tmp를 재귀적으로 삭제한다
            self.remove(tmp.val)
            # cur의 값을 tmp의 값으로 덮어쓴다
            cur.val = tmp.val


"""Driver Code"""
if __name__ == "__main__":
    # 이진 탐색 트리 초기화
    bst = BinarySearchTree()
    nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15]
    # 삽입 순서가 다르면 이진 트리의 모양도 달라진다. 이 순서로 삽입하면 포화 이진 트리가 만들어진다
    for num in nums:
        bst.insert(num)
    print("\n초기화한 이진 트리:\n")
    print_tree(bst.get_root())

    # 노드 탐색
    node = bst.search(7)
    print("\n찾은 노드 객체: {}, 노드 값 = {}".format(node, node.val))

    # 노드 삽입
    bst.insert(16)
    print("\n노드 16 삽입 후 이진 트리:\n")
    print_tree(bst.get_root())

    # 노드 삭제
    bst.remove(1)
    print("\n노드 1 삭제 후 이진 트리:\n")
    print_tree(bst.get_root())

    bst.remove(2)
    print("\n노드 2 삭제 후 이진 트리:\n")
    print_tree(bst.get_root())

    bst.remove(4)
    print("\n노드 4 삭제 후 이진 트리:\n")
    print_tree(bst.get_root())
