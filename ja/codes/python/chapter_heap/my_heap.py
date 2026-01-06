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
        """コンストラクタ、入力リストに基づいてヒープを構築"""
        # すべてのリスト要素をヒープに追加
        self.max_heap = nums
        # 葉以外のすべてのノードをヒープ化
        for i in range(self.parent(self.size() - 1), -1, -1):
            self.sift_down(i)

    def left(self, i: int) -> int:
        """左の子ノードのインデックスを取得"""
        return 2 * i + 1

    def right(self, i: int) -> int:
        """右の子ノードのインデックスを取得"""
        return 2 * i + 2

    def parent(self, i: int) -> int:
        """親ノードのインデックスを取得"""
        return (i - 1) // 2  # 整数除算で切り下げ

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
        """ヒープの先頭要素にアクセス"""
        return self.max_heap[0]

    def push(self, val: int):
        """ヒープに要素をプッシュ"""
        # ノードを追加
        self.max_heap.append(val)
        # 下から上へヒープ化
        self.sift_up(self.size() - 1)

    def sift_up(self, i: int):
        """ノードiから開始して、下から上へヒープ化"""
        while True:
            # ノードiの親ノードを取得
            p = self.parent(i)
            # 「ルートノードを越える」または「ノードが修復不要」の場合、ヒープ化を終了
            if p < 0 or self.max_heap[i] <= self.max_heap[p]:
                break
            # 2つのノードを交換
            self.swap(i, p)
            # 上向きのループヒープ化
            i = p

    def pop(self) -> int:
        """要素をヒープから出す"""
        # 空の処理
        if self.is_empty():
            raise IndexError("Heap is empty")
        # ルートノードと最右端の葉ノードを交換（最初の要素と最後の要素を交換）
        self.swap(0, self.size() - 1)
        # ノードを削除
        val = self.max_heap.pop()
        # 上から下へヒープ化
        self.sift_down(0)
        # ヒープの先頭要素を返す
        return val

    def sift_down(self, i: int):
        """ノードiから開始して、上から下へヒープ化"""
        while True:
            # i、l、rの中で最大のノードを決定し、maとする
            l, r, ma = self.left(i), self.right(i), i
            if l < self.size() and self.max_heap[l] > self.max_heap[ma]:
                ma = l
            if r < self.size() and self.max_heap[r] > self.max_heap[ma]:
                ma = r
            # ノードiが最大またはインデックスl、rが範囲外の場合、さらなるヒープ化は不要、ブレーク
            if ma == i:
                break
            # 2つのノードを交換
            self.swap(i, ma)
            # 下向きのループヒープ化
            i = ma

    def print(self):
        """ヒープを出力（二分木）"""
        print_heap(self.max_heap)


"""ドライバコード"""
if __name__ == "__main__":
    # 最大ヒープを初期化
    max_heap = MaxHeap([9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2])
    print("\nリストを入力してヒープを構築")
    max_heap.print()

    # ヒープの先頭要素にアクセス
    peek = max_heap.peek()
    print(f"\nヒープの先頭要素は {peek}")

    # ヒープに要素をプッシュ
    val = 7
    max_heap.push(val)
    print(f"\n要素 {val} をヒープにプッシュ後")
    max_heap.print()

    # ヒープの先頭要素をポップ
    peek = max_heap.pop()
    print(f"\nヒープの先頭要素 {peek} がヒープから出た後")
    max_heap.print()

    # ヒープのサイズを取得
    size = max_heap.size()
    print(f"\nヒープの要素数は {size}")

    # ヒープが空かどうかを判定
    is_empty = max_heap.is_empty()
    print(f"\nヒープは空ですか {is_empty}")