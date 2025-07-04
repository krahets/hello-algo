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
    """哈希查找（数组）"""
    # 哈希表的 key: 目标元素，value: 索引
    # 若哈希表中无此 key ，返回 -1
    return hmap.get(target, -1)


def hashing_search_linkedlist(
    hmap: dict[int, ListNode], target: int
) -> ListNode | None:
    """哈希查找（链表）"""
    # 哈希表的 key: 目标元素，value: 节点对象
    # 若哈希表中无此 key ，返回 None
    return hmap.get(target, None)


"""Driver Code"""
if __name__ == "__main__":
    target = 3

    # 哈希查找（数组）
    nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8]
    # 初始化哈希表
    map0 = dict[int, int]()
    for i in range(len(nums)):
        map0[nums[i]] = i  # key: 元素，value: 索引
    index: int = hashing_search_array(map0, target)
    print("目标元素 3 的索引 =", index)

    # 哈希查找（链表）
    head: ListNode = list_to_linked_list(nums)
    # 初始化哈希表
    map1 = dict[int, ListNode]()
    while head:
        map1[head.val] = head  # key: 节点值，value: 节点
        head = head.next
    node: ListNode = hashing_search_linkedlist(map1, target)
    print("目标节点值 3 的对应节点对象为", node)
