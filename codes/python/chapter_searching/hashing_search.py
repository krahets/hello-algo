"""
File: hashing_search.py
Created Time: 2022-11-26
Author: timi (xisunyy@163.com)
"""

import sys, os.path as osp
sys.path.append(osp.dirname(osp.dirname(osp.abspath(__file__))))
from include import *

""" 哈希查找（数组） """
def hashing_search(mapp, target):
    # 哈希表的 key: 目标元素，value: 索引
    # 若哈希表中无此 key ，返回 -1
    return mapp.get(target, -1)

"""  哈希查找（链表） """
def hashing_search1(mapp, target):
    # 哈希表的 key: 目标元素，value: 结点对象
    # 若哈希表中无此 key ，返回 -1
    return mapp.get(target, -1)


""" Driver Code """
if __name__ == '__main__':
    target = 3
    
    # 哈希查找（数组）
    nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8]
    # 初始化哈希表
    mapp = {}
    for i in range(len(nums)):
        mapp[nums[i]] = i       # key: 元素，value: 索引
    index = hashing_search(mapp, target)
    print("目标元素 3 的索引 =", index)

    # 哈希查找（链表）
    head = list_to_linked_list(nums)
    # 初始化哈希表
    map1 = {}
    while head:
        map1[head.val] = head  # key: 结点值，value: 结点
        head = head.next
    node = hashing_search1(map1, target)
    print("目标结点值 3 的对应结点对象为", node)
