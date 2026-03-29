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
        """コンストラクタ。入力リストに基づいてヒープを構築する"""
        # リスト要素をそのままヒープに追加
        self.max_heap = nums
        # 葉ノード以外のすべてのノードをヒープ化
        for i in range(self.parent(self.size() - 1), -1, -1):
            self.sift_down(i)

    def left(self, i: int) -> int:
        """左子ノードのインデックスを取得"""
        return 2 * i + 1

    def right(self, i: int) -> int:
        """右子ノードのインデックスを取得"""
        return 2 * i + 2

    def parent(self, i: int) -> int:
        """親ノードのインデックスを取得"""
        return (i - 1) // 2  # 切り捨て除算

    def swap(self, i: int, j: int):
        """要素を交換"""
        self.max_heap[i], self.max_heap[j] = self.max_heap[j], self.max_heap[i]

    def size(self) -> int:
        """ヒープのサイズを取得"""
        return len(self.max_heap)

    def is_empty(self) -> bool:
        """ヒープが空かどうかを判定"""
        return self.size() == 0

    def peek(self) -> int:
        """ヒープ先頭要素にアクセス"""
        return self.max_heap[0]

    def push(self, val: int):
        """要素をヒープに追加"""
        # ノードを追加
        self.max_heap.append(val)
        # 下から上へヒープ化
        self.sift_up(self.size() - 1)

    def sift_up(self, i: int):
        """ノード i から始めて、下から上へヒープ化"""
        while True:
            # ノード i の親ノードを取得
            p = self.parent(i)
            # 「根ノードを越えた」または「ノードの修復が不要」になったらヒープ化を終了
            if p < 0 or self.max_heap[i] <= self.max_heap[p]:
                break
            # 2 つのノードを交換
            self.swap(i, p)
            # ループで下から上へヒープ化
            i = p

    def pop(self) -> int:
        """要素をヒープから取り出す"""
        # 空判定の処理
        if self.is_empty():
            raise IndexError("ヒープが空です")
        # 根ノードと最も右の葉ノードを交換（先頭要素と末尾要素を交換）
        self.swap(0, self.size() - 1)
        # ノードを削除
        val = self.max_heap.pop()
        # 上から下へヒープ化
        self.sift_down(0)
        # ヒープ先頭要素を返す
        return val

    def sift_down(self, i: int):
        """ノード i から始めて、上から下へヒープ化"""
        while True:
            # ノード i, l, r のうち値が最大のノードを ma とする
            l, r, ma = self.left(i), self.right(i), i
            if l < self.size() and self.max_heap[l] > self.max_heap[ma]:
                ma = l
            if r < self.size() and self.max_heap[r] > self.max_heap[ma]:
                ma = r
            # ノード i が最大、またはインデックス l, r が範囲外なら、ヒープ化は不要なので抜ける
            if ma == i:
                break
            # 2 つのノードを交換
            self.swap(i, ma)
            # ループで上から下へヒープ化
            i = ma

    def print(self):
        """ヒープ（二分木）を出力"""
        print_heap(self.max_heap)


"""Driver Code"""
if __name__ == "__main__":
    # 最大ヒープを初期化
    max_heap = MaxHeap([9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2])
    print("\nリストを入力してヒープを構築した後")
    max_heap.print()

    # ヒープ頂点の要素を取得
    peek = max_heap.peek()
    print(f"\nヒープ先頭要素は {peek}")

    # 要素をヒープに追加
    val = 7
    max_heap.push(val)
    print(f"\n要素 {val} をヒープに追加した後")
    max_heap.print()

    # ヒープ頂点の要素を取り出す
    peek = max_heap.pop()
    print(f"\nヒープ先頭要素 {peek} を取り出した後")
    max_heap.print()

    # ヒープのサイズを取得
    size = max_heap.size()
    print(f"\nヒープ要素数は {size}")

    # ヒープが空かどうかを判定
    is_empty = max_heap.is_empty()
    print(f"\nヒープが空かどうかは {is_empty}")
