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
    heapq.heappush(heap, flag * val)  # ヒープに要素をプッシュ
    print(f"\n要素 {val} をヒープにプッシュ後")
    print_heap([flag * val for val in heap])


def test_pop(heap: list, flag: int = 1):
    val = flag * heapq.heappop(heap)  # ヒープの先頭要素をポップ
    print(f"\nヒープの先頭要素 {val} がヒープから出た後")
    print_heap([flag * val for val in heap])


"""ドライバコード"""
if __name__ == "__main__":
    # 最小ヒープを初期化
    min_heap, flag = [], 1
    # 最大ヒープを初期化
    max_heap, flag = [], -1

    print("\n以下のテストケースは最大ヒープ用です")
    # PythonのheapqモジュールはデフォルトでMinHeapを実装
    # ヒープに入れる前に「要素を反転」することを考慮し、比較演算子を逆転させて最大ヒープを実装
    # この例では、flag = 1は最小ヒープに対応し、flag = -1は最大ヒープに対応

    # ヒープに要素をプッシュ
    test_push(max_heap, 1, flag)
    test_push(max_heap, 3, flag)
    test_push(max_heap, 2, flag)
    test_push(max_heap, 5, flag)
    test_push(max_heap, 4, flag)

    # ヒープの先頭要素にアクセス
    peek: int = flag * max_heap[0]
    print(f"\nヒープの先頭要素は {peek}")

    # ヒープの先頭要素をポップ
    test_pop(max_heap, flag)
    test_pop(max_heap, flag)
    test_pop(max_heap, flag)
    test_pop(max_heap, flag)
    test_pop(max_heap, flag)

    # ヒープのサイズを取得
    size: int = len(max_heap)
    print(f"\nヒープの要素数は {size}")

    # ヒープが空かどうかを判定
    is_empty: bool = not max_heap
    print(f"\nヒープは空ですか {is_empty}")

    # リストを入力してヒープを構築
    # 時間複雑度はO(n)、O(nlogn)ではない
    min_heap = [1, 3, 2, 5, 4]
    heapq.heapify(min_heap)
    print("\nリストを入力して最小ヒープを構築")
    print_heap(min_heap)