"""
File: hashing_search.py
Created Time: 2022-11-26
Author: timi (xisunyy@163.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import ListNode, list_to_linked_list


def hashing_search_array(hmap: dict[int, int], target: int) -> int:
    """雜湊查詢（陣列）"""
    # 雜湊表的 key: 目標元素，value: 索引
    # 若雜湊表中無此 key ，返回 -1
    return hmap.get(target, -1)


def hashing_search_linkedlist(
    hmap: dict[int, ListNode], target: int
) -> ListNode | None:
    """雜湊查詢（鏈結串列）"""
    # 雜湊表的 key: 目標元素，value: 節點物件
    # 若雜湊表中無此 key ，返回 None
    return hmap.get(target, None)


"""Driver Code"""
if __name__ == "__main__":
    target = 3

    # 雜湊查詢（陣列）
    nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8]
    # 初始化雜湊表
    map0 = dict[int, int]()
    for i in range(len(nums)):
        map0[nums[i]] = i  # key: 元素，value: 索引
    index: int = hashing_search_array(map0, target)
    print("目標元素 3 的索引 =", index)

    # 雜湊查詢（鏈結串列）
    head: ListNode = list_to_linked_list(nums)
    # 初始化雜湊表
    map1 = dict[int, ListNode]()
    while head:
        map1[head.val] = head  # key: 節點值，value: 節點
        head = head.next
    node: ListNode = hashing_search_linkedlist(map1, target)
    print("目標節點值 3 的對應節點物件為", node)
