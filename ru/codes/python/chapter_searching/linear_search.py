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
    """Линейный поиск в массиве"""
    # Обходим массив
    for i in range(len(nums)):
        if nums[i] == target:  # Элемент найден, возвращаем его индекс
            return i
    return -1  # Элемент не найден, возвращаем -1


def linear_search_linkedlist(head: ListNode, target: int) -> ListNode | None:
    """Линейный поиск в связном списке"""
    # Обходим связный список
    while head:
        if head.val == target:  # Нужный узел найден, возвращаем его
            return head
        head = head.next
    return None  # Нужный узел не найден, возвращаем None


"""Driver Code"""
if __name__ == "__main__":
    target = 3

    # Выполняем линейный поиск в массиве
    nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8]
    index: int = linear_search_array(nums, target)
    print("Индекс элемента 3 =", index)

    # Выполняем линейный поиск в связном списке
    head: ListNode = list_to_linked_list(nums)
    node: ListNode | None = linear_search_linkedlist(head, target)
    print("Узел со значением 3:", node)
