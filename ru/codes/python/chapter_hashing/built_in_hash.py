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
    print(f"Хеш-значение целого числа {num} равно {hash_num}")

    bol = True
    hash_bol = hash(bol)
    print(f"Хеш-значение логического значения {bol} равно {hash_bol}")

    dec = 3.14159
    hash_dec = hash(dec)
    print(f"Хеш-значение десятичного числа {dec} равно {hash_dec}")

    str = "Hello Algo"
    hash_str = hash(str)
    print(f"Хеш-значение строки {str} равно {hash_str}")

    tup = (12836, "Сяо Ха")
    hash_tup = hash(tup)
    print(f"Хеш-значение кортежа {tup} равно {hash(hash_tup)}")

    obj = ListNode(0)
    hash_obj = hash(obj)
    print(f"объект узла {obj} равно {hash_obj}")
