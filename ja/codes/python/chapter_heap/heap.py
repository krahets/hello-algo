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


"""実行用コード"""
if __name__ == "__main__":
    # [region]{init}
    # 最小ヒープを初期化する
    min_heap, flag = [], 1
    # 最大ヒープを初期化する
    max_heap, flag = [], -1

    # Python の heapq モジュールは既定で最小ヒープを実装する
    # 「要素の符号を反転」してからヒープに挿入すれば、大小関係が逆転し、最大ヒープを実装できる
    # この例では flag = 1 が最小ヒープ、flag = -1 が最大ヒープに対応する
    # [endregion]{init}
    print("\n以下のテストケースは最大ヒープを対象とする")

    # [region]{push}
    # ヒープに要素を挿入する
    heapq.heappush(max_heap, flag * 1)
    heapq.heappush(max_heap, flag * 3)
    heapq.heappush(max_heap, flag * 2)
    heapq.heappush(max_heap, flag * 5)
    heapq.heappush(max_heap, flag * 4)
    # [endregion]{push}
    print_heap([flag * val for val in max_heap])

    # [region]{peek}
    # ヒープの先頭要素を取得する
    peek: int = flag * max_heap[0]  # 5
    # [endregion]{peek}
    print(f"\nヒープの先頭要素は {peek}")

    # [region]{pop_1}
    # ヒープの先頭要素を取り出す
    # 取り出した要素は降順の列を形成する
    val = flag * heapq.heappop(max_heap)  # 5
    # [endregion]{pop_1}
    print(val)
    # [region]{pop_2}
    val = flag * heapq.heappop(max_heap)  # 4
    # [endregion]{pop_2}
    print(val)
    # [region]{pop_3}
    val = flag * heapq.heappop(max_heap)  # 3
    # [endregion]{pop_3}
    print(val)
    # [region]{pop_4}
    val = flag * heapq.heappop(max_heap)  # 2
    # [endregion]{pop_4}
    print(val)
    # [region]{pop_5}
    val = flag * heapq.heappop(max_heap)  # 1
    # [endregion]{pop_5}
    print(val)

    # [region]{size}
    # ヒープのサイズを取得する
    size: int = len(max_heap)
    # [endregion]{size}
    print(f"\nヒープの要素数は {size}")

    # [region]{is_empty}
    # ヒープが空か判定
    is_empty: bool = not max_heap
    # [endregion]{is_empty}
    print(f"\nヒープは空か {is_empty}")

    # [region]{heapify}
    # リストを入力してヒープを構築する
    # 時間計算量は O(n) であり、O(nlogn) ではない
    min_heap: list[int] = [1, 3, 2, 5, 4]
    heapq.heapify(min_heap)
    # [endregion]{heapify}
    print("\nリストを入力して最小ヒープを構築した後")
    print_heap(min_heap)
