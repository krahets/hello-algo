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
        if nums[i] == target:  # ターゲット要素が見つかったため、そのインデックスを返す
            return i
    return -1  # ターゲット要素が見つからなかったため、-1 を返す


def linear_search_linkedlist(head: ListNode, target: int) -> ListNode | None:
    """線形探索（連結リスト）"""
    # リストを走査
    while head:
        if head.val == target:  # ターゲットノードが見つかったため、それを返す
            return head
        head = head.next
    return None  # ターゲットノードが見つからなかったため、None を返す


"""ドライバーコード"""
if __name__ == "__main__":
    target = 3

    # 配列での線形探索を実行
    nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8]
    index: int = linear_search_array(nums, target)
    print("ターゲット要素 3 のインデックス =", index)

    # 連結リストでの線形探索を実行
    head: ListNode = list_to_linked_list(nums)
    node: ListNode | None = linear_search_linkedlist(head, target)
    print("ターゲットノード値 3 に対応するノードオブジェクトは", node)