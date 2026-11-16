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


"""Driver Code"""
if __name__ == "__main__":
    # [region]{init}
    # 初始化小頂堆積
    min_heap, flag = [], 1
    # 初始化大頂堆積
    max_heap, flag = [], -1

    # Python 的 heapq 模組預設實現小頂堆積
    # 考慮將“元素取負”後再入堆積，這樣就可以將大小關係顛倒，從而實現大頂堆積
    # 在本示例中，flag = 1 時對應小頂堆積，flag = -1 時對應大頂堆積
    # [endregion]{init}
    print("\n以下測試樣例為大頂堆積")

    # [region]{push}
    # 元素入堆積
    heapq.heappush(max_heap, flag * 1)
    heapq.heappush(max_heap, flag * 3)
    heapq.heappush(max_heap, flag * 2)
    heapq.heappush(max_heap, flag * 5)
    heapq.heappush(max_heap, flag * 4)
    # [endregion]{push}
    print_heap([flag * val for val in max_heap])

    # [region]{peek}
    # 獲取堆積頂元素
    peek: int = flag * max_heap[0]  # 5
    # [endregion]{peek}
    print(f"\n堆積頂元素為 {peek}")

    # [region]{pop_1}
    # 堆積頂元素出堆積
    # 出堆積元素會形成一個從大到小的序列
    val = flag * heapq.heappop(max_heap)  # 5
    # [endregion]{pop_1}
    print(f"出堆積元素為 {val}")
    # [region]{pop_2}
    val = flag * heapq.heappop(max_heap)  # 4
    # [endregion]{pop_2}
    print(f"出堆積元素為 {val}")
    # [region]{pop_3}
    val = flag * heapq.heappop(max_heap)  # 3
    # [endregion]{pop_3}
    print(f"出堆積元素為 {val}")
    # [region]{pop_4}
    val = flag * heapq.heappop(max_heap)  # 2
    # [endregion]{pop_4}
    print(f"出堆積元素為 {val}")
    # [region]{pop_5}
    val = flag * heapq.heappop(max_heap)  # 1
    # [endregion]{pop_5}
    print(f"出堆積元素為 {val}")

    # [region]{size}
    # 獲取堆積大小
    size: int = len(max_heap)
    # [endregion]{size}
    print(f"\n堆積元素數量為 {size}")

    # [region]{is_empty}
    # 判斷堆積是否為空
    is_empty: bool = not max_heap
    # [endregion]{is_empty}
    print(f"\n堆積是否為空 {is_empty}")

    # [region]{heapify}
    # 輸入串列並建堆積
    # 時間複雜度為 O(n) ，而非 O(nlogn)
    min_heap: list[int] = [1, 3, 2, 5, 4]
    heapq.heapify(min_heap)
    # [endregion]{heapify}
    print("\n輸入串列並建立小頂堆積後")
    print_heap(min_heap)
