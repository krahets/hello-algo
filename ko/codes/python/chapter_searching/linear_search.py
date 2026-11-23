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
    """선형 탐색(배열)"""
    # 배열 순회
    for i in range(len(nums)):
        if nums[i] == target:  # 목표 원소를 찾았으므로 해당 인덱스를 반환한다
            return i
    return -1  # 목표 원소를 찾지 못했으므로 -1을 반환한다


def linear_search_linkedlist(head: ListNode, target: int) -> ListNode | None:
    """선형 탐색(연결 리스트)"""
    # 연결 리스트 순회
    while head:
        if head.val == target:  # 목표 노드를 찾았으므로 해당 노드를 반환한다
            return head
        head = head.next
    return None  # 목표 노드를 찾지 못했으므로 None을 반환한다


"""실행 코드"""
if __name__ == "__main__":
    target = 3

    # 배열에서 선형 탐색을 수행한다
    nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8]
    index: int = linear_search_array(nums, target)
    print("목표 원소 3의 인덱스 =", index)

    # 연결 리스트에서 선형 탐색을 수행한다
    head: ListNode = list_to_linked_list(nums)
    node: ListNode | None = linear_search_linkedlist(head, target)
    print("목표 노드 값 3에 해당하는 노드 객체", node)
