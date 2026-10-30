"""
File: hash_map_chaining.py
Created Time: 2023-06-13
Author: krahets (krahets@163.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from chapter_hashing.array_hash_map import Pair


class HashMapChaining:
    """Hash table with separate chaining"""

    def __init__(self):
        """Constructor"""
        self.size = 0  # Number of key-value pairs
        self.capacity = 4  # Hash table capacity
        self.load_thres = 2.0 / 3.0  # Load factor threshold that triggers capacity growth
        self.extend_ratio = 2  # Capacity growth factor
        self.buckets = [[] for _ in range(self.capacity)]  # Bucket array

    def hash_func(self, key: int) -> int:
        """Hash function"""
        return key % self.capacity

    def load_factor(self) -> float:
        """Load factor"""
        return self.size / self.capacity

    def get(self, key: int) -> str | None:
        """Lookup operation"""
        index = self.hash_func(key)
        bucket = self.buckets[index]
        # Traverse the bucket; if key is found, return its corresponding val
        for pair in bucket:
            if pair.key == key:
                return pair.val
        # Return None if key is not found
        return None

    def put(self, key: int, val: str):
        """Insert operation"""
        # Grow the capacity when the load factor exceeds the threshold
        if self.load_factor() > self.load_thres:
            self.extend()
        index = self.hash_func(key)
        bucket = self.buckets[index]
        # Traverse the bucket; if the specified key is found, update its val and return
        for pair in bucket:
            if pair.key == key:
                pair.val = val
                return
        # If key is absent, append the key-value pair at the end
        pair = Pair(key, val)
        bucket.append(pair)
        self.size += 1

    def remove(self, key: int):
        """Remove operation"""
        index = self.hash_func(key)
        bucket = self.buckets[index]
        # Traverse the bucket and remove the key-value pair
        for pair in bucket:
            if pair.key == key:
                bucket.remove(pair)
                self.size -= 1
                break

    def extend(self):
        """Grow the hash table capacity"""
        # Keep a reference to the original hash table
        buckets = self.buckets
        # Initialize a new hash table with the expanded capacity
        self.capacity *= self.extend_ratio
        self.buckets = [[] for _ in range(self.capacity)]
        self.size = 0
        # Move the key-value pairs from the original hash table to the new one
        for bucket in buckets:
            for pair in bucket:
                self.put(pair.key, pair.val)

    def print(self):
        """Print the hash table"""
        for bucket in self.buckets:
            res = []
            for pair in bucket:
                res.append(str(pair.key) + " -> " + pair.val)
            print(res)


"""Driver code"""
if __name__ == "__main__":
    # Initialize the hash table
    hashmap = HashMapChaining()

    # Insert operation
    # Insert the key-value pair (key, value) into the hash table
    hashmap.put(12836, "小哈")
    hashmap.put(15937, "小啰")
    hashmap.put(16750, "小算")
    hashmap.put(13276, "小法")
    hashmap.put(10583, "小鸭")
    print("\nHash table after insertion:\n[Key1 -> Value1, Key2 -> Value2, ...]")
    hashmap.print()

    # Lookup operation
    # Look up key in the hash table to obtain value
    name = hashmap.get(13276)
    print("\nLook up student ID 13276 to obtain the name " + name)

    # Remove operation
    # Remove the key-value pair (key, value) from the hash table
    hashmap.remove(12836)
    print("\nHash table after removing 12836:\n[Key1 -> Value1, Key2 -> Value2, ...]")
    hashmap.print()
