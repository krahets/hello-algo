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
    heapq.heappush(heap, flag * val)  # 要素をヒープに追加
    print(f"\n要素 {val} をヒープに追加した後")
    print_heap([flag * val for val in heap])


def test_pop(heap: list, flag: int = 1):
    val = flag * heapq.heappop(heap)  # ヒープ頂点の要素を取り出す
    print(f"\nヒープ先頭要素 {val} を取り出した後")
    print_heap([flag * val for val in heap])


"""Driver Code"""
if __name__ == "__main__":
    # 最小ヒープを初期化
    min_heap, flag = [], 1
    # 最大ヒープを初期化
    max_heap, flag = [], -1

    print("\n以下のテストケースは最大ヒープ")
    # Python の heapq モジュールはデフォルトで最小ヒープを実装している
    # 要素を負にしてからヒープに入れると大小関係を反転でき、最大ヒープを実現できる
    # この例では、flag = 1 が最小ヒープ、flag = -1 が最大ヒープに対応する

    # 要素をヒープに追加
    test_push(max_heap, 1, flag)
    test_push(max_heap, 3, flag)
    test_push(max_heap, 2, flag)
    test_push(max_heap, 5, flag)
    test_push(max_heap, 4, flag)

    # ヒープ頂点の要素を取得
    peek: int = flag * max_heap[0]
    print(f"\nヒープ先頭要素は {peek}")

    # ヒープ頂点の要素を取り出す
    test_pop(max_heap, flag)
    test_pop(max_heap, flag)
    test_pop(max_heap, flag)
    test_pop(max_heap, flag)
    test_pop(max_heap, flag)

    # ヒープのサイズを取得
    size: int = len(max_heap)
    print(f"\nヒープ要素数は {size}")

    # ヒープが空かどうかを判定
    is_empty: bool = not max_heap
    print(f"\nヒープが空かどうかは {is_empty}")

    # リストを入力してヒープを構築する
    # 時間計算量は O(n) であり、O(nlogn) ではない
    min_heap = [1, 3, 2, 5, 4]
    heapq.heapify(min_heap)
    print("\nリストを入力して最小ヒープを構築した後")
    print_heap(min_heap)
