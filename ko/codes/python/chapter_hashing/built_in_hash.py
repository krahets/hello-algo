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
    num = 3
    hash_num = hash(num)
    print(f"정수 {num}의 해시값은 {hash_num}이다")

    bol = True
    hash_bol = hash(bol)
    print(f"불리언 {bol}의 해시값은 {hash_bol}이다")

    dec = 3.14159
    hash_dec = hash(dec)
    print(f"소수 {dec}의 해시값은 {hash_dec}이다")

    str = "Hello 算法"
    hash_str = hash(str)
    print(f"문자열 {str}의 해시값은 {hash_str}이다")

    tup = (12836, "小哈")
    hash_tup = hash(tup)
    print(f"튜플 {tup}의 해시값은 {hash(hash_tup)}이다")

    obj = ListNode(0)
    hash_obj = hash(obj)
    print(f"노드 객체 {obj}의 해시값은 {hash_obj}이다")
