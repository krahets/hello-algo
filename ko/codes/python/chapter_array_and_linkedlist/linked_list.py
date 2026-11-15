"""
File: linked_list.py
Created Time: 2022-11-25
Author: krahets (krahets@163.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import ListNode, print_linked_list


def insert(n0: ListNode, P: ListNode):
    """연결 리스트의 노드 n0 뒤에 노드 P 삽입"""
    n1 = n0.next
    P.next = n1
    n0.next = P


def remove(n0: ListNode):
    """연결 리스트의 노드 n0 바로 뒤에 있는 노드 삭제"""
    if not n0.next:
        return
    # n0 -> P -> n1
    P = n0.next
    n1 = P.next
    n0.next = n1


def access(head: ListNode, index: int) -> ListNode | None:
    """연결 리스트에서 인덱스가 index인 노드에 접근"""
    for _ in range(index):
        if not head:
            return None
        head = head.next
    return head


def find(head: ListNode, target: int) -> int:
    """연결 리스트에서 값이 target인 첫 번째 노드 탐색"""
    index = 0
    while head:
        if head.val == target:
            return index
        head = head.next
        index += 1
    return -1


"""실행 코드"""
if __name__ == "__main__":
    # 연결 리스트 초기화
    # 각 노드를 초기화한다
    n0 = ListNode(1)
    n1 = ListNode(3)
    n2 = ListNode(2)
    n3 = ListNode(5)
    n4 = ListNode(4)
    # 노드 사이의 참조를 설정한다
    n0.next = n1
    n1.next = n2
    n2.next = n3
    n3.next = n4
    print("초기화한 연결 리스트")
    print_linked_list(n0)

    # 노드 삽입
    p = ListNode(0)
    insert(n0, p)
    print("노드를 삽입한 후의 연결 리스트")
    print_linked_list(n0)

    # 노드 삭제
    remove(n0)
    print("노드를 삭제한 후의 연결 리스트")
    print_linked_list(n0)

    # 노드 접근
    node: ListNode = access(n0, 3)
    print("연결 리스트에서 인덱스 3에 있는 노드의 값 = {}".format(node.val))

    # 노드 탐색
    index: int = find(n0, 2)
    print("연결 리스트에서 값이 2인 노드의 인덱스 = {}".format(index))
