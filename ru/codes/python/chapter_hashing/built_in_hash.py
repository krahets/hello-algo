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
    print(f"Целое число {num} имеет хеш {hash_num}")

    bol = True
    hash_bol = hash(bol)
    print(f"Логическое значение {bol} имеет хеш {hash_bol}")

    dec = 3.14159
    hash_dec = hash(dec)
    print(f"Вещественное число {dec} имеет хеш {hash_dec}")

    str = "Hello 算法"
    hash_str = hash(str)
    print(f"Строка {str} имеет хеш {hash_str}")

    tup = (12836, "小哈")
    hash_tup = hash(tup)
    print(f"Кортеж {tup} имеет хеш {hash_tup}")

    obj = ListNode(0)
    hash_obj = hash(obj)
    print(f"Объект узла {obj} имеет хеш {hash_obj}")
