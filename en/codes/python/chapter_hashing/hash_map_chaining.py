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
    """Hash table with chaining"""

    def __init__(self):
        """Constructor"""
        self.size = 0  # Number of key-value pairs
        self.capacity = 4  # Hash table capacity
        self.load_thres = 2.0 / 3.0  # Load factor threshold for resizing
        self.extend_ratio = 2  # Growth factor
        self.buckets = [[] for _ in range(self.capacity)]  # Bucket array

    def hash_func(self, key: int) -> int:
        """Hash function"""
        return key % self.capacity

    def load_factor(self) -> float:
        """Load factor"""
        return self.size / self.capacity

    def get(self, key: int) -> str | None:
        """Look up a value"""
        index = self.hash_func(key)
        bucket = self.buckets[index]
        # Scan the bucket and return the corresponding val if key is found
        for pair in bucket:
            if pair.key == key:
                return pair.val
        # Return None if key is absent
        return None

    def put(self, key: int, val: str):
        """Insert a key-value pair"""
        # Expand the table when the load factor exceeds the threshold
        if self.load_factor() > self.load_thres:
            self.extend()
        index = self.hash_func(key)
        bucket = self.buckets[index]
        # Scan the bucket. If the specified key is found, update its val and return
        for pair in bucket:
            if pair.key == key:
                pair.val = val
                return
        # If key is absent, append the pair to the end of the list
        pair = Pair(key, val)
        bucket.append(pair)
        self.size += 1

    def remove(self, key: int):
        """Remove a key-value pair"""
        index = self.hash_func(key)
        bucket = self.buckets[index]
        # Scan the bucket and remove the pair
        for pair in bucket:
            if pair.key == key:
                bucket.remove(pair)
                self.size -= 1
                break

    def extend(self):
        """Expand the hash table"""
        # Save the original hash table
        buckets = self.buckets
        # Initialize the larger hash table
        self.capacity *= self.extend_ratio
        self.buckets = [[] for _ in range(self.capacity)]
        self.size = 0
        # Move the key-value pairs from the old table into the new one
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


"""Driver Code"""
if __name__ == "__main__":
    # Initialize the hash table
    hashmap = HashMapChaining()

    # Insert a key-value pair
    # Insert the pair (key, value) into the hash table
    hashmap.put(12836, "Xiao Ha")
    hashmap.put(15937, "Xiao Luo")
    hashmap.put(16750, "Xiao Suan")
    hashmap.put(13276, "Xiao Fa")
    hashmap.put(10583, "Xiao Ya")
    print("\nHash table after insertion:\n[Key1 -> Value1, Key2 -> Value2, ...]")
    hashmap.print()

    # Look up a value
    # Look up key in the hash table to get value
    name = hashmap.get(13276)
    print("\nName for student ID 13276: " + name)

    # Remove a key-value pair
    # Remove the pair (key, value) from the hash table
    hashmap.remove(12836)
    print("\nHash table after removing 12836:\n[Key1 -> Value1, Key2 -> Value2, ...]")
    hashmap.print()
