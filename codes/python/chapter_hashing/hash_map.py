"""
File: hash_map.py
Created Time: 2022-12-14
Author: msk397 (machangxinq@gmail.com)
"""

import sys, os.path as osp

sys.path.append(osp.dirname(osp.dirname(osp.abspath(__file__))))
from modules import *

"""Driver Code"""
if __name__ == "__main__":
    # 初始化哈希表
    hmap = dict[int, str]()

    # 添加操作
    # 在哈希表中添加键值对 (key, value)
    hmap[12836] = "小哈"
    hmap[15937] = "小啰"
    hmap[16750] = "小算"
    hmap[13276] = "小法"
    hmap[10583] = "小鸭"
    print("\n添加完成后，哈希表为\nKey -> Value")
    print_dict(hmap)

    # 查询操作
    # 向哈希表输入键 key ，得到值 value
    name: str = hmap[15937]
    print("\n输入学号 15937 ，查询到姓名 " + name)

    # 删除操作
    # 在哈希表中删除键值对 (key, value)
    hmap.pop(10583)
    print("\n删除 10583 后，哈希表为\nKey -> Value")
    print_dict(hmap)

    # 遍历哈希表
    print("\n遍历键值对 Key->Value")
    for key, value in hmap.items():
        print(key, "->", value)

    print("\n单独遍历键 Key")
    for key in hmap.keys():
        print(key)

    print("\n单独遍历值 Value")
    for val in hmap.values():
        print(val)
