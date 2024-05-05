"""
File: hash_map_open_addressing.py
Created Time: 2023-06-13
Author: krahets (krahets@163.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from chapter_hashing.array_hash_map import Pair


class HashMapOpenAddressing:
    """Open addressing hash table"""

    def __init__(self):
        """Constructor"""
        self.size = 0  # Number of key-value pairs
        self.capacity = 4  # Hash table capacity
        self.load_thres = 2.0 / 3.0  # Load factor threshold for triggering expansion
        self.extend_ratio = 2  # Expansion multiplier
        self.buckets: list[Pair | None] = [None] * self.capacity  # Bucket array
        self.TOMBSTONE = Pair(-1, "-1")  # Removal mark

    def hash_func(self, key: int) -> int:
        """Hash function"""
        return key % self.capacity

    def load_factor(self) -> float:
        """Load factor"""
        return self.size / self.capacity

    def find_bucket(self, key: int) -> int:
        """Search for the bucket index corresponding to key"""
        index = self.hash_func(key)
        first_tombstone = -1
        # Linear probing, break when encountering an empty bucket
        while self.buckets[index] is not None:
            # If the key is encountered, return the corresponding bucket index
            if self.buckets[index].key == key:
                # If a removal mark was encountered earlier, move the key-value pair to that index
                if first_tombstone != -1:
                    self.buckets[first_tombstone] = self.buckets[index]
                    self.buckets[index] = self.TOMBSTONE
                    return first_tombstone  # Return the moved bucket index
                return index  # Return bucket index
            # Record the first encountered removal mark
            if first_tombstone == -1 and self.buckets[index] is self.TOMBSTONE:
                first_tombstone = index
            # Calculate the bucket index, return to the head if exceeding the tail
            index = (index + 1) % self.capacity
        # If the key does not exist, return the index of the insertion point
        return index if first_tombstone == -1 else first_tombstone

    def get(self, key: int) -> str:
        """Query operation"""
        # Search for the bucket index corresponding to key
        index = self.find_bucket(key)
        # If the key-value pair is found, return the corresponding val
        if self.buckets[index] not in [None, self.TOMBSTONE]:
            return self.buckets[index].val
        # If the key-value pair does not exist, return None
        return None

    def put(self, key: int, val: str):
        """Add operation"""
        # When the load factor exceeds the threshold, perform expansion
        if self.load_factor() > self.load_thres:
            self.extend()
        # Search for the bucket index corresponding to key
        index = self.find_bucket(key)
        # If the key-value pair is found, overwrite val and return
        if self.buckets[index] not in [None, self.TOMBSTONE]:
            self.buckets[index].val = val
            return
        # If the key-value pair does not exist, add the key-value pair
        self.buckets[index] = Pair(key, val)
        self.size += 1

    def remove(self, key: int):
        """Remove operation"""
        # Search for the bucket index corresponding to key
        index = self.find_bucket(key)
        # If the key-value pair is found, cover it with a removal mark
        if self.buckets[index] not in [None, self.TOMBSTONE]:
            self.buckets[index] = self.TOMBSTONE
            self.size -= 1

    def extend(self):
        """Extend hash table"""
        # Temporarily store the original hash table
        buckets_tmp = self.buckets
        # Initialize the extended new hash table
        self.capacity *= self.extend_ratio
        self.buckets = [None] * self.capacity
        self.size = 0
        # Move key-value pairs from the original hash table to the new hash table
        for pair in buckets_tmp:
            if pair not in [None, self.TOMBSTONE]:
                self.put(pair.key, pair.val)

    def print(self):
        """Print hash table"""
        for pair in self.buckets:
            if pair is None:
                print("None")
            elif pair is self.TOMBSTONE:
                print("TOMBSTONE")
            else:
                print(pair.key, "->", pair.val)


"""Driver Code"""
if __name__ == "__main__":
    # Initialize hash table
    hashmap = HashMapOpenAddressing()

    # Add operation
    # Add key-value pair (key, val) to the hash table
    hashmap.put(12836, "Ha")
    hashmap.put(15937, "Luo")
    hashmap.put(16750, "Suan")
    hashmap.put(13276, "Fa")
    hashmap.put(10583, "Ya")
    print("\nAfter adding, the hash table is\nKey -> Value")
    hashmap.print()

    # Query operation
    # Enter key to the hash table, get value val
    name = hashmap.get(13276)
    print("\nEnter student ID 13276, found name " + name)

    # Remove operation
    # Remove key-value pair (key, val) from the hash table
    hashmap.remove(16750)
    print("\nAfter removing 16750, the hash table is\nKey -> Value")
    hashmap.print()
