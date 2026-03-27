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
    """Линейный поиск (массив)"""
    # Обход массива
    for i in range(len(nums)):
        if nums[i] == target:  # Целевой элемент найден, вернуть его индекс
            return i
    return -1  # Целевой элемент не найден, вернуть -1


def linear_search_linkedlist(head: ListNode, target: int) -> ListNode | None:
    """Линейный поиск (связный список)"""
    # Обойти связный список
    while head:
        if head.val == target:  # Найти целевой узел и вернуть его
            return head
        head = head.next
    return None  # Целевой узел не найден, вернуть None


"""Driver Code"""
if __name__ == "__main__":
    target = 3

    # Выполнить линейный поиск в массиве
    nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8]
    index: int = linear_search_array(nums, target)
    print("Индекс целевого элемента 3 =", index)

    # Выполнить линейный поиск в связном списке
    head: ListNode = list_to_linked_list(nums)
    node: ListNode | None = linear_search_linkedlist(head, target)
    print("Объект узла со значением 3 =", node)
