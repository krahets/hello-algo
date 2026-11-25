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
    """最大堆積"""

    def __init__(self, nums: list[int]):
        """建構式，根據輸入串列建立堆積"""
        # 將串列元素依原順序全部加入堆積
        self.max_heap = nums
        # 從每個非葉節點向下調整堆積
        for i in range(self.parent(self.size() - 1), -1, -1):
            self.sift_down(i)

    def left(self, i: int) -> int:
        """取得左子節點的索引"""
        return 2 * i + 1

    def right(self, i: int) -> int:
        """取得右子節點的索引"""
        return 2 * i + 2

    def parent(self, i: int) -> int:
        """取得父節點的索引"""
        return (i - 1) // 2  # 向下取整的整數除法

    def swap(self, i: int, j: int):
        """交換元素"""
        self.max_heap[i], self.max_heap[j] = self.max_heap[j], self.max_heap[i]

    def size(self) -> int:
        """取得堆積大小"""
        return len(self.max_heap)

    def is_empty(self) -> bool:
        """判斷堆積是否為空"""
        return self.size() == 0

    def peek(self) -> int:
        """讀取堆積頂端元素"""
        return self.max_heap[0]

    def push(self, val: int):
        """將元素加入堆積"""
        # 新增節點
        self.max_heap.append(val)
        # 由下往上調整堆積
        self.sift_up(self.size() - 1)

    def sift_up(self, i: int):
        """從節點 i 開始向上調整堆積"""
        while True:
            # 取得節點 i 的父節點
            p = self.parent(i)
            # 若已越過根節點，或節點已符合堆積性質，就結束調整
            if p < 0 or self.max_heap[i] <= self.max_heap[p]:
                break
            # 交換兩個節點
            self.swap(i, p)
            # 繼續向上調整堆積
            i = p

    def pop(self) -> int:
        """從堆積取出元素"""
        # 檢查堆積是否為空
        if self.is_empty():
            raise IndexError("堆積為空")
        # 交換根節點與最右側的葉節點（即首尾兩個元素）
        self.swap(0, self.size() - 1)
        # 刪除節點
        val = self.max_heap.pop()
        # 由上往下調整堆積
        self.sift_down(0)
        # 回傳堆積頂端元素
        return val

    def sift_down(self, i: int):
        """從節點 i 開始向下調整堆積"""
        while True:
            # 找出節點 i、l、r 中值最大的節點，記為 ma
            l, r, ma = self.left(i), self.right(i), i
            if l < self.size() and self.max_heap[l] > self.max_heap[ma]:
                ma = l
            if r < self.size() and self.max_heap[r] > self.max_heap[ma]:
                ma = r
            # 若節點 i 的值最大，或子節點索引 l、r 均超出範圍，即可結束調整，跳出迴圈
            if ma == i:
                break
            # 交換兩個節點
            self.swap(i, ma)
            # 繼續向下調整堆積
            i = ma

    def print(self):
        """印出堆積（二元樹）"""
        print_heap(self.max_heap)


"""Driver Code"""
if __name__ == "__main__":
    # 初始化最大堆積
    max_heap = MaxHeap([9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2])
    print("\n用輸入串列建立堆積後")
    max_heap.print()

    # 取得堆積頂端元素
    peek = max_heap.peek()
    print(f"\n堆積頂端元素為 {peek}")

    # 將元素加入堆積
    val = 7
    max_heap.push(val)
    print(f"\n將元素 {val} 加入堆積後")
    max_heap.print()

    # 取出堆積頂端元素
    peek = max_heap.pop()
    print(f"\n取出堆積頂端元素 {peek} 後")
    max_heap.print()

    # 取得堆積大小
    size = max_heap.size()
    print(f"\n堆積中的元素個數為 {size}")

    # 判斷堆積是否為空
    is_empty = max_heap.is_empty()
    print(f"\n堆積是否為空 {is_empty}")
