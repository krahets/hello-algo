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
    print(f"정수 {num} → 해시값: {hash_num}")

    bol = True
    hash_bol = hash(bol)
    print(f"불리언 값 {bol} → 해시값: {hash_bol}")

    dec = 3.14159
    hash_dec = hash(dec)
    print(f"소수 {dec} → 해시값: {hash_dec}")

    str = "Hello 算法"
    hash_str = hash(str)
    print(f"문자열 {str}의 해시값은 {hash_str}이다")

    tup = (12836, "小哈")
    hash_tup = hash(tup)
    print(f"튜플 {tup} → 해시값: {hash_tup}")

    obj = ListNode(0)
    hash_obj = hash(obj)
    print(f"노드 객체 {obj} → 해시값: {hash_obj}")
