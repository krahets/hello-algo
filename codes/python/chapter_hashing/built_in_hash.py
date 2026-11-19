"""
File: built_in_hash.py
Created Time: 2023-06-15
Author: krahets (krahets@163.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import ListNode

"""Driver Code"""
if __name__ == "__main__":
    # [region]{builtin_hash}
    num = 3
    hash_num = hash(num)
    print(f"整数 {num} 的哈希值为 {hash_num}")
    # 整数 3 的哈希值为 3

    bol = True
    hash_bol = hash(bol)
    print(f"布尔量 {bol} 的哈希值为 {hash_bol}")
    # 布尔量 True 的哈希值为 1

    dec = 3.14159
    hash_dec = hash(dec)
    print(f"小数 {dec} 的哈希值为 {hash_dec}")
    # 小数 3.14159 的哈希值为 326484311674566659

    str = "Hello 算法"
    hash_str = hash(str)
    print(f"字符串“{str}”的哈希值为 {hash_str}")
    # 字符串“Hello 算法”的哈希值为 4617003410720528961

    tup = (12836, "小哈")
    hash_tup = hash(tup)
    print(f"元组 {tup} 的哈希值为 {hash_tup}")
    # 元组 (12836, '小哈') 的哈希值为 1029005403108185979

    obj = ListNode(0)
    hash_obj = hash(obj)
    print(f"节点对象 {obj} 的哈希值为 {hash_obj}")
    # 节点对象 <modules.list_node.ListNode object at 0x1058fd810> 的哈希值为 274267521
    # [endregion]{builtin_hash}
