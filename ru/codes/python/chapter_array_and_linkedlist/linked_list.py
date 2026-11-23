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
    """Вставка узла P в связный список после узла n0"""
    n1 = n0.next
    P.next = n1
    n0.next = P


def remove(n0: ListNode):
    """Удаление первого узла после узла n0 из связного списка"""
    if not n0.next:
        return
    # n0 -> P -> n1
    P = n0.next
    n1 = P.next
    n0.next = n1


def access(head: ListNode, index: int) -> ListNode | None:
    """Доступ к узлу с индексом index в связном списке"""
    for _ in range(index):
        if not head:
            return None
        head = head.next
    return head


def find(head: ListNode, target: int) -> int:
    """Поиск первого узла со значением target в связном списке"""
    index = 0
    while head:
        if head.val == target:
            return index
        head = head.next
        index += 1
    return -1


"""Driver Code"""
if __name__ == "__main__":
    # Инициализация связного списка
    # Инициализация всех узлов
    n0 = ListNode(1)
    n1 = ListNode(3)
    n2 = ListNode(2)
    n3 = ListNode(5)
    n4 = ListNode(4)
    # Построить ссылки между узлами
    n0.next = n1
    n1.next = n2
    n2.next = n3
    n3.next = n4
    print("Исходный связный список")
    print_linked_list(n0)

    # Вставка узла
    p = ListNode(0)
    insert(n0, p)
    print("Связный список после вставки узла")
    print_linked_list(n0)

    # Удаление узла
    remove(n0)
    print("Связный список после удаления узла")
    print_linked_list(n0)

    # Доступ к узлу
    node: ListNode = access(n0, 3)
    print("Значение узла по индексу 3 в связном списке = {}".format(node.val))

    # Поиск узла
    index: int = find(n0, 2)
    print("Индекс узла со значением 2 в связном списке = {}".format(index))
