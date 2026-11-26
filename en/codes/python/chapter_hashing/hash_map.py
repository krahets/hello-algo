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
    # Initialize the hash table
    hmap = dict[int, str]()

    # Insert a key-value pair
    # Insert the pair (key, value) into the hash table
    hmap[12836] = "Xiao Ha"
    hmap[15937] = "Xiao Luo"
    hmap[16750] = "Xiao Suan"
    hmap[13276] = "Xiao Fa"
    hmap[10583] = "Xiao Ya"
    print("\nHash table after insertion:\nKey -> Value")
    print_dict(hmap)

    # Look up a value
    # Look up key in the hash table to get value
    name: str = hmap[15937]
    print("\nName for student ID 15937: " + name)

    # Remove a key-value pair
    # Remove the pair (key, value) from the hash table
    hmap.pop(10583)
    print("\nHash table after removing 10583:\nKey -> Value")
    print_dict(hmap)

    # Iterate over the hash table
    print("\nIterate over key-value pairs (Key->Value)")
    for key, value in hmap.items():
        print(key, "->", value)

    print("\nIterate over keys only")
    for key in hmap.keys():
        print(key)

    print("\nIterate over values only")
    for val in hmap.values():
        print(val)
