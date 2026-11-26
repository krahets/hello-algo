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
    """Поиск по хеш-таблице в массиве"""
    # Ключ хеш-таблицы — искомый элемент, значение — его индекс
    # Если ключа в хеш-таблице нет, возвращаем -1
    return hmap.get(target, -1)


def hashing_search_linkedlist(
    hmap: dict[int, ListNode], target: int
) -> ListNode | None:
    """Поиск по хеш-таблице в связном списке"""
    # Ключ хеш-таблицы — искомый элемент, значение — объект узла
    # Если ключа в хеш-таблице нет, возвращаем None
    return hmap.get(target, None)


"""Driver Code"""
if __name__ == "__main__":
    target = 3

    # Поиск по хеш-таблице в массиве
    nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8]
    # Создаём хеш-таблицу
    map0 = dict[int, int]()
    for i in range(len(nums)):
        map0[nums[i]] = i  # Ключ — элемент, значение — индекс
    index: int = hashing_search_array(map0, target)
    print("Индекс элемента 3 =", index)

    # Поиск по хеш-таблице в связном списке
    head: ListNode = list_to_linked_list(nums)
    # Создаём хеш-таблицу
    map1 = dict[int, ListNode]()
    while head:
        map1[head.val] = head  # Ключ — значение узла, значение — сам узел
        head = head.next
    node: ListNode = hashing_search_linkedlist(map1, target)
    print("Узел со значением 3:", node)
