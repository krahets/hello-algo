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
    heapq.heappush(heap, flag * val)  # ヒープに要素を挿入する
    print(f"\n要素 {val} をヒープに挿入した後")
    print_heap([flag * val for val in heap])


def test_pop(heap: list, flag: int = 1):
    val = flag * heapq.heappop(heap)  # ヒープの先頭要素を取り出す
    print(f"\nヒープの先頭要素 {val} を取り出した後")
    print_heap([flag * val for val in heap])


"""実行用コード"""
if __name__ == "__main__":
    # 最小ヒープを初期化する
    min_heap, flag = [], 1
    # 最大ヒープを初期化する
    max_heap, flag = [], -1

    print("\n以下のテストケースは最大ヒープを対象とする")
    # Python の heapq モジュールは既定で最小ヒープを実装する
    # 「要素の符号を反転」してからヒープに挿入すれば、大小関係が逆転し、最大ヒープを実装できる
    # この例では flag = 1 が最小ヒープ、flag = -1 が最大ヒープに対応する

    # ヒープに要素を挿入する
    test_push(max_heap, 1, flag)
    test_push(max_heap, 3, flag)
    test_push(max_heap, 2, flag)
    test_push(max_heap, 5, flag)
    test_push(max_heap, 4, flag)

    # ヒープの先頭要素を取得する
    peek: int = flag * max_heap[0]
    print(f"\nヒープの先頭要素は {peek}")

    # ヒープの先頭要素を取り出す
    test_pop(max_heap, flag)
    test_pop(max_heap, flag)
    test_pop(max_heap, flag)
    test_pop(max_heap, flag)
    test_pop(max_heap, flag)

    # ヒープのサイズを取得する
    size: int = len(max_heap)
    print(f"\nヒープの要素数は {size}")

    # ヒープが空か判定
    is_empty: bool = not max_heap
    print(f"\nヒープは空か {is_empty}")

    # リストを入力してヒープを構築する
    # 時間計算量は O(n) であり、O(nlogn) ではない
    min_heap = [1, 3, 2, 5, 4]
    heapq.heapify(min_heap)
    print("\nリストを入力して最小ヒープを構築した後")
    print_heap(min_heap)
