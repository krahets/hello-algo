"""
File: hashing_search.py
Created Time: 2022-11-26
Author: timi (xisunyy@163.com)
"""

import sys, os.path as osp
sys.path.append(osp.dirname(osp.dirname(osp.abspath(__file__))))
from modules import *

def hashing_search_array(mapp: Dict[int, int], target: int) -> int:
    """ 哈希查找（数组） """
    # 哈希表的 key: 目标元素，value: 索引
    # 若哈希表中无此 key ，返回 -1
    return mapp.get(target, -1)

def hashing_search_linkedlist(mapp: Dict[int, ListNode], target: int) -> Optional[ListNode]:
    """ 哈希查找（链表） """
    # 哈希表的 key: 目标元素，value: 结点对象
    # 若哈希表中无此 key ，返回 None
    return mapp.get(target, None)


""" Driver Code """
if __name__ == '__main__':
    target: int = 3
    
    # 哈希查找（数组）
    nums: List[int] = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8]
    # 初始化哈希表
    mapp: Dict[int, int] = {}
    for i in range(len(nums)):
        mapp[nums[i]] = i       # key: 元素，value: 索引
    index: int = hashing_search_array(mapp, target)
    print("目标元素 3 的索引 =", index)

    # 哈希查找（链表）
    head: ListNode = list_to_linked_list(nums)
    # 初始化哈希表
    map1: Dict[int, ListNode] = {}
    while head:
        map1[head.val] = head  # key: 结点值，value: 结点
        head = head.next
    node: ListNode = hashing_search_linkedlist(map1, target)
    print("目标结点值 3 的对应结点对象为", node)
