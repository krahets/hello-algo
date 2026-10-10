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
    """線形探索（配列）"""
    # 配列を走査
    for i in range(len(nums)):
        if nums[i] == target:  # 目標要素が見つかったらそのインデックスを返す
            return i
    return -1  # 目標要素が見つからなければ -1 を返す


def linear_search_linkedlist(head: ListNode, target: int) -> ListNode | None:
    """線形探索（連結リスト）"""
    # 連結リストを走査
    while head:
        if head.val == target:  # 対象ノードが見つかったら、それを返す
            return head
        head = head.next
    return None  # 対象ノードが見つからない場合は None を返す


"""Driver Code"""
if __name__ == "__main__":
    target = 3

    # 配列で線形探索を行う
    nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8]
    index: int = linear_search_array(nums, target)
    print("対象要素 3 のインデックス =", index)

    # 連結リストで線形探索を行う
    head: ListNode = list_to_linked_list(nums)
    node: ListNode | None = linear_search_linkedlist(head, target)
    print("対象ノード値 3 に対応するノードオブジェクトは", node)
