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
    """Chained address hash table"""

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
        # Traverse the bucket, if the key is found, return the corresponding val
        for pair in bucket:
            if pair.key == key:
                return pair.val
        # If the key is not found, return None
        return None

    def put(self, key: int, val: str):
        """Add operation"""
        # When the load factor exceeds the threshold, perform expansion
        if self.load_factor() > self.load_thres:
            self.extend()
        index = self.hash_func(key)
        bucket = self.buckets[index]
        # Traverse the bucket, if the specified key is encountered, update the corresponding val and return
        for pair in bucket:
            if pair.key == key:
                pair.val = val
                return
        # If the key is not found, add the key-value pair to the end
        pair = Pair(key, val)
        bucket.append(pair)
        self.size += 1

    def remove(self, key: int):
        """Remove operation"""
        index = self.hash_func(key)
        bucket = self.buckets[index]
        # Traverse the bucket, remove the key-value pair from it
        for pair in bucket:
            if pair.key == key:
                bucket.remove(pair)
                self.size -= 1
                break

    def extend(self):
        """Extend hash table"""
        # Temporarily store the original hash table
        buckets = self.buckets
        # Initialize the extended new hash table
        self.capacity *= self.extend_ratio
        self.buckets = [[] for _ in range(self.capacity)]
        self.size = 0
        # Move key-value pairs from the original hash table to the new hash table
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
    hashmap.put(12836, "Ha")
    hashmap.put(15937, "Luo")
    hashmap.put(16750, "Suan")
    hashmap.put(13276, "Fa")
    hashmap.put(10583, "Ya")
    print("\nAfter adding, the hash table is\n[Key1 -> Value1, Key2 -> Value2, ...]")
    hashmap.print()

    # Query operation
    # Enter key to the hash table, get value
    name = hashmap.get(13276)
    print("\nEnter student ID 13276, found name " + name)

    # Remove operation
    # Remove key-value pair (key, value) from the hash table
    hashmap.remove(12836)
    print("\nAfter removing 12836, the hash table is\n[Key1 -> Value1, Key2 -> Value2, ...]")
    hashmap.print()
