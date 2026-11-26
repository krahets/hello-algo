"""
File: avl_tree.py
Created Time: 2022-12-20
Author: a16su (lpluls001@gmail.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import TreeNode, print_tree


class AVLTree:
    """AVL 트리"""

    def __init__(self):
        """생성자"""
        self._root = None

    def get_root(self) -> TreeNode | None:
        """이진 트리의 루트 노드 구하기"""
        return self._root

    def height(self, node: TreeNode | None) -> int:
        """노드 높이 구하기"""
        # 빈 노드의 높이는 -1, 리프 노드의 높이는 0이다
        if node is not None:
            return node.height
        return -1

    def update_height(self, node: TreeNode | None):
        """노드 높이 갱신"""
        # 노드 높이는 가장 높은 서브트리의 높이에 1을 더한 값이다
        node.height = max([self.height(node.left), self.height(node.right)]) + 1

    def balance_factor(self, node: TreeNode | None) -> int:
        """균형 인수 구하기"""
        # 빈 노드의 균형 인수는 0이다
        if node is None:
            return 0
        # 노드의 균형 인수 = 왼쪽 서브트리 높이 - 오른쪽 서브트리 높이
        return self.height(node.left) - self.height(node.right)

    def right_rotate(self, node: TreeNode | None) -> TreeNode | None:
        """오른쪽 회전 연산"""
        child = node.left
        grand_child = child.right
        # child를 축으로 node를 오른쪽으로 회전한다
        child.right = node
        node.left = grand_child
        # 노드 높이 갱신
        self.update_height(node)
        self.update_height(child)
        # 회전 후 서브트리의 루트 노드를 반환한다
        return child

    def left_rotate(self, node: TreeNode | None) -> TreeNode | None:
        """왼쪽 회전 연산"""
        child = node.right
        grand_child = child.left
        # child를 축으로 node를 왼쪽으로 회전한다
        child.left = node
        node.right = grand_child
        # 노드 높이 갱신
        self.update_height(node)
        self.update_height(child)
        # 회전 후 서브트리의 루트 노드를 반환한다
        return child

    def rotate(self, node: TreeNode | None) -> TreeNode | None:
        """회전으로 이 서브트리의 균형을 회복한다"""
        # 노드 node의 균형 인수를 구한다
        balance_factor = self.balance_factor(node)
        # 왼쪽으로 치우친 트리
        if balance_factor > 1:
            if self.balance_factor(node.left) >= 0:
                # 오른쪽 회전
                return self.right_rotate(node)
            else:
                # 왼쪽 회전 후 오른쪽 회전
                node.left = self.left_rotate(node.left)
                return self.right_rotate(node)
        # 오른쪽으로 치우친 트리
        elif balance_factor < -1:
            if self.balance_factor(node.right) <= 0:
                # 왼쪽 회전
                return self.left_rotate(node)
            else:
                # 오른쪽 회전 후 왼쪽 회전
                node.right = self.right_rotate(node.right)
                return self.left_rotate(node)
        # 균형이 잡혔으므로 회전 없이 바로 반환한다
        return node

    def insert(self, val):
        """노드 삽입"""
        self._root = self.insert_helper(self._root, val)

    def insert_helper(self, node: TreeNode | None, val: int) -> TreeNode:
        """재귀적 노드 삽입(보조 메서드)"""
        if node is None:
            return TreeNode(val)
        # 1. 삽입 위치를 찾아 노드를 삽입한다
        if val < node.val:
            node.left = self.insert_helper(node.left, val)
        elif val > node.val:
            node.right = self.insert_helper(node.right, val)
        else:
            # 중복 노드는 삽입하지 않고 바로 반환한다
            return node
        # 노드 높이 갱신
        self.update_height(node)
        # 2. 회전으로 이 서브트리의 균형을 회복한다
        return self.rotate(node)

    def remove(self, val: int):
        """노드 삭제"""
        self._root = self.remove_helper(self._root, val)

    def remove_helper(self, node: TreeNode | None, val: int) -> TreeNode | None:
        """재귀적 노드 삭제(보조 메서드)"""
        if node is None:
            return None
        # 1. 노드를 찾아 삭제한다
        if val < node.val:
            node.left = self.remove_helper(node.left, val)
        elif val > node.val:
            node.right = self.remove_helper(node.right, val)
        else:
            if node.left is None or node.right is None:
                child = node.left or node.right
                # 자식 수 = 0. node를 바로 삭제하고 반환한다
                if child is None:
                    return None
                # 자식 수 = 1. node를 바로 삭제한다
                else:
                    node = child
            else:
                # 자식 수 = 2. 중위 순회에서 다음에 오는 노드를 삭제하고 그 값으로 현재 노드의 값을 대체한다
                temp = node.right
                while temp.left is not None:
                    temp = temp.left
                node.right = self.remove_helper(node.right, temp.val)
                node.val = temp.val
        # 노드 높이 갱신
        self.update_height(node)
        # 2. 회전으로 이 서브트리의 균형을 회복한다
        return self.rotate(node)

    def search(self, val: int) -> TreeNode | None:
        """노드 탐색"""
        cur = self._root
        # 반복해서 찾다가 리프 노드를 지나면 종료한다
        while cur is not None:
            # 찾는 노드는 cur의 오른쪽 서브트리에 있다
            if cur.val < val:
                cur = cur.right
            # 찾는 노드는 cur의 왼쪽 서브트리에 있다
            elif cur.val > val:
                cur = cur.left
            # 찾는 노드를 발견했으므로 반복문을 종료한다
            else:
                break
        # 찾은 노드를 반환한다
        return cur


"""Driver Code"""
if __name__ == "__main__":

    def test_insert(tree: AVLTree, val: int):
        tree.insert(val)
        print("\n노드 {} 삽입 후 AVL 트리:".format(val))
        print_tree(tree.get_root())

    def test_remove(tree: AVLTree, val: int):
        tree.remove(val)
        print("\n노드 {} 삭제 후 AVL 트리:".format(val))
        print_tree(tree.get_root())

    # 빈 AVL 트리 초기화
    avl_tree = AVLTree()

    # 노드 삽입
    # 노드를 삽입한 뒤 AVL 트리가 어떻게 균형을 유지하는지 살펴본다
    for val in [1, 2, 3, 4, 5, 8, 7, 9, 10, 6]:
        test_insert(avl_tree, val)

    # 중복 노드 삽입
    test_insert(avl_tree, 7)

    # 노드 삭제
    # 노드를 삭제한 뒤 AVL 트리가 어떻게 균형을 유지하는지 살펴본다
    test_remove(avl_tree, 8)  # 차수가 0인 노드 삭제
    test_remove(avl_tree, 5)  # 차수가 1인 노드 삭제
    test_remove(avl_tree, 4)  # 차수가 2인 노드 삭제

    result_node = avl_tree.search(7)
    print("\n찾은 노드 객체: {}, 노드 값 = {}".format(result_node, result_node.val))
