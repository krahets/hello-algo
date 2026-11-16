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
    print(f"整數 {num} 的雜湊值為 {hash_num}")
    # 整數 3 的雜湊值為 3

    bol = True
    hash_bol = hash(bol)
    print(f"布林量 {bol} 的雜湊值為 {hash_bol}")
    # 布林量 True 的雜湊值為 1

    dec = 3.14159
    hash_dec = hash(dec)
    print(f"小數 {dec} 的雜湊值為 {hash_dec}")
    # 小數 3.14159 的雜湊值為 326484311674566659

    str = "Hello 演算法"
    hash_str = hash(str)
    print(f"字串“{str}”的雜湊值為 {hash_str}")
    # 字串“Hello 演算法”的雜湊值為 4617003410720528961

    tup = (12836, "小哈")
    hash_tup = hash(tup)
    print(f"元組 {tup} 的雜湊值為 {hash_tup}")
    # 元組 (12836, '小哈') 的雜湊值為 1029005403108185979

    obj = ListNode(0)
    hash_obj = hash(obj)
    print(f"節點物件 {obj} 的雜湊值為 {hash_obj}")
    # 節點物件 <modules.list_node.ListNode object at 0x1058fd810> 的雜湊值為 274267521
    # [endregion]{builtin_hash}
