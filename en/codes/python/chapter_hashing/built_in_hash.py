"""
File: built_in_hash.py
Created Time: 2023-06-15
Author: krahets (krahets@163.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import ListNode

"""Driver code"""
if __name__ == "__main__":
    num = 3
    hash_num = hash(num)
    print(f"Hash value of integer {num}: {hash_num}")

    bol = True
    hash_bol = hash(bol)
    print(f"Hash value of Boolean {bol}: {hash_bol}")

    dec = 3.14159
    hash_dec = hash(dec)
    print(f"Hash value of floating-point number {dec}: {hash_dec}")

    str = "Hello 算法"
    hash_str = hash(str)
    print(f"Hash value of string {str}: {hash_str}")

    tup = (12836, "小哈")
    hash_tup = hash(tup)
    print(f"Hash of the hash value of tuple {tup}: {hash(hash_tup)}")

    obj = ListNode(0)
    hash_obj = hash(obj)
    print(f"Hash value of node object {obj}: {hash_obj}")
