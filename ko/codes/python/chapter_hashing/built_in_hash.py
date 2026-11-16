"""
File: built_in_hash.py
Created Time: 2023-06-15
Author: krahets (krahets@163.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import ListNode

"""실행 코드"""
if __name__ == "__main__":
    # [region]{builtin_hash}
    num = 3
    hash_num = hash(num)
    print(f"정수 {num} → 해시값: {hash_num}")
    # 정수 3 → 해시값: 3

    bol = True
    hash_bol = hash(bol)
    print(f"불리언 값 {bol} → 해시값: {hash_bol}")
    # 불리언 값 True → 해시값: 1

    dec = 3.14159
    hash_dec = hash(dec)
    print(f"소수 {dec} → 해시값: {hash_dec}")
    # 소수 3.14159 → 해시값: 326484311674566659

    str = "Hello 算法"
    hash_str = hash(str)
    print(f"문자열 ‘{str}’ → 해시값: {hash_str}")
    # 문자열 ‘Hello 算法’ → 해시값: 4617003410720528961

    tup = (12836, "小哈")
    hash_tup = hash(tup)
    print(f"튜플 {tup} → 해시값: {hash_tup}")
    # 튜플 (12836, '小哈') → 해시값: 1029005403108185979

    obj = ListNode(0)
    hash_obj = hash(obj)
    print(f"노드 객체 {obj} → 해시값: {hash_obj}")
    # 노드 객체 <modules.list_node.ListNode object at 0x1058fd810> → 해시값: 274267521
    # [endregion]{builtin_hash}
