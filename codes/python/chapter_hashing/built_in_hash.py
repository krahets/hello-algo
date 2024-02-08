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
    num = 3
    hash_num = hash(num)
    print(f"整数 {num} 的哈希值为 {hash_num}")

    bol = True
    hash_bol = hash(bol)
    print(f"布尔量 {bol} 的哈希值为 {hash_bol}")

    dec = 3.14159
    hash_dec = hash(dec)
    print(f"小数 {dec} 的哈希值为 {hash_dec}")

    str = "Hello 算法"
    hash_str = hash(str)
    print(f"字符串 {str} 的哈希值为 {hash_str}")

    tup = (12836, "小哈")
    hash_tup = hash(tup)
    print(f"元组 {tup} 的哈希值为 {hash(hash_tup)}")

    obj = ListNode(0)
    hash_obj = hash(obj)
    print(f"节点对象 {obj} 的哈希值为 {hash_obj}")
