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
    print(f"Хеш-значение целого числа {num} = {hash_num}")
    # Хеш-значение целого числа 3 = 3

    bol = True
    hash_bol = hash(bol)
    print(f"Хеш-значение булева значения {bol} = {hash_bol}")
    # Хеш-значение булева значения True = 1

    dec = 3.14159
    hash_dec = hash(dec)
    print(f"Хеш-значение десятичного числа {dec} = {hash_dec}")
    # Хеш-значение десятичного числа 3.14159 = 326484311674566659

    str = "Hello Algo"
    hash_str = hash(str)
    print(f"Хеш-значение строки «{str}» = {hash_str}")
    # Хеш-значение строки «Hello Algo» = 4617003410720528961

    tup = (12836, "Сяо Ха")
    hash_tup = hash(tup)
    print(f"Хеш-значение кортежа {tup} = {hash_tup}")
    # Хеш-значение кортежа (12836, 'Сяо Ха') = 1029005403108185979

    obj = ListNode(0)
    hash_obj = hash(obj)
    print(f"Хеш-значение объекта узла {obj} = {hash_obj}")
    # Хеш-значение объекта узла <modules.list_node.ListNode object at 0x1058fd810> = 274267521
    # [endregion]{builtin_hash}
