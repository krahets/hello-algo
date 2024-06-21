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
    """大頂堆積"""

    def __init__(self, nums: list[int]):
        """建構子，根據輸入串列建堆積"""
        # 將串列元素原封不動新增進堆積
        self.max_heap = nums
        # 堆積化除葉節點以外的其他所有節點
        for i in range(self.parent(self.size() - 1), -1, -1):
            self.sift_down(i)

    def left(self, i: int) -> int:
        """獲取左子節點的索引"""
        return 2 * i + 1

    def right(self, i: int) -> int:
        """獲取右子節點的索引"""
        return 2 * i + 2

    def parent(self, i: int) -> int:
        """獲取父節點的索引"""
        return (i - 1) // 2  # 向下整除

    def swap(self, i: int, j: int):
        """交換元素"""
        self.max_heap[i], self.max_heap[j] = self.max_heap[j], self.max_heap[i]

    def size(self) -> int:
        """獲取堆積大小"""
        return len(self.max_heap)

    def is_empty(self) -> bool:
        """判斷堆積是否為空"""
        return self.size() == 0

    def peek(self) -> int:
        """訪問堆積頂元素"""
        return self.max_heap[0]

    def push(self, val: int):
        """元素入堆積"""
        # 新增節點
        self.max_heap.append(val)
        # 從底至頂堆積化
        self.sift_up(self.size() - 1)

    def sift_up(self, i: int):
        """從節點 i 開始，從底至頂堆積化"""
        while True:
            # 獲取節點 i 的父節點
            p = self.parent(i)
            # 當“越過根節點”或“節點無須修復”時，結束堆積化
            if p < 0 or self.max_heap[i] <= self.max_heap[p]:
                break
            # 交換兩節點
            self.swap(i, p)
            # 迴圈向上堆積化
            i = p

    def pop(self) -> int:
        """元素出堆積"""
        # 判空處理
        if self.is_empty():
            raise IndexError("堆積為空")
        # 交換根節點與最右葉節點（交換首元素與尾元素）
        self.swap(0, self.size() - 1)
        # 刪除節點
        val = self.max_heap.pop()
        # 從頂至底堆積化
        self.sift_down(0)
        # 返回堆積頂元素
        return val

    def sift_down(self, i: int):
        """從節點 i 開始，從頂至底堆積化"""
        while True:
            # 判斷節點 i, l, r 中值最大的節點，記為 ma
            l, r, ma = self.left(i), self.right(i), i
            if l < self.size() and self.max_heap[l] > self.max_heap[ma]:
                ma = l
            if r < self.size() and self.max_heap[r] > self.max_heap[ma]:
                ma = r
            # 若節點 i 最大或索引 l, r 越界，則無須繼續堆積化，跳出
            if ma == i:
                break
            # 交換兩節點
            self.swap(i, ma)
            # 迴圈向下堆積化
            i = ma

    def print(self):
        """列印堆積（二元樹）"""
        print_heap(self.max_heap)


"""Driver Code"""
if __name__ == "__main__":
    # 初始化大頂堆積
    max_heap = MaxHeap([9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2])
    print("\n輸入串列並建堆積後")
    max_heap.print()

    # 獲取堆積頂元素
    peek = max_heap.peek()
    print(f"\n堆積頂元素為 {peek}")

    # 元素入堆積
    val = 7
    max_heap.push(val)
    print(f"\n元素 {val} 入堆積後")
    max_heap.print()

    # 堆積頂元素出堆積
    peek = max_heap.pop()
    print(f"\n堆積頂元素 {peek} 出堆積後")
    max_heap.print()

    # 獲取堆積大小
    size = max_heap.size()
    print(f"\n堆積元素數量為 {size}")

    # 判斷堆積是否為空
    is_empty = max_heap.is_empty()
    print(f"\n堆積是否為空 {is_empty}")
