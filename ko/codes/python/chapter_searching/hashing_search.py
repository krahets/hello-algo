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
    """배열에서의 해시 탐색"""
    # 해시 테이블의 key는 목표 원소, value는 인덱스다.
    # 해시 테이블에 해당 키가 없으면 -1을 반환한다.
    return hmap.get(target, -1)


def hashing_search_linkedlist(
    hmap: dict[int, ListNode], target: int
) -> ListNode | None:
    """연결 리스트에서의 해시 탐색"""
    # 해시 테이블의 key는 목표 원소, value는 노드 객체다.
    # 해시 테이블에 해당 키가 없으면 None을 반환한다.
    return hmap.get(target, None)


"""Driver Code"""
if __name__ == "__main__":
    target = 3

    # 배열에서의 해시 탐색
    nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8]
    # 해시 테이블 초기화
    map0 = dict[int, int]()
    for i in range(len(nums)):
        map0[nums[i]] = i  # key는 원소, value는 인덱스다.
    index: int = hashing_search_array(map0, target)
    print("목표 원소 3의 인덱스 =", index)

    # 연결 리스트에서의 해시 탐색
    head: ListNode = list_to_linked_list(nums)
    # 해시 테이블 초기화
    map1 = dict[int, ListNode]()
    while head:
        map1[head.val] = head  # key는 노드의 값, value는 노드다.
        head = head.next
    node: ListNode = hashing_search_linkedlist(map1, target)
    print("값이 3인 목표 노드의 객체 =", node)
