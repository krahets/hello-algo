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
    print(f"整数 {num} のハッシュ値は {hash_num}")

    bol = True
    hash_bol = hash(bol)
    print(f"ブール値 {bol} のハッシュ値は {hash_bol}")

    dec = 3.14159
    hash_dec = hash(dec)
    print(f"小数 {dec} のハッシュ値は {hash_dec}")

    str = "Hello algorithm"
    hash_str = hash(str)
    print(f"文字列 {str} のハッシュ値は {hash_str}")

    tup = (12836, "Ha")
    hash_tup = hash(tup)
    print(f"タプル {tup} のハッシュ値は {hash(hash_tup)}")

    obj = ListNode(0)
    hash_obj = hash(obj)
    print(f"ノードオブジェクト {obj} のハッシュ値は {hash_obj}")