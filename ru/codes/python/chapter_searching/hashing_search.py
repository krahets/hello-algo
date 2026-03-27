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
    """Хеш-поиск (массив)"""
    # key хеш-таблицы: целевой элемент, value: индекс
    # Если такого key нет в хеш-таблице, вернуть -1
    return hmap.get(target, -1)


def hashing_search_linkedlist(
    hmap: dict[int, ListNode], target: int
) -> ListNode | None:
    """Хеш-поиск (связный список)"""
    # key хеш-таблицы: целевой элемент, value: объект узла
    # Если такого key нет в хеш-таблице, вернуть None
    return hmap.get(target, None)


"""Driver Code"""
if __name__ == "__main__":
    target = 3

    # Хеш-поиск (массив)
    nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8]
    # Инициализация хеш-таблицы
    map0 = dict[int, int]()
    for i in range(len(nums)):
        map0[nums[i]] = i  # key: элемент, value: индекс
    index: int = hashing_search_array(map0, target)
    print("Индекс целевого элемента 3 =", index)

    # Хеш-поиск (связный список)
    head: ListNode = list_to_linked_list(nums)
    # Инициализация хеш-таблицы
    map1 = dict[int, ListNode]()
    while head:
        map1[head.val] = head  # key: значение узла, value: узел
        head = head.next
    node: ListNode = hashing_search_linkedlist(map1, target)
    print("Объект узла со значением 3 =", node)
