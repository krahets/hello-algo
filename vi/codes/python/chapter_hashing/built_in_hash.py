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
    print(f"Hash value of integer {num} is {hash_num}")

    bol = True
    hash_bol = hash(bol)
    print(f"Hash value of boolean {bol} is {hash_bol}")

    dec = 3.14159
    hash_dec = hash(dec)
    print(f"Hash value of decimal {dec} is {hash_dec}")

    str = "Hello algo"
    hash_str = hash(str)
    print(f"Hash value of string {str} is {hash_str}")

    tup = (12836, "Xiao Ha")
    hash_tup = hash(tup)
    print(f"Hash value of tuple {tup} is {hash(hash_tup)}")

    obj = ListNode(0)
    hash_obj = hash(obj)
    print(f"Hash value of node object {obj} is {hash_obj}")
