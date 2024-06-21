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
    print(f"Integer {num}'s hash value is {hash_num}")

    bol = True
    hash_bol = hash(bol)
    print(f"Boolean {bol}'s hash value is {hash_bol}")

    dec = 3.14159
    hash_dec = hash(dec)
    print(f"Decimal {dec}'s hash value is {hash_dec}")

    str = "Hello algorithm"
    hash_str = hash(str)
    print(f"String {str}'s hash value is {hash_str}")

    tup = (12836, "Ha")
    hash_tup = hash(tup)
    print(f"Tuple {tup}'s hash value is {hash(hash_tup)}")

    obj = ListNode(0)
    hash_obj = hash(obj)
    print(f"Node object {obj}'s hash value is {hash_obj}")
