"""
File: hash_map.py
Created Time: 2022-12-14
Author: msk397 (machangxinq@gmail.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import print_dict

"""Driver Code"""
if __name__ == "__main__":
    # Initialize hash table
    hmap = dict[int, str]()

    # Add operation
    # Add key-value pair (key, value) to the hash table
    hmap[12836] = "Ha"
    hmap[15937] = "Luo"
    hmap[16750] = "Suan"
    hmap[13276] = "Fa"
    hmap[10583] = "Ya"
    print("\nAfter adding, the hash table is\nKey -> Value")
    print_dict(hmap)

    # Query operation
    # Enter key to the hash table, get value
    name: str = hmap[15937]
    print("\nEnter student ID 15937, found name " + name)

    # Remove operation
    # Remove key-value pair (key, value) from the hash table
    hmap.pop(10583)
    print("\nAfter removing 10583, the hash table is\nKey -> Value")
    print_dict(hmap)

    # Traverse hash table
    print("\nTraverse key-value pairs Key->Value")
    for key, value in hmap.items():
        print(key, "->", value)

    print("\nIndividually traverse keys Key")
    for key in hmap.keys():
        print(key)

    print("\nIndividually traverse values Value")
    for val in hmap.values():
        print(val)
