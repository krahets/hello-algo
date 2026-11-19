"""
File: built_in_hash.py
Created Time: 2023-06-15
Author: krahets (krahets@163.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import ListNode

"""実行用コード"""
if __name__ == "__main__":
    # [region]{builtin_hash}
    num = 3
    hash_num = hash(num)
    print(f"整数 {num} のハッシュ値は {hash_num}")
    # 整数 3 のハッシュ値は 3

    bol = True
    hash_bol = hash(bol)
    print(f"真偽値 {bol} のハッシュ値は {hash_bol}")
    # 真偽値 True のハッシュ値は 1

    dec = 3.14159
    hash_dec = hash(dec)
    print(f"小数 {dec} のハッシュ値は {hash_dec}")
    # 小数 3.14159 のハッシュ値は 326484311674566659

    str = "Hello 算法"
    hash_str = hash(str)
    print(f"文字列「{str}」のハッシュ値は {hash_str}")
    # 文字列「Hello 算法」のハッシュ値は 4617003410720528961

    tup = (12836, "小哈")
    hash_tup = hash(tup)
    print(f"タプル {tup} のハッシュ値は {hash_tup}")
    # タプル (12836, '小哈') のハッシュ値は 1029005403108185979

    obj = ListNode(0)
    hash_obj = hash(obj)
    print(f"ノードオブジェクト {obj} のハッシュ値は {hash_obj}")
    # ノードオブジェクト <modules.list_node.ListNode object at 0x1058fd810> のハッシュ値は 274267521
    # [endregion]{builtin_hash}
