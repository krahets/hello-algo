"""
File: hash_map.py
Created Time: 2022-12-14
Author: msk397 (machangxinq@gmail.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import print_dict

"""Driver code"""
if __name__ == "__main__":
    # [region]{init_hash_map}
    # Initialize the hash table
    hmap = dict[int, str]()
    # [endregion]{init_hash_map}

    # [region]{add_pairs}
    # Insert operation
    # Insert the key-value pair (key, value) into the hash table
    hmap[12836] = "小哈"
    hmap[15937] = "小啰"
    hmap[16750] = "小算"
    hmap[13276] = "小法"
    hmap[10583] = "小鸭"
    # [endregion]{add_pairs}
    print("\nHash table after insertion:\nKey -> Value")
    print_dict(hmap)

    # [region]{get_value}
    # Lookup operation
    # Look up key in the hash table to obtain value
    name: str = hmap[15937]
    # [endregion]{get_value}
    print("\nLook up student ID 15937 to obtain the name " + name)

    # [region]{remove_pair}
    # Remove operation
    # Remove the key-value pair (key, value) from the hash table
    hmap.pop(10583)
    # [endregion]{remove_pair}
    print("\nHash table after removing 10583:\nKey -> Value")
    print_dict(hmap)

    print("\nTraverse key-value pairs: Key->Value")
    # [region]{iterate_pairs}
    # Traverse the hash table
    # Traverse key-value pairs: key->value
    for key, value in hmap.items():
        print(key, "->", value)
    # [endregion]{iterate_pairs}

    print("\nTraverse keys only: Key")
    # [region]{iterate_keys}
    # Traverse keys only: key
    for key in hmap.keys():
        print(key)
    # [endregion]{iterate_keys}

    print("\nTraverse values only: Value")
    # [region]{iterate_values}
    # Traverse values only: value
    for val in hmap.values():
        print(val)
    # [endregion]{iterate_values}
