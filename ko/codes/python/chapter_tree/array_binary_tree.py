"""
File: array_binary_tree.py
Created Time: 2023-07-19
Author: krahets (krahets@163.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import TreeNode, list_to_tree, print_tree


class ArrayBinaryTree:
    """배열로 이진 트리를 표현하는 클래스"""

    def __init__(self, arr: list[int | None]):
        """생성자"""
        self._tree = list(arr)

    def size(self):
        """리스트 용량"""
        return len(self._tree)

    def val(self, i: int) -> int | None:
        """인덱스가 i인 노드의 값을 구한다"""
        # 인덱스가 범위를 벗어나면 빈자리를 뜻하는 None을 반환한다
        if i < 0 or i >= self.size():
            return None
        return self._tree[i]

    def left(self, i: int) -> int | None:
        """인덱스가 i인 노드의 왼쪽 자식 인덱스를 구한다"""
        return 2 * i + 1

    def right(self, i: int) -> int | None:
        """인덱스가 i인 노드의 오른쪽 자식 인덱스를 구한다"""
        return 2 * i + 2

    def parent(self, i: int) -> int | None:
        """인덱스가 i인 노드의 부모 인덱스를 구한다"""
        return (i - 1) // 2

    def level_order(self) -> list[int]:
        """레벨 순회"""
        self.res = []
        # 배열을 직접 순회한다
        for i in range(self.size()):
            if self.val(i) is not None:
                self.res.append(self.val(i))
        return self.res

    def dfs(self, i: int, order: str):
        """깊이 우선 순회"""
        if self.val(i) is None:
            return
        # 전위 순회
        if order == "pre":
            self.res.append(self.val(i))
        self.dfs(self.left(i), order)
        # 중위 순회
        if order == "in":
            self.res.append(self.val(i))
        self.dfs(self.right(i), order)
        # 후위 순회
        if order == "post":
            self.res.append(self.val(i))

    def pre_order(self) -> list[int]:
        """전위 순회"""
        self.res = []
        self.dfs(0, order="pre")
        return self.res

    def in_order(self) -> list[int]:
        """중위 순회"""
        self.res = []
        self.dfs(0, order="in")
        return self.res

    def post_order(self) -> list[int]:
        """후위 순회"""
        self.res = []
        self.dfs(0, order="post")
        return self.res


"""Driver Code"""
if __name__ == "__main__":
    # 이진 트리 초기화
    # 배열에서 바로 이진 트리를 만드는 함수를 사용한다
    arr = [1, 2, 3, 4, None, 6, 7, 8, 9, None, None, 12, None, None, 15]
    root = list_to_tree(arr)
    print("\n이진 트리 초기화\n")
    print("이진 트리의 배열 표현: ")
    print(arr)
    print("이진 트리의 연결 리스트 표현: ")
    print_tree(root)

    # 배열로 이진 트리를 표현하는 클래스
    abt = ArrayBinaryTree(arr)

    # 노드 접근
    i = 1
    l, r, p = abt.left(i), abt.right(i), abt.parent(i)
    print(f"\n현재 노드의 인덱스: {i}, 값: {abt.val(i)}")
    print(f"왼쪽 자식의 인덱스: {l}, 값: {abt.val(l)}")
    print(f"오른쪽 자식의 인덱스: {r}, 값: {abt.val(r)}")
    print(f"부모 노드의 인덱스: {p}, 값: {abt.val(p)}")

    # 트리 순회
    res = abt.level_order()
    print("\n레벨 순회 결과: ", res)
    res = abt.pre_order()
    print("전위 순회 결과: ", res)
    res = abt.in_order()
    print("중위 순회 결과: ", res)
    res = abt.post_order()
    print("후위 순회 결과: ", res)
