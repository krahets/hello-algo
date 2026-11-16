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
    # 初始化小顶堆
    min_heap, flag = [], 1
    # 初始化大顶堆
    max_heap, flag = [], -1

    # Python 的 heapq 模块默认实现小顶堆
    # 考虑将“元素取负”后再入堆，这样就可以将大小关系颠倒，从而实现大顶堆
    # 在本示例中，flag = 1 时对应小顶堆，flag = -1 时对应大顶堆
    # [endregion]{init}
    print("\n以下测试样例为大顶堆")

    # [region]{push}
    # 元素入堆
    heapq.heappush(max_heap, flag * 1)
    heapq.heappush(max_heap, flag * 3)
    heapq.heappush(max_heap, flag * 2)
    heapq.heappush(max_heap, flag * 5)
    heapq.heappush(max_heap, flag * 4)
    # [endregion]{push}
    print_heap([flag * val for val in max_heap])

    # [region]{peek}
    # 获取堆顶元素
    peek: int = flag * max_heap[0]  # 5
    # [endregion]{peek}
    print(f"\n堆顶元素为 {peek}")

    # [region]{pop_1}
    # 堆顶元素出堆
    # 出堆元素会形成一个从大到小的序列
    val = flag * heapq.heappop(max_heap)  # 5
    # [endregion]{pop_1}
    print(f"出堆元素为 {val}")
    # [region]{pop_2}
    val = flag * heapq.heappop(max_heap)  # 4
    # [endregion]{pop_2}
    print(f"出堆元素为 {val}")
    # [region]{pop_3}
    val = flag * heapq.heappop(max_heap)  # 3
    # [endregion]{pop_3}
    print(f"出堆元素为 {val}")
    # [region]{pop_4}
    val = flag * heapq.heappop(max_heap)  # 2
    # [endregion]{pop_4}
    print(f"出堆元素为 {val}")
    # [region]{pop_5}
    val = flag * heapq.heappop(max_heap)  # 1
    # [endregion]{pop_5}
    print(f"出堆元素为 {val}")

    # [region]{size}
    # 获取堆大小
    size: int = len(max_heap)
    # [endregion]{size}
    print(f"\n堆元素数量为 {size}")

    # [region]{is_empty}
    # 判断堆是否为空
    is_empty: bool = not max_heap
    # [endregion]{is_empty}
    print(f"\n堆是否为空 {is_empty}")

    # [region]{heapify}
    # 输入列表并建堆
    # 时间复杂度为 O(n) ，而非 O(nlogn)
    min_heap: list[int] = [1, 3, 2, 5, 4]
    heapq.heapify(min_heap)
    # [endregion]{heapify}
    print("\n输入列表并建立小顶堆后")
    print_heap(min_heap)
