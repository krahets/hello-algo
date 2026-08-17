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
        self.load_thres = 2.0 / 3.0  # Load factor threshold for triggering expansion
        self.extend_ratio = 2  # Expansion multiplier
        self.buckets = [[] for _ in range(self.capacity)]  # Bucket array

    def hash_func(self, key: int) -> int:
        """Hash function"""
        return key % self.capacity

    def load_factor(self) -> float:
        """Load factor"""
        return self.size / self.capacity

    def get(self, key: int) -> str | None:
        """Query operation"""
        index = self.hash_func(key)
        bucket = self.buckets[index]
        # Traverse bucket, if key is found, return corresponding val
        for pair in bucket:
            if pair.key == key:
                return pair.val
        # If key is not found, return None
        return None

    def put(self, key: int, val: str):
        """Add operation"""
        # When load factor exceeds threshold, perform expansion
        if self.load_factor() > self.load_thres:
            self.extend()
        index = self.hash_func(key)
        bucket = self.buckets[index]
        # Traverse bucket, if specified key is encountered, update corresponding val and return
        for pair in bucket:
            if pair.key == key:
                pair.val = val
                return
        # If key does not exist, append key-value pair to the end
        pair = Pair(key, val)
        bucket.append(pair)
        self.size += 1

    def remove(self, key: int):
        """Remove operation"""
        index = self.hash_func(key)
        bucket = self.buckets[index]
        # Traverse bucket and remove key-value pair from it
        for pair in bucket:
            if pair.key == key:
                bucket.remove(pair)
                self.size -= 1
                break

    def extend(self):
        """Expand hash table"""
        # Temporarily store the original hash table
        buckets = self.buckets
        # Initialize expanded new hash table
        self.capacity *= self.extend_ratio
        self.buckets = [[] for _ in range(self.capacity)]
        self.size = 0
        # Move key-value pairs from original hash table to new hash table
        for bucket in buckets:
            for pair in bucket:
                self.put(pair.key, pair.val)

    def print(self):
        """Print hash table"""
        for bucket in self.buckets:
            res = []
            for pair in bucket:
                res.append(str(pair.key) + " -> " + pair.val)
            print(res)


"""Driver Code"""
if __name__ == "__main__":
    # Initialize hash table
    hashmap = HashMapChaining()

    # Add operation
    # Add key-value pair (key, value) to the hash table
    hashmap.put(12836, "Xiao Ha")
    hashmap.put(15937, "Xiao Luo")
    hashmap.put(16750, "Xiao Suan")
    hashmap.put(13276, "Xiao Fa")
    hashmap.put(10583, "Xiao Ya")
    print("\nAfter adding, the hash table is\n[Key1 -> Value1, Key2 -> Value2, ...]")
    hashmap.print()

    # Query operation
    # Input key into the hash table to get value
    name = hashmap.get(13276)
    print("\nInput student ID 13276, found name " + name)

    # Remove operation
    # Remove key-value pair (key, value) from the hash table
    hashmap.remove(12836)
    print("\nAfter removing 12836, the hash table is\n[Key1 -> Value1, Key2 -> Value2, ...]")
    hashmap.print()
