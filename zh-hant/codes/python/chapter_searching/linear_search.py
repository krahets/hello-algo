"""
File: linear_search.py
Created Time: 2022-11-26
Author: timi (xisunyy@163.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import ListNode, list_to_linked_list


def linear_search_array(nums: list[int], target: int) -> int:
    """循序搜尋（陣列）"""
    # 走訪陣列
    for i in range(len(nums)):
        if nums[i] == target:  # 找到目標元素，回傳其索引
            return i
    return -1  # 找不到目標元素，回傳 -1


def linear_search_linkedlist(head: ListNode, target: int) -> ListNode | None:
    """循序搜尋（鏈結串列）"""
    # 走訪鏈結串列
    while head:
        if head.val == target:  # 找到目標節點，回傳該節點
            return head
        head = head.next
    return None  # 找不到目標節點，回傳 None


"""Driver Code"""
if __name__ == "__main__":
    target = 3

    # 在陣列中執行循序搜尋
    nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8]
    index: int = linear_search_array(nums, target)
    print("目標元素 3 的索引 =", index)

    # 在鏈結串列中執行循序搜尋
    head: ListNode = list_to_linked_list(nums)
    node: ListNode | None = linear_search_linkedlist(head, target)
    print("目標值 3 對應的節點物件為", node)
