"""
File: my_heap.py
Created Time: 2023-02-23
Author: krahets (krahets@163.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import print_heap


class MaxHeap:
    """最大ヒープ"""

    def __init__(self, nums: list[int]):
        """入力リストからヒープを構築するコンストラクタ"""
        # リストの要素をそのままヒープに追加する
        self.max_heap = nums
        # 葉以外のすべてのノードをヒープ化する
        for i in range(self.parent(self.size() - 1), -1, -1):
            self.sift_down(i)

    def left(self, i: int) -> int:
        """左の子のインデックスを取得する"""
        return 2 * i + 1

    def right(self, i: int) -> int:
        """右の子のインデックスを取得する"""
        return 2 * i + 2

    def parent(self, i: int) -> int:
        """親のインデックスを取得する"""
        return (i - 1) // 2  # 商を負の無限大方向に切り捨てる

    def swap(self, i: int, j: int):
        """要素を交換する"""
        self.max_heap[i], self.max_heap[j] = self.max_heap[j], self.max_heap[i]

    def size(self) -> int:
        """ヒープのサイズを取得する"""
        return len(self.max_heap)

    def is_empty(self) -> bool:
        """ヒープが空か判定する"""
        return self.size() == 0

    def peek(self) -> int:
        """ヒープの根の要素を参照する"""
        return self.max_heap[0]

    def push(self, val: int):
        """要素をヒープに挿入する"""
        # ノードを追加する
        self.max_heap.append(val)
        # 上に向かってヒープ化する
        self.sift_up(self.size() - 1)

    def sift_up(self, i: int):
        """ノード i から上に向かってヒープ化する"""
        while True:
            # ノード i の親を取得する
            p = self.parent(i)
            # 根を越えるか、ノードを調整する必要がなくなれば、ヒープ化を終える
            if p < 0 or self.max_heap[i] <= self.max_heap[p]:
                break
            # 2 つのノードを交換する
            self.swap(i, p)
            # 上へのヒープ化を繰り返す
            i = p

    def pop(self) -> int:
        """根の要素をヒープから取り出す"""
        # 空の場合の処理
        if self.is_empty():
            raise IndexError("ヒープが空です")
        # 根と最も右の葉（先頭要素と末尾要素）を交換する
        self.swap(0, self.size() - 1)
        # ノードを削除する
        val = self.max_heap.pop()
        # 下に向かってヒープ化する
        self.sift_down(0)
        # 根の要素を返す
        return val

    def sift_down(self, i: int):
        """ノード i から下に向かってヒープ化する"""
        while True:
            # ノード i、l、r のうち値が最大のものを ma とする
            l, r, ma = self.left(i), self.right(i), i
            if l < self.size() and self.max_heap[l] > self.max_heap[ma]:
                ma = l
            if r < self.size() and self.max_heap[r] > self.max_heap[ma]:
                ma = r
            # ノード i が最大か、インデックス l と r がともに範囲外なら、ヒープ化を終えてループを抜ける
            if ma == i:
                break
            # 2 つのノードを交換する
            self.swap(i, ma)
            # 下へのヒープ化を繰り返す
            i = ma

    def print(self):
        """ヒープを二分木として表示する"""
        print_heap(self.max_heap)


"""Driver Code"""
if __name__ == "__main__":
    # 最大ヒープを初期化する
    max_heap = MaxHeap([9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2])
    print("\n入力リストから構築したヒープ：")
    max_heap.print()

    # ヒープの根の要素を取得する
    peek = max_heap.peek()
    print(f"\nヒープの根の要素：{peek}")

    # 要素をヒープに挿入する
    val = 7
    max_heap.push(val)
    print(f"\n要素 {val} の挿入後：")
    max_heap.print()

    # 根の要素を取り出す
    peek = max_heap.pop()
    print(f"\n根の要素 {peek} を取り出した後：")
    max_heap.print()

    # ヒープのサイズを取得する
    size = max_heap.size()
    print(f"\nヒープの要素数：{size}")

    # ヒープが空か判定する
    is_empty = max_heap.is_empty()
    print(f"\nヒープは空か：{is_empty}")
