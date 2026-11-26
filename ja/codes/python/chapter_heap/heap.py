"""
File: heap.py
Created Time: 2023-02-23
Author: krahets (krahets@163.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import print_heap

import heapq


def test_push(heap: list, val: int, flag: int = 1):
    heapq.heappush(heap, flag * val)  # 要素をヒープに挿入する
    print(f"\n要素 {val} の挿入後：")
    print_heap([flag * val for val in heap])


def test_pop(heap: list, flag: int = 1):
    val = flag * heapq.heappop(heap)  # 根の要素を取り出す
    print(f"\n根の要素 {val} を取り出した後：")
    print_heap([flag * val for val in heap])


"""Driver Code"""
if __name__ == "__main__":
    # 最小ヒープを初期化する
    min_heap, flag = [], 1
    # 最大ヒープを初期化する
    max_heap, flag = [], -1

    print("\n以下は最大ヒープのテスト例")
    # Python の heapq モジュールはデフォルトで最小ヒープを実装する
    # 挿入前に要素の符号を反転すると大小関係が逆になり、最大ヒープを実現できる
    # この例では flag = 1 が最小ヒープ、flag = -1 が最大ヒープに対応する

    # 要素をヒープに挿入する
    test_push(max_heap, 1, flag)
    test_push(max_heap, 3, flag)
    test_push(max_heap, 2, flag)
    test_push(max_heap, 5, flag)
    test_push(max_heap, 4, flag)

    # ヒープの根の要素を取得する
    peek: int = flag * max_heap[0]
    print(f"\nヒープの根の要素：{peek}")

    # 根の要素を取り出す
    test_pop(max_heap, flag)
    test_pop(max_heap, flag)
    test_pop(max_heap, flag)
    test_pop(max_heap, flag)
    test_pop(max_heap, flag)

    # ヒープのサイズを取得する
    size: int = len(max_heap)
    print(f"\nヒープの要素数：{size}")

    # ヒープが空か判定する
    is_empty: bool = not max_heap
    print(f"\nヒープは空か：{is_empty}")

    # 入力リストからヒープを構築する
    # 時間計算量は O(nlogn) ではなく O(n)
    min_heap = [1, 3, 2, 5, 4]
    heapq.heapify(min_heap)
    print("\n入力リストから構築した最小ヒープ：")
    print_heap(min_heap)
