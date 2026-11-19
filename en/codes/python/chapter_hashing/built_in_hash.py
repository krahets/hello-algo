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
    # [region]{builtin_hash}
    num = 3
    hash_num = hash(num)
    print(f"Integer {num} has hash value {hash_num}")
    # Integer 3 has hash value 3

    bol = True
    hash_bol = hash(bol)
    print(f"Boolean {bol} has hash value {hash_bol}")
    # Boolean True has hash value 1

    dec = 3.14159
    hash_dec = hash(dec)
    print(f"Floating-point number {dec} has hash value {hash_dec}")
    # Floating-point number 3.14159 has hash value 326484311674566659

    str = "Hello 算法"
    hash_str = hash(str)
    print(f"String '{str}' has hash value {hash_str}")
    # String 'Hello 算法' has hash value 4617003410720528961

    tup = (12836, "小哈")
    hash_tup = hash(tup)
    print(f"Tuple {tup} has hash value {hash_tup}")
    # Tuple (12836, '小哈') has hash value 1029005403108185979

    obj = ListNode(0)
    hash_obj = hash(obj)
    print(f"Node object {obj} has hash value {hash_obj}")
    # Node object <modules.list_node.ListNode object at 0x1058fd810> has hash value 274267521
    # [endregion]{builtin_hash}
