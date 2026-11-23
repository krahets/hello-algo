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
        """コンストラクタ：入力リストからヒープを構築する"""
        # リストの要素をそのままヒープに追加する
        self.max_heap = nums
        # 葉ノード以外の全ノードをヒープ化する
        for i in range(self.parent(self.size() - 1), -1, -1):
            self.sift_down(i)

    def left(self, i: int) -> int:
        """左の子のインデックスを取得"""
        return 2 * i + 1

    def right(self, i: int) -> int:
        """右の子のインデックスを取得"""
        return 2 * i + 2

    def parent(self, i: int) -> int:
        """親のインデックスを取得"""
        return (i - 1) // 2  # 切り捨て除算

    def swap(self, i: int, j: int):
        """要素を交換する"""
        self.max_heap[i], self.max_heap[j] = self.max_heap[j], self.max_heap[i]

    def size(self) -> int:
        """ヒープのサイズを取得する"""
        return len(self.max_heap)

    def is_empty(self) -> bool:
        """ヒープが空か判定"""
        return self.size() == 0

    def peek(self) -> int:
        """ヒープの先頭要素にアクセスする"""
        return self.max_heap[0]

    def push(self, val: int):
        """ヒープに要素を挿入する"""
        # ノードを追加する
        self.max_heap.append(val)
        # 下から上へヒープ化する
        self.sift_up(self.size() - 1)

    def sift_up(self, i: int):
        """ノード i から上向きにヒープ化する"""
        while True:
            # ノード i の親ノードを取得する
            p = self.parent(i)
            # 「根ノードを越えた」または「ノードの修復が不要」の場合、ヒープ化を終了する
            if p < 0 or self.max_heap[i] <= self.max_heap[p]:
                break
            # 2 つのノードを交換する
            self.swap(i, p)
            # 上向きのヒープ化を繰り返す
            i = p

    def pop(self) -> int:
        """ヒープから要素を取り出す"""
        # 空かどうかを確認する
        if self.is_empty():
            raise IndexError("ヒープが空です")
        # 根と最右の葉を交換（先頭要素と末尾要素を交換）
        self.swap(0, self.size() - 1)
        # ノードを削除する
        val = self.max_heap.pop()
        # 上から下へヒープ化する
        self.sift_down(0)
        # ヒープの先頭要素を返す
        return val

    def sift_down(self, i: int):
        """ノード i から下向きにヒープ化する"""
        while True:
            # ノード i, l, r のうち値が最大のノードを求め、ma とする
            l, r, ma = self.left(i), self.right(i), i
            if l < self.size() and self.max_heap[l] > self.max_heap[ma]:
                ma = l
            if r < self.size() and self.max_heap[r] > self.max_heap[ma]:
                ma = r
            # ノード i が最大か添字 l, r が範囲外なら、ヒープ化は不要なので終了
            if ma == i:
                break
            # 2 つのノードを交換する
            self.swap(i, ma)
            # 下向きのヒープ化を繰り返す
            i = ma

    def print(self):
        """ヒープ（二分木）を表示する"""
        print_heap(self.max_heap)


"""実行用コード"""
if __name__ == "__main__":
    # 最大ヒープを初期化する
    max_heap = MaxHeap([9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2])
    print("\nリストを入力してヒープを構築した後")
    max_heap.print()

    # ヒープの先頭要素を取得する
    peek = max_heap.peek()
    print(f"\nヒープの先頭要素は {peek}")

    # ヒープに要素を挿入する
    val = 7
    max_heap.push(val)
    print(f"\n要素 {val} をヒープに挿入した後")
    max_heap.print()

    # ヒープの先頭要素を取り出す
    peek = max_heap.pop()
    print(f"\nヒープの先頭要素 {peek} を取り出した後")
    max_heap.print()

    # ヒープのサイズを取得する
    size = max_heap.size()
    print(f"\nヒープの要素数は {size}")

    # ヒープが空か判定
    is_empty = max_heap.is_empty()
    print(f"\nヒープは空か {is_empty}")
