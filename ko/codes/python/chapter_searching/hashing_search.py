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
    """해시 탐색(배열)"""
    # 해시 테이블의 key: 목표 원소, value: 인덱스
    # 해시 테이블에 해당 key가 없으면 -1을 반환한다
    return hmap.get(target, -1)


def hashing_search_linkedlist(
    hmap: dict[int, ListNode], target: int
) -> ListNode | None:
    """해시 탐색(연결 리스트)"""
    # 해시 테이블의 key: 목표 원소, value: 노드 객체
    # 해시 테이블에 해당 key가 없으면 None을 반환한다
    return hmap.get(target, None)


"""실행 코드"""
if __name__ == "__main__":
    target = 3

    # 해시 탐색(배열)
    nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8]
    # 해시 테이블 초기화
    map0 = dict[int, int]()
    for i in range(len(nums)):
        map0[nums[i]] = i  # key: 원소, value: 인덱스
    index: int = hashing_search_array(map0, target)
    print("목표 원소 3의 인덱스 =", index)

    # 해시 탐색(연결 리스트)
    head: ListNode = list_to_linked_list(nums)
    # 해시 테이블 초기화
    map1 = dict[int, ListNode]()
    while head:
        map1[head.val] = head  # key: 노드 값, value: 노드
        head = head.next
    node: ListNode = hashing_search_linkedlist(map1, target)
    print("목표 노드 값 3에 해당하는 노드 객체", node)
